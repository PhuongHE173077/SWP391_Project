/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author TUF F15
 */
public class DayStartAndEnd {
    private int id;
    private String startDay;
    private String endDay;

    public DayStartAndEnd(int id, String startDay, String endDay) {
        this.id = id;
        this.startDay = startDay;
        this.endDay = endDay;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

  

    public void setStartDay(String startDay) {
        this.startDay = startDay;
    }

    public String getStartDay() {
        return startDay;
    }

    public String getEndDay() {
        return endDay;
    }

    

    public void setEndDay(String endDay) {
        this.endDay = endDay;
    }
    
}
