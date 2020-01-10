package com.apcsa.data;
//imports all necessarily built-in java utilities that will be used throughout the system
import java.io.BufferedReader; //enables the program to read user input without decreasing program efficiency
import java.io.File; //abstract -- essentially just teaches the program how to interact with the directory
import java.io.FileNotFoundException; //allows the program to signal when it is unable to find a specified file
import java.io.FileReader; //allows the program to read data from a file
import java.io.IOException; //signals the failure of any I/O operation
import java.sql.Connection; //enables the program to connect to the database and access information from it
import java.sql.DriverManager; //enables the program to load JDBC drivers
import java.sql.PreparedStatement; //enables the program to create pre-compiled SQL statements - especially important for this because it must regularly add and delete information from the database
import java.sql.ResultSet; //a table of data created out of specified selected parts of a database
import java.sql.SQLException; //signals the failure of a SQL operation
import java.sql.Statement; //used to execute a static SQL statement
import java.sql.Timestamp; //allows the JDBC API to recognize java dates as SQL TIMESTAMP values
import java.util.ArrayList;
import java.util.Date;
import com.apcsa.controller.Utils;
import com.apcsa.model.Administrator;
import com.apcsa.model.Student;
import com.apcsa.model.Teacher;
import com.apcsa.model.User;

public class PowerSchool {

    private final static String PROTOCOL = "jdbc:sqlite:";
    private final static String DATABASE_URL = "data/powerschool.db";//defines path to database

    /**
     * Initializes the database if needed (or if requested).
     *
     * @param force whether or not to force-reset the database
     * @throws Exception
     */

    public static void initialize(boolean force) {
        if (force) {
            reset(); // force reset
        } else {
            boolean required = false;

            // check if all tables have been created and loaded in database

            try (Connection conn = getConnection();
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(QueryUtils.SETUP_SQL)) {

                while (rs.next()) {
                    if (rs.getInt("names") != 9) {
                        required = true;
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            // build database if needed

            if (required) {
                reset();
            }
        }
    }


    /**
     * Retrieves the User object associated with the requested login.
     *
     * @param username the username of the requested User
     * @param password the password of the requested User
     * @return the User object for valid logins; null for invalid logins
     */

    public static User login(String username, String password) {
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(QueryUtils.LOGIN_SQL)) {

            stmt.setString(1, username);
            stmt.setString(2, Utils.getHash(password));

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Timestamp ts = new Timestamp(new Date().getTime()); //marks the time that the user logs in so they can check when the last time they logged in was
                    int affected = PowerSchool.updateLastLogin(conn, username, ts); //calls the function that will actually change the last login time

                    if (affected != 1) {
                        System.err.println("Unable to update last login (affected rows: " + affected + ")."); //error message thrown in the event that the program can not update the user's last login
                    }
                    return new User(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * Returns the administrator account associated with the user.
     *
     * @param user the user
     * @return the administrator account if it exists
     */

    public static User getAdministrator(User user) {
        try (Connection conn = getConnection();
                PreparedStatement stmt = conn.prepareStatement(QueryUtils.GET_ADMIN_SQL)) {

            stmt.setInt(1, user.getUserId());

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Administrator(user, rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    /**
     * Returns the teacher account associated with the user.
     *
     * @param user the user
     * @return the teacher account if it exists
     */

    public static User getTeacher(User user) {
        try (Connection conn = getConnection();
                PreparedStatement stmt = conn.prepareStatement(QueryUtils.GET_TEACHER_SQL)) {

            stmt.setInt(1, user.getUserId());

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Teacher(user, rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    /**
     * Returns the student account associated with the user.
     *
     * @param user the user
     * @return the student account if it exists
     */

    public static User getStudent(User user) {
        try (Connection conn = getConnection();
                PreparedStatement stmt = conn.prepareStatement(QueryUtils.GET_STUDENT_SQL)) {

            stmt.setInt(1, user.getUserId());

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Student(user, rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }



    public static ArrayList<Teacher> getFaculty() {
        ArrayList<Teacher> faculty = new ArrayList<Teacher>();

         try (Connection conn = getConnection()) {
            PreparedStatement stmt = conn.prepareStatement(QueryUtils.GET_FACULTY);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    faculty.add(new Teacher(rs));
                }
            }
         }

         catch (SQLException e) {
             System.out.println(e);
         }

         return faculty;
     }


    public static ArrayList<Student> getStudents() {
        ArrayList<Student> students = new ArrayList<Student>();

        try (Connection conn = getConnection()) {
            PreparedStatement stmt = conn.prepareStatement(QueryUtils.GET_STUDENTS);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    students.add(new Student(rs));
                }
            }
         }

         catch (SQLException e) {
             System.out.println(e);
         }

         return students;
    }



    /*
     * Establishes a connection to the database.
     *
     * @return a database Connection object
     * @throws SQLException
     */

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(PROTOCOL + DATABASE_URL);
    }

    /*
     * Updates the last login time for the user.
     *
     * @param conn the current database connection
     * @param username the user's username
     * @param ts the current timestamp
     * @return the number of affected rows
     */

    private static int updateLastLogin(Connection conn, String username, Timestamp ts) { //called every time the user logs in so as to keep track of any unathorized access of their account
        try (PreparedStatement stmt = conn.prepareStatement(QueryUtils.UPDATE_LAST_LOGIN_SQL)) {

            conn.setAutoCommit(false);
            stmt.setString(1, ts.toString());
            stmt.setString(2, username);

            if (stmt.executeUpdate() == 1) {
                conn.commit();

                return 1;
            } else {
                conn.rollback();

                return -1;
            }
        } catch (SQLException e) {
            e.printStackTrace();

            return -1;
        }
    }

    public static int updatePassword(Connection conn, String username, String hashedPassword) { //called when the user selects the option to change their password
    	try (PreparedStatement stmt = conn.prepareStatement(QueryUtils.UPDATE_PASSWORD_SQL)) { //calls pre-compiled SQL statement with specific case examples filled in in order to modify the password in only that user's row in the database

        	stmt.setString(1, hashedPassword);
        	stmt.setString(2, username);
        	conn.setAutoCommit(false);
        	if (stmt.executeUpdate() == 1) {
        		conn.commit();

        		return 1;
        	}

          else {
        		conn.rollback();

        		return -1;
        	}
        }

        catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
    }

    /*
     * Builds the database. Executes a SQL script from a configuration file to
     * create the tables, setup the primary and foreign keys, and load sample data.
     */

    private static void reset() {
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             BufferedReader br = new BufferedReader(new FileReader(new File("config/setup.sql")))) {

            String line;
            StringBuffer sql = new StringBuffer();

            // read the configuration file line-by-line to get SQL commands

            while ((line = br.readLine()) != null) {
                sql.append(line);
            }

            // execute SQL commands one-by-one

            for (String command : sql.toString().split(";")) {
                if (!command.strip().isEmpty()) {
                    stmt.executeUpdate(command);
                }
            }
        } catch (FileNotFoundException e) {
            System.err.println("Error: Unable to load SQL configuration file.");
            e.printStackTrace();
        } catch (IOException e) {
            System.err.println("Error: Unable to open and/or read SQL configuration file.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Error: Unable to execute SQL script from configuration file.");
            e.printStackTrace();
        }
    }

    public static boolean isResultSetEmpty(ResultSet resultSet) throws SQLException {
        return !resultSet.first();
    }
}
