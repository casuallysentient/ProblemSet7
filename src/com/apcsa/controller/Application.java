package com.apcsa.controller;

import com.apcsa.data.*; //imports the files contained within the data folder so that this file is able to use the data contained within the database
import com.apcsa.model.*; //imports the files contained within the model folder so that this file is able to connect to the pre-coded aspects of the system
import java.sql.*;
import java.util.*;

public class Application {

  private Scanner in;
  private User activeUser;

  enum RootAction { PASSWORD, DATABASE, LOGOUT, SHUTDOWN } //gives access to certain actions that the root account is allowed to use
  enum StudentAction { GRADES, GRADESBYCOURSE, PASSWORD, LOGOUT } //gives access to certain actions that students are allowed to use
	enum AdminAction { FACULTY, FACULTYBYDEPT, STUDENT, STUDENTBYGRADE, STUDENTBYCOURSE, PASSWORD, LOGOUT } //gives access to certain actions that administrators are allowed to use
	enum TeacherAction { ENROLLMENT, AASSIGNMENT, DASSIGNMENT, ENTERGRADE, PASSWORD, LOGOUT} //gives access to certain actions that teachers are allowed to use

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
        System.out.println("PowerSchool -- now for students, teachers, and school administrators!"); // welcome message, this will print as soon as the program is started

        boolean login = false; //creates a boolean that will be used to confirm whether or not a user is logged in at the time
        // continuously prompt for login credentials and attempt to login

        while (true) {
            System.out.print("\nUsername: ");
            String username = in.next();

            System.out.print("Password: ");
            String password = in.next();

            // if login is successful, update generic user to administrator, teacher, or student

            if (login(username, password)) { //checks that the login is valid
            	login = true; //confirms that a user has logged in
                //following section checks to see what type of user is logged in by calling different functions that check the user type - administrator, teacher, or student
                activeUser = activeUser.isAdministrator() //by default, the program first checks to see if the user is an administrator
                    ? PowerSchool.getAdministrator(activeUser) : activeUser.isTeacher() //if the user is not an administrator, the program checks to see if they are a teacher
                    ? PowerSchool.getTeacher(activeUser) : activeUser.isStudent()//if the user is not a teacher, the program checks to see if they are a student
                    ? PowerSchool.getStudent(activeUser) : activeUser.isRoot()//if the user is not a student, the program checks to see if it is the root account
                    ? activeUser : null;

                if (isFirstLogin() && !activeUser.isRoot()) {
                   // first-time users need to change their passwords from the default provided
                    firstTimePassword();
                }

                System.out.printf("\nHello again, %s!\n", activeUser.getFirstName());

                while (login) {
                	login = this.requestSelectionLoop(activeUser); //calls function requestSelectionLoop, which ensures that every time a user has finished with a specific activity, they are able to see all of the available activities again until they log out
                }
            }
else {
              // create and show the user interface
               //
               // remember, the interface will be difference depending on the type
               // of user that is logged in (root, administrator, teacher, student)

                System.out.println("\nInvalid username and/or password."); //to be printed in the case that the username and/or password entered do not match up to a user registered in powerschool
            }
        }
    }


    private void firstTimePassword() {
    	System.out.print("\nAs a new user, you must change your password. \n\nEnter your new password: "); //printed the first time a user logs in for security purposes so that as soon as they begin to use their account, they are able to be sure that no one else knows their password
        String tempPassword = in.next(); //this is the line where the user actually enters the password
		String hashedPassword = Utils.getHash(tempPassword); //creates a hash of the user's newly entered password that the program can then read
		activeUser.setPassword(hashedPassword); //attempts to set the password to the newly entered password created by the user by means of the hash that the program is reading

        try {
			Connection conn = PowerSchool.getConnection();
			int success = PowerSchool.updatePassword(conn, activeUser.getUsername(), hashedPassword);
			if (success == 1) {
				System.out.println("\nSuccess!"); //success message printed if the password has successfully changed
			}
      else if (success == -1) {
				System.out.println("Something went wrong."); //printed if an error occurs within the system and, for whatever reason, the system is unable to change the password
			}
		}
    catch (SQLException e) {
			e.printStackTrace();
		}
    }


    public boolean requestSelectionLoop(User user) {
    	if (user.isAdministrator()) { //presents options available if administrator is logged in
    		switch(getAdminSelection()) {
    			case FACULTY: //allows the administrator to view a full list of the faculty registered in powerschool
    				((Administrator) user).viewFaculty();
    				return true;
    			case FACULTYBYDEPT: //allows the administrator to select a specific department and see which faculty members are registered in that department
    				((Administrator) user).viewFacultyByDept(in);
    				return true;
    			case STUDENT: //allows the administrator to view a full list of all students registered in powerschool
    				((Administrator) user).viewStudentEnrollment();
    				return true;
    			case STUDENTBYGRADE: //allows the administrator to select a specific grade and then see which students registered in powerschool are in that grade
    				((Administrator) user).viewStudentEnrollmentByGrade(in);
    				return true;
    			case STUDENTBYCOURSE: //allows the administrator to select a specific course and then see which students are registered in that course
    				((Administrator) user).viewStudentEnrollmentByCourse(in);
    				return true;
    			case PASSWORD: //allows the administrator to change their password
    				((Administrator) user).changePassword(in);
    				return true;
    			case LOGOUT: //allows the administrator to log out
    				return false;
    		}
    	}

      else if (user.isTeacher()) { //presents options available if teacher is logged in
    		switch(getTeacherSelection()) {
				case ENROLLMENT: //allows the teacher to enroll a new student in their class
					((Teacher) user).enrollment(in);
					return true;
				case AASSIGNMENT: //allows the teacher to add an assignment to their course
					((Teacher) user).addAssignment(in);
					return true;
				case DASSIGNMENT: //allows the teacher to delete an assignment from their course
					((Teacher) user).deleteAssignment(in);
					return true;
				case ENTERGRADE://allows the teacher to enter a grade for an assignment for a specific student
					((Teacher) user).enterGrade(in);
					return true;
				case PASSWORD://allows the teacher to change their password
                    ((Teacher) user).changePassword(in);
                    return true;
				case LOGOUT://allows the teacher to log out
					return false;
			}
    	}

      else if (user.isStudent()) { //presents options available if student is logged in
    		switch(getStudentSelection()) {
    			case GRADES://allows student to see a list of their overall grades
    				((Student) user).viewCourseGrades();
    				return true;
    			case GRADESBYCOURSE://allows student to enter a specific course and see their assignment grades in that course
    				((Student) user).viewAssignmentGradesByCourse(in);
    				return true;
    			case PASSWORD://allows student to change their password
    				((Student) user).changePassword(in);
    				return true;
    			case LOGOUT://allows student to log out
    				return false;

    		}
    	}

      else if (user.isRoot()) { //presents options available if root is logged in

    	}

    	return true;
    }



    public AdminAction getAdminSelection() {
    	int output = 0;
		do { //prints out the labels for all available actions for the administrator
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
				System.out.println("\nYour input was invalid. Please try again.\n");//returned when the administrator either enters a number that is not included in their available actions or something that is not a valid format for an option (i.e., not a number)
			}

			in.nextLine(); //creates an input field where the administrator can select which option they would like to use
		}

    while (output < 1 || output > 7);

		switch(output) {//switch statement that actually calls the previously written actions based on the administrator's response
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

    	do { //prints out all of the available actions for the student
    		System.out.println("\n[1] View course grades.");
			System.out.println("[2] View assignment grades by course.");
			System.out.println("[3] Change password.");
			System.out.println("[4] Logout.");
			System.out.print("\n::: ");
			try {
				output = in.nextInt();
			}
      catch (InputMismatchException e) {
				System.out.println("\nYour input was invalid. Please try again.\n");//returned when the student either enters a number that is not included in their available actions or something that is not a valid format for an option (i.e., not a number)
			}

			in.nextLine(); //creates an input field where the student can select which option they would like to use
    	}

      while (output < 1 || output > 4);

    	switch(output) {//switch statement that actually calls the previously written actions based on the student's response
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
		do { //prints out all of the available options for the teacher
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
				System.out.println("\nYour input was invalid. Please try again.\n"); //returned when the teacher either enters a number that is not included in their available actions or something that is not a valid format for an option (i.e., not a number)
			}
            in.nextLine(); //creates an input field where the teacher can select which option they would like to use
		}
     while (output > 6 || output < 1);

		switch(output) {//switch statement that actually calls the previously written actions based on the teacher's response
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
