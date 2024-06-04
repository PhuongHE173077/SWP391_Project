/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class Course {
    private int id;
    private String courseName;
    private String description;
    private double price;
    private Mentor mentor_id;
    private String timeSlot;
    private Skill skill_id;

    public Course() {
    }

    public Course(int id, String courseName, String description, double price, Mentor mentor_id, String timeSlot, Skill skill_id) {
        this.id = id;
        this.courseName = courseName;
        this.description = description;
        this.price = price;
        this.mentor_id = mentor_id;
        this.timeSlot = timeSlot;
        this.skill_id = skill_id;
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

    public Mentor getMentor_id() {
        return mentor_id;
    }

    public void setMentor_id(Mentor mentor_id) {
        this.mentor_id = mentor_id;
    }

    public String getTimeSlot() {
        return timeSlot;
    }

    public void setTimeSlot(String timeSlot) {
        this.timeSlot = timeSlot;
    }

    public Skill getSkill_id() {
        return skill_id;
    }

    public void setSkill_id(Skill skill_id) {
        this.skill_id = skill_id;
    }
    
    
}
