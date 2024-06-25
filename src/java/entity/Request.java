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
    private List<ScheduleRequest> list;

    public Request() {
        list = new ArrayList<>();
    }
    

    public Request(int id, String subject, Mentee mentee, Mentor mentor, String content, String startDay, String endDay, int slot_number, Skill skill, String dateSent, String status, List<ScheduleRequest> list) {
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
        this.list = list;
    }
    
    
    public int getId() {
        return id;
    }

    public String getSubject() {
        return subject;
    }

    public Mentee getMentee() {
        return mentee;
    }

    public Mentor getMentor() {
        return mentor;
    }

    public String getContent() {
        return content;
    }

    public String getStartDay() {
        return startDay;
    }

    public String getEndDay() {
        return endDay;
    }

    public int getSlot_number() {
        return slot_number;
    }

    public Skill getSkill() {
        return skill;
    }

    public String getDateSent() {
        return dateSent;
    }

    public String getStatus() {
        return status;
    }

    public List<ScheduleRequest> getList() {
        return list;
    }
    
}
