/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.List;

/**
 *
 * @author ADMIN
 */
public class Request {
    private int id;
    private Mentor mentor;
    private Mentee mentee;
    private String subject;
    private String deadlinehour;
    private String deadlineday;
    private String content;
    private TimeSlot time;
    private int day_number;
    private String status;
    private List<Skill> SkillRequest;

    public Request() {
    }

    public Request(int id, Mentor mentor, Mentee mentee, String subject, String deadlinehour, String deadlineday, String content, TimeSlot time, int day_number, String status, List<Skill> SkillRequest) {
        this.id = id;
        this.mentor = mentor;
        this.mentee = mentee;
        this.subject = subject;
        this.deadlinehour = deadlinehour;
        this.deadlineday = deadlineday;
        this.content = content;
        this.time = time;
        this.day_number = day_number;
        this.status = status;
        this.SkillRequest = SkillRequest;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Mentor getMentor() {
        return mentor;
    }

    public void setMentor(Mentor mentor) {
        this.mentor = mentor;
    }

    public Mentee getMentee() {
        return mentee;
    }

    public void setMentee(Mentee mentee) {
        this.mentee = mentee;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getDeadlinehour() {
        return deadlinehour;
    }

    public void setDeadlinehour(String deadlinehour) {
        this.deadlinehour = deadlinehour;
    }

    public String getDeadlineday() {
        return deadlineday;
    }

    public void setDeadlineday(String deadlineday) {
        this.deadlineday = deadlineday;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public TimeSlot getTime() {
        return time;
    }

    public void setTime(TimeSlot time) {
        this.time = time;
    }

    public int getDay_number() {
        return day_number;
    }

    public void setDay_number(int day_number) {
        this.day_number = day_number;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<Skill> getSkillRequest() {
        return SkillRequest;
    }

    public void setSkillRequest(List<Skill> SkillRequest) {
        this.SkillRequest = SkillRequest;
    }

    
    
}
