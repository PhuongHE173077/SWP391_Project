/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author TUF F15
 */
public class CvMentor {
    private int id;
    private String fullName;
    private String email;
    private String dob;
    private String phone;
    private String address;
    private String img;
    private String education;
    private String wordexpereice;
    private String achievements;
    private String status;

    public CvMentor() {
    }

    public CvMentor(int id, String fullName, String email, String dob, String phone, String address, String img, String education, String wordexpereice, String achievements, String status) {
        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.dob = dob;
        this.phone = phone;
        this.address = address;
        this.img = img;
        this.education = education;
        this.wordexpereice = wordexpereice;
        this.achievements = achievements;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getWordexpereice() {
        return wordexpereice;
    }

    public void setWordexpereice(String wordexpereice) {
        this.wordexpereice = wordexpereice;
    }

    public String getAchievements() {
        return achievements;
    }

    public void setAchievements(String achievements) {
        this.achievements = achievements;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

   
    
    
    
    
}
