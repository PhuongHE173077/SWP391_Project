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
public class ScheduleDao extends DBContext {

    public List<Schedule> getlistScheduleByMentor(int id) {
        List<Schedule> list = new ArrayList<>();
        String sql = "select * from schedul_mentor where mid =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            WeeksDao wd = new WeeksDao();
            TimeSlotDao tsd = new TimeSlotDao();
            while (rs.next()) {
                Schedule s = new Schedule(rs.getInt(1), wd.getWeeksday(rs.getInt(2)), tsd.getTimeSlotByid(3), rs.getString(4));
                list.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ScheduleDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Schedule getlistScheduleMetorById(int id) {
        String sql = "select * from schedul_mentor where id =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            WeeksDao wd = new WeeksDao();
            TimeSlotDao tsd = new TimeSlotDao();
            while (rs.next()) {
                Schedule s = new Schedule(rs.getInt(1), wd.getWeeksday(rs.getInt(2)), tsd.getTimeSlotByid(3), rs.getString(4));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ScheduleDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Schedule> getlistScheduleByInRequest(int id) {
        List<Schedule> list = new ArrayList<>();
        String sql = "select * from schedul_request where rid =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            WeeksDao wd = new WeeksDao();
            TimeSlotDao tsd = new TimeSlotDao();
            while (rs.next()) {
                Schedule s = new Schedule(rs.getInt(1), wd.getWeeksday(rs.getInt(2)), tsd.getTimeSlotByid(3), "Active");
                list.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ScheduleDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public boolean addSchedule(int rid, Schedule sch) {
        boolean check = false;
        String sql = "INSERT INTO [dbo].[schedul_request]\n"
                + "           ([WeeksDayId]\n"
                + "           ,[timeId]\n"
                + "           ,[rid])\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sch.getWeeksDay().getId());
            st.setInt(2, sch.getTimeSlot().getId());
            st.setInt(3, rid);
            st.executeUpdate();
            check= true;
         } catch (SQLException ex) {
            Logger.getLogger(ScheduleDao.class.getName()).log(Level.SEVERE, null, ex);
        }  
        return check;
    }

    public static void main(String[] args) {
        ScheduleDao sc = new ScheduleDao();
       Schedule s = sc.getlistScheduleMetorById(32);
        System.out.println(sc.addSchedule(1, s));
        
    }
}
