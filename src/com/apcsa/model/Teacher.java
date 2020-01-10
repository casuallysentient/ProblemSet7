package com.apcsa.model;

import java.sql.*;
import java.util.*;
import com.apcsa.data.*;
import com.apcsa.controller.*;
import com.apcsa.model.*;


public class Teacher extends User {

    private int teacherId;
    private int departmentId;
    private String firstName;
    private String lastName;
    private String departmentName;

    public Teacher(User user, ResultSet rs) throws SQLException {
    	super(user);

    	this.teacherId = rs.getInt("teacher_id");
    	this.departmentId = rs.getInt("department_id");
    	this.firstName = rs.getString("first_name");
        this.lastName = rs.getString("last_name");
    }

    public Teacher(ResultSet rs) throws SQLException {
		super(rs.getInt("user_id"), rs.getString("account_type"), rs.getString("username"), rs.getString("auth"), rs.getString("last_login"));

		this.teacherId = rs.getInt("teacher_id");
		this.firstName = rs.getString("first_name");
		this.lastName = rs.getString("last_name");
    this.departmentName = rs.getString("title");
    this.departmentId = rs.getInt("department_id");
	}

    public String getFirstName() {
    	return this.firstName;
    }

    public String getLastName() {
        return this.lastName;
    }

    public String getDepartmentName() {
        return this.departmentName;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public int getTeacherId() {
        return teacherId;
    }

     public void enrollment(Scanner in) {
        int input = 0;
        boolean assignments = false;
        ArrayList<String> course_nos = getTeacherCourseList();

		try {
			input = in.nextInt();
		}

		catch (InputMismatchException e) {
			System.out.println("\nYour input was invalid. Please try again.");
		}

		finally {
			in.nextLine();
        }

        System.out.print("\n");
        try (Connection conn = PowerSchool.getConnection()) {
             PreparedStatement stmt = conn.prepareStatement(QueryUtils.GET_STUDENT_ENROLLMENT_BY_COURSE_NO);
             stmt.setString(1, course_nos.get(input - 1));

						 try (ResultSet rs = stmt.executeQuery()) {

								while (rs.next()) {

                    try (Connection conn2 = PowerSchool.getConnection()) {
                        PreparedStatement stmt2 = conn2.prepareStatement("SELECT * FROM assignment_grades WHERE student_id = ?");
                        stmt2.setInt(1, rs.getInt("STUDENT_ID"));

												try (ResultSet rs2 = stmt2.executeQuery()) {

													  if (rs2.next()) {
                                assignments = true;
                            }
                        }
                    }

                    if (assignments) {
                        System.out.println(rs.getString("last_name") + ", " + rs.getString("first_name") + " / " + rs.getInt("grade"));
                    }

										else {
                        System.out.println(rs.getString("last_name") + ", " + rs.getString("first_name") + " / " + "--");
                    }

                assignments = false;
                }
             }
        }

				catch (SQLException e) {
            System.out.println(e);
        }


     }

     public void addAssignment(Scanner in) {

        int courseInput = 0;
        ArrayList<String> course_nos = getTeacherCourseList();

        try {
			courseInput = in.nextInt();
		}

		catch (InputMismatchException e) {
			System.out.println("Your input was invalid. Please try again.");
		}

		finally {
			in.nextLine();
        }

        int mp = getMarkingPeriodSelection(in);

        try {
            addAssignmentHelper(in, mp, course_nos.get(courseInput - 1));
        }

				catch (SQLException e) {
            System.out.println(e);
        }

     }

     public void deleteAssignment(Scanner in) {

        int courseInput = 0;
        ArrayList<String> course_nos = getTeacherCourseList();

        try {
			courseInput = in.nextInt();
		}

		catch (InputMismatchException e) {
			System.out.println("\nYour input was invalid. Please try again.");
		}

		finally {
			in.nextLine();
        }

        int mp = getMarkingPeriodSelection(in);

        deleteAssignmentHelper(in, mp, course_nos.get(courseInput - 1));
     }

     public void enterGrade(Scanner in) {
        int courseInput = 0;
        ArrayList<String> course_nos = getTeacherCourseList();

        try {
			courseInput = in.nextInt();
		}

		catch (InputMismatchException e) {
			System.out.println("\nYour input was invalid. Please try again.");
		}

		finally {
			in.nextLine();
        }

        int mp = getMarkingPeriodSelection(in);

        enterGradeHelper(in, mp, course_nos.get(courseInput - 1));
     }

	public void changePassword(Scanner in) {
		System.out.println("\nEnter current password:");
        String currentPassword = in.nextLine();
        currentPassword = Utils.getHash(currentPassword);

    	if (currentPassword.equals(this.password)) {
    		System.out.println("\nEnter a new password:");
    		String password = Utils.getHash((in.nextLine()));
    		this.setPassword(password);

					try {
        		Connection conn = PowerSchool.getConnection();
        		PowerSchool.updatePassword(conn, this.getUsername(), password);
        	}

					catch (SQLException e){
        		System.out.println(e);
        	}
    	}

			else {
    		System.out.println("\nIncorrect current password.");
    	}

    }

    private ArrayList<String> getTeacherCourseList() {
        System.out.print("\n");
        ArrayList<String> course_nos = new ArrayList<String>();

        int count = 1;

        try (Connection conn = PowerSchool.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement(QueryUtils.GET_TEACHER_COURSES);
			stmt.setInt(1, this.getTeacherId());

			try (ResultSet rs = stmt.executeQuery()) {

				while (rs.next()) {
					System.out.println("[" + count + "] " + rs.getString("course_no"));
					count++;
					course_nos.add(rs.getString("course_no"));
				}
			}
			catch (SQLException e) {
				System.out.println(e);
			}
		}
		catch (SQLException e) {
			System.out.println(e);
        }
        System.out.print("\n::: ");

        return course_nos;
    }

    private int getMarkingPeriodSelection(Scanner in) {
        int output = 0;

				do {
            System.out.println("\n[1] MP1 Assignment.");
            System.out.println("[2] MP2 Assignment.");
            System.out.println("[3] MP3 Assignment.");
            System.out.println("[4] MP4 Assignment.");
            System.out.println("[5] Midterm exam.");
            System.out.println("[6] Final exam.");
            System.out.print("\n::: ");

            try {
                output = in.nextInt();
            }

						catch (InputMismatchException e) {
                System.out.println("Your input was invalid. Please try again.\n");
            }
            in.nextLine();
        }

				while (output < 1 || output > 6);



        return output;
    }

    private void addAssignmentHelper(Scanner in, int mp, String title) throws SQLException {
        int isFinal = (mp == 6) ? 1 : 0;
        int isMidterm = (mp == 5) ? 1 : 0;
        int markingPeriod = (mp > 4) ? 0 : mp;
        String assignmentTitle = "";
        int pointValue = -1;

        System.out.print("\nAssignment Title: ");
        try {
            assignmentTitle = in.nextLine();
        }

				catch (InputMismatchException e) {
            System.out.println("Your input was invalid. Please try again.");
            addAssignmentHelper(in, mp, title);
        }

        System.out.print("\nPoint Value: ");
        while (pointValue > 100 || pointValue < 1) {
            try {
                pointValue = in.nextInt();
            }

						catch (InputMismatchException e){
                System.out.println("Incorrect input.");
            }
            in.nextLine();

            if (pointValue > 100 || pointValue < 1) {
                System.out.println("Point values must be between 1 and 100.");
            }
        }

        boolean intent = Utils.confirm(in, "\nAre you sure you want to create this assignment? (y/n) ");

        if (intent) {
            int course_id = this.getCourseIdFromTitle(title);

            int assignment_id = Utils.generateAssignmentId();

            try (Connection conn = PowerSchool.getConnection()) {
                PreparedStatement stmt = conn.prepareStatement("INSERT INTO assignments (course_id, assignment_id, marking_period, is_midterm, is_final, title, point_value) VALUES (?, ?, ?, ?, ?, ?, ?)");
                stmt.setInt(1, course_id);
                stmt.setInt(2, assignment_id);
                stmt.setInt(3, markingPeriod);
                stmt.setInt(4, isMidterm);
                stmt.setInt(5, isFinal);
                stmt.setString(6, assignmentTitle);
                stmt.setInt(7, pointValue);

                stmt.executeUpdate();
            }

						catch (SQLException e) {
                System.out.println(e);
            }
        }
    }


    private void deleteAssignmentHelper(Scanner in, int mp, String title) {

        int course_id = this.getCourseIdFromTitle(title);


        ArrayList<Assignment> assignments = new ArrayList<Assignment>();

        String statement = !(mp > 4) ? "SELECT * FROM assignments WHERE course_id = ? AND marking_period = ?"
        : (mp == 5) ? "SELECT * FROM assignments WHERE course_id = ? AND is_midterm = 1" : "SELECT * FROM assignments WHERE course_id = ? AND is_final = 1";

        assignments = this.getAssignmentList(statement, course_id, mp);

        if (assignments.size() != 0) {
            int assignmentSelection = this.getAssignmentSelection(in, assignments);


            try (Connection conn = PowerSchool.getConnection()) {
                PreparedStatement stmt = conn.prepareStatement("DELETE FROM assignments WHERE course_id = ? AND assignment_id = ?");
                stmt.setInt(1, course_id);
                stmt.setInt(2, assignments.get(assignmentSelection - 1).getAssignmentId());
                stmt.executeUpdate();
            }

						catch (SQLException e) {
                System.out.println(e);
            }

            try (Connection conn = PowerSchool.getConnection()) {
                PreparedStatement stmt = conn.prepareStatement("DELETE FROM assignment_grades WHERE course_id = ? AND assignment_id = ?");
                stmt.setInt(1, course_id);
                stmt.setInt(2, assignments.get(assignmentSelection - 1).getAssignmentId());
                stmt.executeUpdate();
            }

						catch (SQLException e) {
                System.out.println(e);
            }

            System.out.printf("\nSuccessfully deleted %s.\n", assignments.get(assignmentSelection - 1).getTitle());
        }

				else {
            System.out.println("\nNo assignments to show.");
        }

    }

    private void enterGradeHelper(Scanner in, int mp, String title) {

        int course_id = this.getCourseIdFromTitle(title);

        ArrayList<Assignment> assignments = new ArrayList<Assignment>();
        String statement = !(mp > 4) ? "SELECT * FROM assignments WHERE course_id = ? AND marking_period = ?"
        : (mp == 5) ? "SELECT * FROM assignments WHERE course_id = ? AND is_midterm = 1" : "SELECT * FROM assignments WHERE course_id = ? AND is_final = 1";

        assignments = this.getAssignmentList(statement, course_id, mp);

        if (assignments.size() != 0) {
            String noGrade = "--";
            int assignmentSelection = this.getAssignmentSelection(in, assignments);

            ArrayList<Student> studentsInCourse = this.getStudentsInCourse(course_id);

            int studentSelection = this.getStudentInCourseSelection(in, studentsInCourse);

            int currentGrade = this.getCurrentGradeOfStudentInCourse(studentsInCourse, studentSelection, assignments, assignmentSelection, course_id);

            System.out.printf("\nAssignment: %s (%d pts)\n", assignments.get(assignmentSelection - 1).getTitle(), assignments.get(assignmentSelection - 1).getPointValue());
            System.out.printf("Student: %s, %s\n", studentsInCourse.get(studentSelection - 1).getLastName(), studentsInCourse.get(studentSelection - 1).getFirstName());
            System.out.printf("Current Grade: %s\n", (currentGrade == -1) ? noGrade : Integer.toString(currentGrade));

            System.out.print("\nNew Grade: ");

            int newGrade = -1;
            while (newGrade < 0 || newGrade > assignments.get(assignmentSelection - 1).getPointValue()) {

								try {
                    newGrade = in.nextInt();
                }

								catch (InputMismatchException e) {
                    System.out.println("\nYour input was invalid. Please try again.");
                    System.out.print("\nNew Grade: ");
                }

								finally {
                    in.nextLine();
                }

								if (newGrade < 0 || newGrade > assignments.get(assignmentSelection - 1).getPointValue()) {
                    System.out.printf("Must be between 0 and %d. Try again: ", assignments.get(assignmentSelection - 1).getPointValue());
                }
            }

            boolean intent = Utils.confirm(in, "\nAre you sure you want to enter this grade? (y/n) ");

            if (intent) {

								if (currentGrade == -1) {

										try (Connection conn = PowerSchool.getConnection()) {
                        PreparedStatement stmt = conn.prepareStatement("INSERT INTO assignment_grades (course_id, assignment_id, student_id, points_earned, points_possible, is_graded) VALUES (?, ?, ?, ?, ?, ?)");
                        stmt.setInt(1, course_id);
                        stmt.setInt(2, assignments.get(assignmentSelection - 1).getAssignmentId());
                        stmt.setInt(3, studentsInCourse.get(studentSelection - 1).getStudentId());
                        stmt.setInt(4, newGrade);
                        stmt.setInt(5, assignments.get(assignmentSelection - 1).getPointValue());
                        stmt.setInt(6, 1);
                        stmt.executeUpdate();
                    }

										catch (SQLException e) {
                        System.out.println(e);
                    }
                }

								else if (currentGrade != -1) {

										try (Connection conn = PowerSchool.getConnection()) {
                        PreparedStatement stmt = conn.prepareStatement("UPDATE assignment_grades SET points_earned = ? WHERE student_id = ? AND course_id = ? AND assignment_id = ?");
                        stmt.setInt(1, newGrade);
                        stmt.setInt(2, studentsInCourse.get(studentSelection - 1).getStudentId());
                        stmt.setInt(3, course_id);
                        stmt.setInt(4, assignments.get(assignmentSelection - 1).getAssignmentId());
                        stmt.executeUpdate();
                    }

										catch (SQLException e) {
                        System.out.println(e);
                    }
                }
            }

						else {
                return;
            }
        }

				else {
            System.out.println("\nNo assignments to show.");
        }
    }

    private int getCourseIdFromTitle(String title) {
  		try (Connection conn = PowerSchool.getConnection()) {
            PreparedStatement stmt = conn.prepareStatement("SELECT course_id FROM courses WHERE course_no = ?");
            stmt.setString(1, title);

					  try (ResultSet rs = stmt.executeQuery()) {

							  if (rs.next()) {
                    return rs.getInt("course_id");
                }
            }

						catch (SQLException e) {
                System.out.println(e);
            }
        }

				catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    private ArrayList<Assignment> getAssignmentList(String statement, int course_id, int mp) {
        ArrayList<Assignment> assignments = new ArrayList<Assignment>();

			  try (Connection conn = PowerSchool.getConnection()) {
            PreparedStatement stmt = conn.prepareStatement(statement);
            stmt.setInt(1, course_id);

					  if (mp > 0 && mp < 5) {
                stmt.setInt(2, mp);
            }

					  try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    assignments.add(new Assignment(rs.getString("title"), rs.getInt("assignment_id"), rs.getInt("point_value")));
                }
            }

        }

				catch (SQLException e) {
            System.out.println(e);
        }

        return assignments;
    }

    private int getAssignmentSelection(Scanner in, ArrayList<Assignment> assignments) {
        int assignmentSelection = -1;
        System.out.println("\nChoose an assignment. ");

            for (int i = 0; i < assignments.size(); i++) {
                System.out.printf("[%d] %s (%d pts)\n", i + 1, assignments.get(i).getTitle(), assignments.get(i).getPointValue());
            }
            System.out.print("\n::: ");


            while (assignmentSelection > assignments.size() || assignmentSelection < 0) {

							  try {
                    assignmentSelection = in.nextInt();
                }

								catch (InputMismatchException e) {
                    System.out.println("\nYour input was invalid. Please try again.");
                    System.out.println("\nChoose an assignment. ");

                    for (int i = 0; i < assignments.size(); i++) {
                        System.out.printf("[%d] %s (%d pts)\n", i + 1, assignments.get(i).getTitle(), assignments.get(i).getPointValue());
                    }
                    System.out.print("\n::: ");
                }

								finally {
                    in.nextLine();
                }

            }
        return  assignmentSelection;
    }

    private ArrayList<Student> getStudentsInCourse(int course_id) {
        ArrayList<Student> studentsInCourse = new ArrayList<Student>();

			try (Connection conn  = PowerSchool.getConnection()) {
            PreparedStatement stmt = conn.prepareStatement(QueryUtils.GET_STUDENT_ENROLLMENT_BY_COURSE_ID);
            stmt.setInt(1, course_id);

					  try (ResultSet rs = stmt.executeQuery()) {

							  while (rs.next()) {
                    studentsInCourse.add(new Student(rs));
                }
            }


        }

				catch (SQLException e) {
            System.out.println(e);
        }
        return studentsInCourse;
    }

    private int getStudentInCourseSelection(Scanner in, ArrayList<Student> studentsInCourse) {
        System.out.print("\n");

				for (int i = 0; i < studentsInCourse.size(); i++) {
            System.out.printf("[%d] %s, %s\n", i + 1, studentsInCourse.get(i).getLastName(), studentsInCourse.get(i).getFirstName());
        }
        System.out.println("\nChoose a student: ");
        System.out.print("\n::: ");

        int studentSelection = 0;
        while (studentSelection > studentsInCourse.size() || studentSelection < 1) {
  			try {
                studentSelection = in.nextInt();
            }

						catch (InputMismatchException e) {
                System.out.println("\nYour input was invalid. Please try again.");
                System.out.println("Choose a student: ");

                for (int i = 0; i < studentsInCourse.size(); i++) {
                    System.out.printf("[%d] %s, %s\n", i + 1, studentsInCourse.get(i).getLastName(), studentsInCourse.get(i).getFirstName());
                }
            }

						finally {
                in.nextLine();
            }
        }

        return studentSelection;
    }

    private int getCurrentGradeOfStudentInCourse(ArrayList<Student> studentsInCourse, int studentSelection, ArrayList<Assignment> assignments, int assignmentSelection, int course_id) {
            int output = -1;

            try (Connection conn = PowerSchool.getConnection()) {
                PreparedStatement stmt = conn.prepareStatement("SELECT * FROM assignment_grades WHERE student_id = ? AND course_id = ? AND assignment_id = ?");
                stmt.setInt(1, studentsInCourse.get(studentSelection - 1).getStudentId());
                stmt.setInt(2, course_id);
                stmt.setInt(3, assignments.get(assignmentSelection - 1).getAssignmentId());

							  try (ResultSet rs = stmt.executeQuery()) {

									  if (rs.next()) {
                        output = rs.getInt("points_earned");
                    }

										else {
                        output = -1;
                    }
                }
            }

						catch (SQLException e) {
                System.out.println(e);
            }
        return output;
    }
}
