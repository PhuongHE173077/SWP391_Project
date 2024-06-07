/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Schedule;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author TUF F15
 */
public class ScheduleDao extends DBContext{
    public List<Schedule> getlistScheduleByMentor(int id){
        List<Schedule> list = new ArrayList<>();
        String sql ="";
    }
}
