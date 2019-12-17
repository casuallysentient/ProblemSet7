package com.apcsa.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.InputMismatchException;
import java.util.Scanner;

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
}
