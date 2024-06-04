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
    private int deadlineday;
    private String content;
    private String status;
    private Course course;


    public Request() {
    }

    public Request(int id, Mentor mentor, Mentee mentee, String subject, int deadlineday, String content, String status, Course course) {
        this.id = id;
        this.mentor = mentor;
        this.mentee = mentee;
        this.subject = subject;
        this.deadlineday = deadlineday;
        this.content = content;
        this.status = status;
        this.course = course;
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

    public int getDeadlineday() {
        return deadlineday;
    }

    public void setDeadlineday(int deadlineday) {
        this.deadlineday = deadlineday;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    

    
    
    

    
    
    
}
