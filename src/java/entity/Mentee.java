/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author TUF F15
 */
public class Mentee {
    private int id;
    private String name;
    private String email;
    private String pass;
    private String dob;
    private String phone;
    private String picture;
    private double balance;
    private String address;
    private int rid;

    public Mentee() {
    }

    public Mentee(int id, String name, String email, String pass, String dob, String phone, String picture, double balance, String address, int rid) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.pass = pass;
        this.dob = dob;
        this.phone = phone;
        this.picture = picture;
        this.balance = balance;
        this.address = address;
        this.rid = rid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }
    
                
	
}
