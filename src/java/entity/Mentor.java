  /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class Mentor {
    private int id;
   private String name;
    private String email;
    private String pass;
    private String dob;
    private String phone;
    private String picture;
    private int render;
    private double price;
    private double balance;
    private String address; 
    private CvMentor cv;
    private List<Skill> skillList ; 
    private List<ScheduleMentor> schedule;

    public Mentor(int aInt, User string) {
        skillList = new ArrayList<>();
        schedule = new ArrayList<>();
    }

    public Mentor(int id, String name, String email, String pass, String dob, String phone, String picture, int render, double price, double balance, String address, CvMentor cv, List<Skill> skillList, List<ScheduleMentor> schedule) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.pass = pass;
        this.dob = dob;
        this.phone = phone;
        this.picture = picture;
        this.render = render;
        this.price = price;
        this.balance = balance;
        this.address = address;
        this.cv = cv;
        this.skillList = skillList;
        this.schedule = schedule;
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

    public int getRender() {
        return render;
    }

    public void setRender(int render) {
        this.render = render;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
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

    public CvMentor getCv() {
        return cv;
    }

    public void setCv(CvMentor cv) {
        this.cv = cv;
    }

    public List<Skill> getSkillList() {
        return skillList;
    }

    public void setSkillList(List<Skill> skillList) {
        this.skillList = skillList;
    }

    public List<ScheduleMentor> getSchedule() {
        return schedule;
    }

    public void setSchedule(List<ScheduleMentor> schedule) {
        this.schedule = schedule;
    }

    

    
   
    

   
    

   
    

    
    
    
}
