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
public class ScheduleMentor {
    private WeeksDay weeksday;
    private List<TimeSlot> listTime;

    public ScheduleMentor() {
        listTime= new ArrayList<>();
    }

    public ScheduleMentor(WeeksDay weeksday, List<TimeSlot> listTime) {
        this.weeksday = weeksday;
        this.listTime = listTime;
    }


    public WeeksDay getWeeksday() {
        return weeksday;
    }

    public void setWeeksday(WeeksDay weeksday) {
        this.weeksday = weeksday;
    }

    public List<TimeSlot> getListTime() {
        return listTime;
    }

    public void setListTime(List<TimeSlot> listTime) {
        this.listTime = listTime;
    }



    
}
