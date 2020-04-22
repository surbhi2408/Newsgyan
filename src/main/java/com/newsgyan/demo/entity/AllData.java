package com.newsgyan.demo.entity;

public class AllData {
    private String name;
    private String address;
    private String phone;
    private String email;
    private String gender;
    private String username;
    private String password;

    public AllData() {
    }

    public AllData(String name, String address, String phone, String email, String gender, String username, String password) {
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.gender = gender;
        this.username = username;
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
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
