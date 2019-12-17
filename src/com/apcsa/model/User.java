package com.apcsa.model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class User {

    private int userId;
    private String accountType;
    private String username;
    private String password;
    private String lastLogin;

    /**
     * Creates an instance of the User class.
     *
     * @param rs a ResultSet of User information
     */

    public User(ResultSet rs) throws SQLException {
        this(rs.getInt("user_id"),
             rs.getString("account_type"),
             rs.getString("username"),
             rs.getString("auth"),
             rs.getString("last_login")
        );
    }

    /**
     * Creates an instance of the User class.
     *
     * @param userId the user's ID
     * @param accountType the user's account type
     * @param username the user's username
     * @param password the user's password
     * @param lastLogin the last time the user logged in
     */

    public User(int userId, String accountType, String username, String password, String lastLogin) {
        this.userId = userId;
        this.accountType = accountType.toLowerCase();
        this.username = username;
        this.password = password;
        this.lastLogin = lastLogin;
    }

    /**
     * @return userId
     */

    public int getUserId() {
        return userId;
    }

    /**
     * @return accountType
     */

    public String getAccountType() {
        return accountType;
    }

    /**
     * @return username
     */

    public String getUsername() {
        return username;
    }

    /**
     * @return password
     */

    public String getPassword() {
        return password;
    }

    /**
     * @return lastLogin
     */

    public String getLastLogin() {
        return lastLogin;
    }

    /**
     * @return "Root" (to be overridden in subclasses)
     */

    @SuppressWarnings("static-method")
    public String getFirstName() {
        return "Root";
    }

    /**
     * @return true if the user is a root user; false otherwise
     */

    public boolean isRoot() {
        return accountType.equals("root");
    }

    /**
     * @return true if the user is an administrator; false otherwise
     */

    public boolean isAdministrator() {
        return accountType.equals("administrator");
    }

    /**
     * @return true if the user is a teacher; false otherwise
     */

    public boolean isTeacher() {
        return accountType.equals("teacher");
    }

    /**
     * @return true if the user is a student; false otherwise
     */

    public boolean isStudent() {
        return accountType.equals("student");
    }
}
