/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author TUF F15
 */
public class Request {
    private int id;
    private String subject;
    private Mentee mentee;
    private Mentor mentor;
    private String content;
    private String startDay;
    private String endDay;
    private int slot_number;
    private Skill skill;
    private String dateSent;
    private String status;

    public Request() {
    }

    public Request(int id, String subject, Mentee mentee, Mentor mentor, String content, String startDay, String endDay, int slot_number, Skill skill, String dateSent, String status) {
        this.id = id;
        this.subject = subject;
        this.mentee = mentee;
        this.mentor = mentor;
        this.content = content;
        this.startDay = startDay;
        this.endDay = endDay;
        this.slot_number = slot_number;
        this.skill = skill;
        this.dateSent = dateSent;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public Mentee getMentee() {
        return mentee;
    }

    public void setMentee(Mentee mentee) {
        this.mentee = mentee;
    }

    public Mentor getMentor() {
        return mentor;
    }

    public void setMentor(Mentor mentor) {
        this.mentor = mentor;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getStartDay() {
        return startDay;
    }

    public void setStartDay(String startDay) {
        this.startDay = startDay;
    }

    public String getEndDay() {
        return endDay;
    }

    public void setEndDay(String endDay) {
        this.endDay = endDay;
    }

    public int getSlot_number() {
        return slot_number;
    }

    public void setSlot_number(int slot_number) {
        this.slot_number = slot_number;
    }

    public Skill getSkill() {
        return skill;
    }

    public void setSkill(Skill skill) {
        this.skill = skill;
    }

    public String getDateSent() {
        return dateSent;
    }

    public void setDateSent(String dateSent) {
        this.dateSent = dateSent;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    

        

   
    
}
