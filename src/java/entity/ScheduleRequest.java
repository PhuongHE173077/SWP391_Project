/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author TUF F15
 */
 public class ScheduleRequest {
    private int id;
    private ScheduleDetail scd;

    public ScheduleRequest() {
    }

    public ScheduleRequest(int id, ScheduleDetail scd) {
        this.id = id;
        this.scd = scd;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ScheduleDetail getScd() {
        return scd;
    }

    public void setScd(ScheduleDetail scd) {
        this.scd = scd;
    }
    
    
}
