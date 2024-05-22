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
    private String descpition;
    private String images;
    private CategorySkill cs;

    public Skill() {
    }

    public Skill(int id, String skill, String descpition, String images, CategorySkill cs) {
        this.id = id;
        this.skill = skill;
        this.descpition = descpition;
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

    public String getDescpition() {
        return descpition;
    }

    public void setDescpition(String descpition) {
        this.descpition = descpition;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public CategorySkill getCs() {
        return cs;
    }

    public void setCs(CategorySkill cs) {
        this.cs = cs;
    }

    @Override
    public String toString() {
        return "Skill{" + "id=" + id + ", skill=" + skill + ", descpition=" + descpition + ", images=" + images + ", cs=" + cs + '}';
    }
    
    
}
