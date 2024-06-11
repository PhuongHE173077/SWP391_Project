/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Schedule;
import entity.ScheduleMentor;
import entity.TimeSlot;
import entity.WeeksDay;
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
public class ScheduleMentorDao extends DBContext {

    public List<ScheduleMentor> getListScheduleByMentor(int id) {
        WeeksDao w = new WeeksDao();
        List<ScheduleMentor> list = new ArrayList<>();
        List<WeeksDay> listw = w.getListWeeksDaybyMid(id);
        for (WeeksDay weeksDay : listw) {
            list.add(new ScheduleMentor(weeksDay, getTimeSlotShedule(weeksDay.getId(), id)));
        }
        return list;

    }
    public void deleteShedule(int Wid, int mid) {
        String sql = "delete schedul_mentor where mid =? and WeeksDayId = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, mid);
            st.setInt(2, Wid);
            st.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ScheduleMentorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addShedule(int Wid, int timeid, int mid, String status) {
        String sql = "INSERT INTO [dbo].[schedul_mentor]\n"
                + "           ([WeeksDayId]\n"
                + "           ,[timeId]\n"
                + "           ,[mid]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, mid);
            st.setInt(2, timeid);
            st.setInt(3, mid);
            st.setString(4, status);
            st.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ScheduleMentorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public List<TimeSlot> getTimeSlotShedule(int Wid, int mid) {
        String sql = "SELECT *\n"
                + "FROM [dbo].[schedul_mentor]\n"
                + "where mid = ? and WeeksDayId =? \n"
                + "ORDER BY WeeksDayId ";
        List<TimeSlot> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, mid);
            st.setInt(2,Wid);
            ResultSet rs =st.executeQuery();
            TimeSlotDao tsd = new TimeSlotDao();
            while (rs.next()) {
                TimeSlot t = tsd.getTimeSlotByid(rs.getInt(3));
                list.add(new TimeSlot(rs.getInt(1),t.getName()));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ScheduleMentorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return list;
    }
    public List<TimeSlot> getTimeSlotInDay(int Wid, int mid) {
        String sql = "SELECT *\n"
                + "FROM [dbo].[schedul_mentor]\n"
                + "where mid = ? and WeeksDayId =? \n"
                + "ORDER BY WeeksDayId ";
        List<TimeSlot> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, mid);
            st.setInt(2,Wid);
            ResultSet rs =st.executeQuery();
            TimeSlotDao tsd = new TimeSlotDao();
            while (rs.next()) {
                TimeSlot t = tsd.getTimeSlotByid(rs.getInt(3));
                list.add(t);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ScheduleMentorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public static void main(String[] args) {
        ScheduleMentorDao scmd = new ScheduleMentorDao();
        List<ScheduleMentor> list = scmd.getListScheduleByMentor(6);
        for (ScheduleMentor scheduleMentor : list) {
            System.out.println(scheduleMentor.getListTime().get(0).getName());
        }
    }
}
