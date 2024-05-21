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
    private String skil;
    private String descpition;
    private String img;

    public Skill() {
    }

    public Skill(int id, String skil, String descpition, String img) {
        this.id = id;
        this.skil = skil;
        this.descpition = descpition;
        this.img = img;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSkil() {
        return skil;
    }

    public void setSkil(String skil) {
        this.skil = skil;
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

    @Override
    public String toString() {
        return "skill{" + "id=" + id + ", skil=" + skil + ", descpition=" + descpition + ", img=" + img + '}';
    }
}
