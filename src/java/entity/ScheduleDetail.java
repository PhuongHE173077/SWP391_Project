/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author TUF F15
 */
public class ScheduleDetail {
    private int id;
    private String day;
    private TimeSlot timeslot;
    private WeeksDay weeksDay;
    private String status;

    public ScheduleDetail(int id, String day, TimeSlot timeslot, WeeksDay weeksDay, String status) {
        this.id = id;
        this.day = day;
        this.timeslot = timeslot;
        this.weeksDay = weeksDay;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public TimeSlot getTimeslot() {
        return timeslot;
    }

    public void setTimeslot(TimeSlot timeslot) {
        this.timeslot = timeslot;
    }

    public WeeksDay getWeeksDay() {
        return weeksDay;
    }

    public void setWeeksDay(WeeksDay weeksDay) {
        this.weeksDay = weeksDay;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
