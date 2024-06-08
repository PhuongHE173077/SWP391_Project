/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Schedule;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author TUF F15
 */
public class ScheduleDao extends DBContext{
    public List<Schedule> getlistScheduleByMentor(int id){
        List<Schedule> list = new ArrayList<>();
        String sql ="select * from schedul_mentor where mid =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            WeeksDao wd = new WeeksDao();
            TimeSlotDao tsd = new TimeSlotDao();
            while (rs.next()) {                
                Schedule s =  new Schedule(rs.getInt(1), wd.getWeeksday(rs.getInt(2)), tsd.getTimeSlotByid(3), rs.getString(4));
                list.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ScheduleDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public List<Schedule> getlistScheduleByInRequest(int id){
        List<Schedule> list = new ArrayList<>();
        String sql ="select * from	schedul_request where rid =1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            WeeksDao wd = new WeeksDao();
            TimeSlotDao tsd = new TimeSlotDao();
            while (rs.next()) {                
                Schedule s =  new Schedule(rs.getInt(1), wd.getWeeksday(rs.getInt(2)), tsd.getTimeSlotByid(3), "Active");
                list.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ScheduleDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public static void main(String[] args) {
        ScheduleDao sc = new ScheduleDao();
        List<Schedule> list = sc.getlistScheduleByMentor(1);
        for (Schedule schedule : list) {
            System.out.println(schedule.getWeeksDay().getName() +" : "+
                    schedule.getTimeSlot().getName());
        }
    }
}

