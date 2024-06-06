/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.List;

/**
 *
 * @author TUF F15
 */
public class Course {
    private int id;
    private String courseName;
    private String description;
    private double price;
    private String status;
    private Mentor mentor;
    private TimeSlot timeSlot;
    private Skill skill;
    private String img;
    private List<WeeksDay> listWeek;

    public Course() {
    }

    public Course(int id, String courseName, String description, double price, String status, Mentor mentor, TimeSlot timeSlot, Skill skill, String img, List<WeeksDay> listWeek) {
        this.id = id;
        this.courseName = courseName;
        this.description = description;
        this.price = price;
        this.status = status;
        this.mentor = mentor;
        this.timeSlot = timeSlot;
        this.skill = skill;
        this.img = img;
        this.listWeek = listWeek;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Mentor getMentor() {
        return mentor;
    }

    public void setMentor(Mentor mentor) {
        this.mentor = mentor;
    }

    public TimeSlot getTimeSlot() {
        return timeSlot;
    }

    public void setTimeSlot(TimeSlot timeSlot) {
        this.timeSlot = timeSlot;
    }

    public Skill getSkill() {
        return skill;
    }

    public void setSkill(Skill skill) {
        this.skill = skill;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public List<WeeksDay> getListWeek() {
        return listWeek;
    }

    public void setListWeek(List<WeeksDay> listWeek) {
        this.listWeek = listWeek;
    }

    
    
    
    
            
}
