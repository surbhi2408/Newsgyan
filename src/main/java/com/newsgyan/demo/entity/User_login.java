package com.newsgyan.demo.entity;

import javax.persistence.*;

@Entity
@Table(name = "user_login")
public class User_login {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String username;
    private String password;
    private int attempt;
    private int status;

    public User_login() {
    }

    public User_login(int id, String username, String password, int attempt, int status) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.attempt = attempt;
        this.status = status;
    }

    public int getAttempt() {
        return attempt;
    }

    public void setAttempt(int attempt) {
        this.attempt = attempt;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
