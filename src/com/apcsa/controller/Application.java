package com.apcsa.controller;

import com.apcsa.data.*;
import com.apcsa.model.*;
import java.sql.*;
import java.util.*;

public class Application {

  private Scanner in;
  private User activeUser;

  enum RootAction { PASSWORD, DATABASE, LOGOUT, SHUTDOWN }
  enum StudentAction { GRADES, GRADESBYCOURSE, PASSWORD, LOGOUT }
	enum AdminAction { FACULTY, FACULTYBYDEPT, STUDENT, STUDENTBYGRADE, STUDENTBYCOURSE, PASSWORD, LOGOUT }
	enum TeacherAction { ENROLLMENT, AASSIGNMENT, DASSIGNMENT, ENTERGRADE, PASSWORD, LOGOUT}

    /**
     * Creates an instance of the Application class, which is responsible for interacting
     * with the user via the command line interface.
     */

    public Application() {
        this.in = new Scanner(System.in);

        try {
            PowerSchool.initialize(false);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Starts the PowerSchool application.
     */

    public void startup() {
        System.out.println("PowerSchool -- now for students, teachers, and school administrators!");

        boolean login = false;

        // continuously prompt for login credentials and attempt to login

        while (true) {
            System.out.print("\nUsername: ");
            String username = in.next();

            System.out.print("Password: ");
            String password = in.next();

            // if login is successful, update generic user to administrator, teacher, or student

            if (login(username, password)) {
            	login = true;
                activeUser = activeUser.isAdministrator()
                    ? PowerSchool.getAdministrator(activeUser) : activeUser.isTeacher()
                    ? PowerSchool.getTeacher(activeUser) : activeUser.isStudent()
                    ? PowerSchool.getStudent(activeUser) : activeUser.isRoot()
                    ? activeUser : null;

                if (isFirstLogin() && !activeUser.isRoot()) {
                   // first-time users need to change their passwords from the default provided
                    firstTimePassword();
                }

                System.out.printf("\nHello again, %s!\n", activeUser.getFirstName());

                while (login) {
                	login = this.requestSelectionLoop(activeUser);
                }
            }
else {
              // create and show the user interface
               //
               // remember, the interface will be difference depending on the type
               // of user that is logged in (root, administrator, teacher, student)

                System.out.println("\nInvalid username and/or password.");
            }
        }
    }


    private void firstTimePassword() {
    	System.out.print("\nAs a new user, you must change your password. \n\nEnter your new password: ");
        String tempPassword = in.next();
		String hashedPassword = Utils.getHash(tempPassword);
		activeUser.setPassword(hashedPassword);

        try {
			Connection conn = PowerSchool.getConnection();
			int success = PowerSchool.updatePassword(conn, activeUser.getUsername(), hashedPassword);
			if (success == 1) {
				System.out.println("\nSuccess!");
			}
      else if (success == -1) {
				System.out.println("Something went wrong.");
			}
		}
    catch (SQLException e) {
			e.printStackTrace();
		}
    }


    public boolean requestSelectionLoop(User user) {
    	if (user.isAdministrator()) {
    		switch(getAdminSelection()) {
    			case FACULTY:
    				((Administrator) user).viewFaculty();
    				return true;
    			case FACULTYBYDEPT:
    				((Administrator) user).viewFacultyByDept(in);
    				return true;
    			case STUDENT:
    				((Administrator) user).viewStudentEnrollment();
    				return true;
    			case STUDENTBYGRADE:
    				((Administrator) user).viewStudentEnrollmentByGrade(in);
    				return true;
    			case STUDENTBYCOURSE:
    				((Administrator) user).viewStudentEnrollmentByCourse(in);
    				return true;
    			case PASSWORD:
    				((Administrator) user).changePassword(in);
    				return true;
    			case LOGOUT:
    				return false;
    		}
    	}

      else if (user.isTeacher()) {
    		switch(getTeacherSelection()) {
				case ENROLLMENT:
					((Teacher) user).enrollment(in);
					return true;
				case AASSIGNMENT:
					((Teacher) user).addAssignment(in);
					return true;
				case DASSIGNMENT:
					((Teacher) user).deleteAssignment(in);
					return true;
				case ENTERGRADE:
					((Teacher) user).enterGrade(in);
					return true;
				case PASSWORD:
                    ((Teacher) user).changePassword(in);
                    return true;
				case LOGOUT:
					return false;
			}
    	}

      else if (user.isStudent()) {
    		switch(getStudentSelection()) {
    			case GRADES:
    				((Student) user).viewCourseGrades();
    				return true;
    			case GRADESBYCOURSE:
    				((Student) user).viewAssignmentGradesByCourse(in);
    				return true;
    			case PASSWORD:
    				((Student) user).changePassword(in);
    				return true;
    			case LOGOUT:
    				return false;

    		}
    	}

      else if (user.isRoot()) {

    	}

    	return true;
    }



    public AdminAction getAdminSelection() {
    	int output = 0;
		do {
			System.out.println("\n[1] View faculty.");
			System.out.println("[2] View faculty by department.");
			System.out.println("[3] View student enrollment.");
			System.out.println("[4] View student enrollment by grade.");
			System.out.println("[5] View student enrollment by course.");
			System.out.println("[6] Change password.");
			System.out.println("[7] Logout.");
			System.out.print("\n::: ");
			try {
				output = in.nextInt();
			}
      catch (InputMismatchException e) {
				System.out.println("\nYour input was invalid. Please try again.\n");
			}

			in.nextLine();
		}

    while (output < 1 || output > 7);

		switch(output) {
			case 1:
				return AdminAction.FACULTY;
			case 2:
				return AdminAction.FACULTYBYDEPT;
			case 3:
				return AdminAction.STUDENT;
			case 4:
				return AdminAction.STUDENTBYGRADE;
			case 5:
				return AdminAction.STUDENTBYCOURSE;
			case 6:
				return AdminAction.PASSWORD;
			case 7:
				return AdminAction.LOGOUT;
			default:
				return null;
		}

    }



    public StudentAction getStudentSelection() {
    	int output = 0;

    	do {
    		System.out.println("\n[1] View course grades.");
			System.out.println("[2] View assignment grades by course.");
			System.out.println("[3] Change password.");
			System.out.println("[4] Logout.");
			System.out.print("\n::: ");
			try {
				output = in.nextInt();
			}
      catch (InputMismatchException e) {
				System.out.println("\nYour input was invalid. Please try again.\n");
			}

			in.nextLine();
    	}

      while (output < 1 || output > 4);

    	switch(output) {
    		case 1:
    			return StudentAction.GRADES;
    		case 2:
    			return StudentAction.GRADESBYCOURSE;
    		case 3:
    			return StudentAction.PASSWORD;
    		case 4:
    			return StudentAction.LOGOUT;
    		default:
    			return null;
    	}
	}



	public TeacherAction getTeacherSelection() {
		int output = -1;
		do {
			System.out.println("\n[1] View enrollment by course.");
			System.out.println("[2] Add assignment.");
			System.out.println("[3] Delete assignment.");
			System.out.println("[4] Enter grade.");
            System.out.println("[5] Change password.");
			System.out.println("[6] Logout.");
			System.out.print("\n::: ");
			try {
                output = in.nextInt();
			}
      catch (InputMismatchException e) {
				System.out.println("\nYour input was invalid. Please try again.\n");
			}
            in.nextLine();
		}
     while (output > 6 || output < 1);

		switch(output) {
			case 1:
				return TeacherAction.ENROLLMENT;
			case 2:
				return TeacherAction.AASSIGNMENT;
			case 3:
				return TeacherAction.DASSIGNMENT;
			case 4:
				return TeacherAction.ENTERGRADE;
			case 5:
				return TeacherAction.PASSWORD;
			case 6:
				return TeacherAction.LOGOUT;
			default:
				return null;
		}

	}

    /**
     * Logs in with the provided credentials.
     *
     * @param username the username for the requested account
     * @param password the password for the requested account
     * @return true if the credentials were valid; false otherwise
     */

    public boolean login(String username, String password) {
        activeUser = PowerSchool.login(username, password);

        return activeUser != null;
    }

    /**
     * Determines whether or not the user has logged in before.
     *
     * @return true if the user has never logged in; false otherwise
     */

    public boolean isFirstLogin() {
        return activeUser.getLastLogin().equals("0000-00-00 00:00:00.000");
    }

    /////// MAIN METHOD ///////////////////////////////////////////////////////////////////

    /*
     * Starts the PowerSchool application.
     *
     * @param args unused command line argument list
     */

    public static void main(String[] args) {
        Application app = new Application();

        app.startup();
    }
}
