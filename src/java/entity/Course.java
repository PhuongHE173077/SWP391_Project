/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Dell
 */
public class Course {
    private int id_course;
    private int Date_number;
    private double price;
    private Skill skill_id;

    public Course() {
    }

    public Course(int id_course, int Date_number, double price, Skill skill_id) {
        this.id_course = id_course;
        this.Date_number = Date_number;
        this.price = price;
        this.skill_id = skill_id;
    }

    public int getId_course() {
        return id_course;
    }

    public void setId_course(int id_course) {
        this.id_course = id_course;
    }

    public int getDate_number() {
        return Date_number;
    }

    public void setDate_number(int Date_number) {
        this.Date_number = Date_number;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Skill getSkill_id() {
        return skill_id;
    }

    public void setSkill_id(Skill skill_id) {
        this.skill_id = skill_id;
    }

    @Override
    public String toString() {
        return "Course{" + "id_course=" + id_course + ", Date_number=" + Date_number + ", price=" + price + ", skill_id=" + skill_id + '}';
    }
    

    
    
}

