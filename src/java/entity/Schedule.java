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
public class Schedule {
    private int id;
    private String startDay;
    private String endDay;
    private List<ScheduleDetail>listschedule;
    private Mentor mementor;
    private String status;

    public Schedule() {
        listschedule = new ArrayList<>();
    }

    public Schedule(int id, String startDay, String endDay, List<ScheduleDetail> listschedule, Mentor mementor, String status) {
        this.id = id;
        this.startDay = startDay;
        this.endDay = endDay;
        this.listschedule = listschedule;
        this.mementor = mementor;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public List<ScheduleDetail> getListschedule() {
        return listschedule;
    }

    public void setListschedule(List<ScheduleDetail> listschedule) {
        this.listschedule = listschedule;
    }

    public Mentor getMementor() {
        return mementor;
    }

    public void setMementor(Mentor mementor) {
        this.mementor = mementor;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

   

    
}
