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
    private int date_number;
    private String descpition;
    private String img;
    private double price;
    private Skill skill_id;
    private CategorySkill cs;
    

    public Course() {
    }

    public Course(int id_course, int date_number, String descpition, String img, double price, Skill skill_id, CategorySkill cs) {
        this.id_course = id_course;
        this.date_number = date_number;
        this.descpition = descpition;
        this.img = img;
        this.price = price;
        this.skill_id = skill_id;
        this.cs = cs;
    }

    public int getId_course() {
        return id_course;
    }

    public void setId_course(int id_course) {
        this.id_course = id_course;
    }

    public int getDate_number() {
        return date_number;
    }

    public void setDate_number(int date_number) {
        this.date_number = date_number;
    }

    public String getDescpition() {
        return descpition;
    }

    public void setDescpition(String descpition) {
        this.descpition = descpition;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
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

    public CategorySkill getCs() {
        return cs;
    }

    public void setCs(CategorySkill cs) {
        this.cs = cs;
    }

    
    
    
}

