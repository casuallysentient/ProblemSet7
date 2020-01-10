package com.apcsa.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList; //a resizeable array that can be used to store an uncertain number of objects, which is not natively available in java
import java.util.InputMismatchException; //thrown by a scanner in the event that the user enters an unexpected data type (for example, the word "banana" entered as a nextInt())
import java.util.Scanner; //allows program to accept user input
import com.apcsa.data.PowerSchool; //imports data from powerschool file so the objects created elsewhere can be used here




public class Utils {

    /**
     * Returns an MD5 hash of the user's plaintext password.
     *
     * @param plaintext the password
     * @return an MD5 hash of the password
     */

    public static String getHash(String plaintext) {
        StringBuilder pwd = new StringBuilder();

        try {
            MessageDigest md = MessageDigest.getInstance("MD5");

            md.update(plaintext.getBytes());
            byte[] digest = md.digest(plaintext.getBytes());

            for (int i = 0; i < digest.length; i++) {
                pwd.append(Integer.toString((digest[i] & 0xff) + 0x100, 16).substring(1));
            }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        return pwd.toString();
    }

    /**
     * Safely reads an integer from the user.
     *
     * @param in the Scanner
     * @param invalid an invalid (but type-safe) default
     * @return the value entered by the user or the invalid default
     */

    public static int getInt(Scanner in, int invalid) {
        try {
            return in.nextInt();                // try to read and return user-provided value
        } catch (InputMismatchException e) {
            return invalid;                     // return default in the even of an type mismatch
        } finally {
            in.nextLine();                      // always consume the dangling newline character
        }
    }


    public static boolean confirm(Scanner in, String message) { //teaches system how to respond in the case of yes/no responses in the way this system is designed (where the user must type y or n to confirm or deny, respectively - non-case-sensitive)
        String response = "";

        while (!response.equals("y") && !response.equals("n")) {
            System.out.print(message);
            response = in.next().toLowerCase();
        }

        return response.equals("y");
    }

    public static int generateAssignmentId() { //automatically creates an ID whenever an assignment is created by a teacher so that there aren't any errors of multiple grades appearing for one assignment
        ArrayList<Integer> ids = new ArrayList<Integer>();

        try (Connection conn = PowerSchool.getConnection()) {
            PreparedStatement stmt = conn.prepareStatement("SELECT assignment_id FROM assignments"); //adds a line of SQL that accesses newly created assignment in database

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    ids.add(rs.getInt("assignment_id"));
                }
            }
        }

        catch (SQLException e) {
            System.out.println(e);
        }

        if (ids.size() == 0) {
            return 1;
        }

        else if (ids.size() != 0) {
            return ids.get(ids.size() - 1) + 1;
        }

        return -1;
    }

    private static double round(double value, int places) { //rounds grade values with more than 2 decimal points to 2 decimal points for sake of simplicity
        return new BigDecimal(Double.toString(value))
            .setScale(places, RoundingMode.HALF_UP)
            .doubleValue();
    }

    public static Double getGrade(Double[] grades) {
        int mps = 0;
        double mpSum = 0;
        double mpAvg = -1;
        double mpWeight = -1;

        int exams = 0;
        double examSum = 0;
        double examAvg = -1;
        double examWeight = -1;

        for (int i = 0; i < grades.length; i++) {
            if (grades[i] != null) {
                if (i < 2 || (i > 2 && i < 5)) {
                    mps++;
                    mpSum = mpSum + grades[i];
                } else {
                    exams++;
                    examSum = examSum + grades[i];
                }
            }
        }



        if (mps > 0 && exams > 0) {
            mpAvg = mpSum / mps;
            examAvg = examSum / exams;

            mpWeight = 0.8;
            examWeight = 0.2;
        } else if (mps > 0) {
            mpAvg = mpSum / mps;

            mpWeight = 1.0;
            examWeight = 0.0;
        } else if (exams > 0) {
            examAvg = examSum / exams;

            mpWeight = 0.0;
            examWeight = 1.0;
        } else {
            return null;
        }

        return round(mpAvg * mpWeight + examAvg * examWeight, 2);
    }
}
