/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Dell
 */
public class Skill {
    private int id;
    private String skill;
    private String decription;
    private String images;
    private CategorySkill cs;
    public Skill() {
    }

    public Skill(int id, String skill, String decription, String images, CategorySkill cs) {
        this.id = id;
        this.skill = skill;
        this.decription = decription;
        this.images = images;
        this.cs = cs;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSkill() {
        return skill;
    }

    public void setSkill(String skill) {
        this.skill = skill;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public String getDecription() {
        return decription;
    }

    public void setDecription(String decription) {
        this.decription = decription;
    }

    public CategorySkill getCs() {
        return cs;
    }

    public void setCs(CategorySkill cs) {
        this.cs = cs;
    }

    

        
    
}
