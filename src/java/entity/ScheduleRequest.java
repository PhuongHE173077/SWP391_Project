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
    private Request rq;
    private String status;

    public ScheduleRequest() {
    }

    public ScheduleRequest(int id, ScheduleDetail scd, Request rq, String status) {
        this.id = id;
        this.scd = scd;
        this.rq = rq;
        this.status = status;
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

    public Request getRq() {
        return rq;
    }

    public void setRq(Request rq) {
        this.rq = rq;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    

    

   
    
    
}
