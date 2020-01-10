package com.apcsa.model;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.InputMismatchException;
import java.util.Scanner;
import java.util.ArrayList;
import java.util.Arrays;
import com.apcsa.controller.Utils;
import com.apcsa.data.*;
import com.apcsa.model.User;

public class Student extends User {

	private int studentId;
	private int classRank;
	private int gradeLevel;
	private int graduationYear;
	private double gpa;
	private String firstName;
	private String lastName;

    public Student(User user, ResultSet rs) throws SQLException {
    	super(user);

    	this.studentId = rs.getInt("student_id");
    	this.classRank = rs.getInt("class_rank");
    	this.gradeLevel = rs.getInt("grade_level");
    	this.graduationYear = rs.getInt("graduation");
    	this.gpa = rs.getDouble("gpa");
    	this.firstName = rs.getString("first_name");
    	this.lastName = rs.getString("last_name");
	}

	public Student(ResultSet rs) throws SQLException {
		super(rs.getInt("user_id"), rs.getString("account_type"), rs.getString("username"), rs.getString("auth"), rs.getString("last_login"));

			this.studentId = rs.getInt("student_id");
    	this.classRank = rs.getInt("class_rank");
    	this.gradeLevel = rs.getInt("grade_level");
    	this.graduationYear = rs.getInt("graduation");
    	this.gpa = rs.getDouble("gpa");
    	this.firstName = rs.getString("first_name");
			this.lastName = rs.getString("last_name");
	}

    public String getFirstName() {
    	return firstName;
	}

	public String getLastName() {
		return this.lastName;
	}

	public int getGraduation() {
		return this.graduationYear;
	}

	public int getGradeLevel() {
		return this.gradeLevel;
	}

	public int getStudentId() {
		return this.studentId;
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

	public void viewCourseGrades() {
		System.out.print("\n");

		try (Connection conn = PowerSchool.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement(QueryUtils.GET_STUDENT_COURSES);
			stmt.setInt(1, this.getStudentId());

			try (ResultSet rs = stmt.executeQuery()) {

				while (rs.next()) {
					System.out.println(rs.getString("title") + " / " + rs.getInt("grade"));
				}
			}
		}

		catch (SQLException e) {
			System.out.println(e);
		}
	}

	public void viewAssignmentGradesByCourse(Scanner in) {
		System.out.print("\n");
		ArrayList<String> course_nos = new ArrayList<String>();
		ArrayList<String> course_ids = new ArrayList<String>();

		int count = 1;
		int input = 0;
		int selection = 0;
		String selectionString = "";

		try (Connection conn = PowerSchool.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement(QueryUtils.GET_STUDENT_COURSES);
			stmt.setInt(1, this.getStudentId());

			try (ResultSet rs = stmt.executeQuery()) {

				while (rs.next()) {
					System.out.println("[" + count + "] " + rs.getString("course_no"));
					count++;
					course_nos.add(rs.getString("course_no"));
					course_ids.add(rs.getString("course_id"));
				}
				System.out.print("\n::: ");
			}

			catch (SQLException e) {
				System.out.println(e);
			}
		}

		catch (SQLException e) {
			System.out.println(e);
		}

		try {
			input = in.nextInt();
		}

		catch (InputMismatchException e) {
			System.out.println("\nYour input was invalid. Please try again.");
		}

		finally {
			in.nextLine();
		}

		System.out.println("\n[1] MP1 Assignment.");
		System.out.println("[2] MP2 Assignment.");
		System.out.println("[3] MP3 Assignment.");
		System.out.println("[4] MP4 Assignment.");
		System.out.println("[5] Midterm Exam.");
		System.out.println("[6] Final Exam.");
		System.out.print("\n::: ");


		try {
			selection = in.nextInt();
		}

		catch (InputMismatchException e) {
			System.out.println(e);
		}

		finally {
			in.nextLine();
		}

		switch (selection) {
			case 1:
				selectionString = "mp1";
				break;
			case 2:
				selectionString = "mp2";
				break;
			case 3:
				selectionString = "mp3";
				break;
			case 4:
				selectionString = "mp4";
				break;
			case 5:
				selectionString = "midterm_exam";
				break;
			case 6:
				selectionString = "final_exam";
		}



		try (Connection conn = PowerSchool.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM assignment_grades INNER JOIN assignments ON assignment_grades.assignment_id = assignments.assignment_id WHERE student_id = ? AND assignment_grades.course_id = ?");
			stmt.setInt(1, this.getStudentId());
			stmt.setString(2, course_ids.get(input - 1));

			try (ResultSet rs = stmt.executeQuery()) {
				System.out.print("\n");
				int assignmentCount = 1;

				while (rs.next()) {
					System.out.printf("%d. %s / %d (out of %d pts)\n", assignmentCount, rs.getString("title"), rs.getInt("points_earned"), rs.getInt("points_possible"));
					assignmentCount++;
				}
			}
		}

		catch (SQLException e) {
			System.out.println(e);
		}
	}

}
