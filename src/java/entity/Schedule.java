/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author TUF F15
 */
public class Schedule {
    private int id;
    private WeeksDay weeksDay;
    private TimeSlot timeSlot;
    private String status;
    private DayStartAndEnd dayfromto;

    public Schedule() {
    }

    public Schedule(int id, WeeksDay weeksDay, TimeSlot timeSlot, String status, DayStartAndEnd dayfromto) {
        this.id = id;
        this.weeksDay = weeksDay;
        this.timeSlot = timeSlot;
        this.status = status;
        this.dayfromto = dayfromto;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public WeeksDay getWeeksDay() {
        return weeksDay;
    }

    public void setWeeksDay(WeeksDay weeksDay) {
        this.weeksDay = weeksDay;
    }

    public TimeSlot getTimeSlot() {
        return timeSlot;
    }

    public void setTimeSlot(TimeSlot timeSlot) {
        this.timeSlot = timeSlot;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public DayStartAndEnd getDayfromto() {
        return dayfromto;
    }

    public void setDayfromto(DayStartAndEnd dayfromto) {
        this.dayfromto = dayfromto;
    }

    
    
}
