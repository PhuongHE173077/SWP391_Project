/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Schedule;
import entity.ScheduleDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.time.LocalDateTime;
import java.sql.Date;
import java.time.LocalDate;

/**
 *
 * @author TUF F15
 */
public class ScheduleDao extends DBContext {

    public Schedule getscheduleMentorNow(int mid, String day) {
        String sql = "select * from schedule where mentor_id =? and startDay >= ? and endDay <= ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, mid);
            st.setString(2, day);
            ResultSet rs = st.executeQuery();
            MentorDao md = new MentorDao();
            ScheduleDetailDao sdd = new ScheduleDetailDao();
            if (rs.next()) {
                return new Schedule(rs.getInt(1), rs.getString(3), rs.getString(4), sdd.getScheduleDtBySid(rs.getInt(1)), md.getMentorByID(rs.getInt(2)), rs.getString(5));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ScheduleDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public Schedule getscheduleByID(int id) {
        String sql = "select * from schedule where id =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            
            ResultSet rs = st.executeQuery();
            MentorDao md = new MentorDao();
            ScheduleDetailDao sdd = new ScheduleDetailDao();
            if (rs.next()) {
                return new Schedule(rs.getInt(1), rs.getString(3), rs.getString(4), sdd.getScheduleDtBySid(rs.getInt(1)), md.getMentorByID(rs.getInt(2)), rs.getString(5));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ScheduleDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Schedule> getSchedulesProcessing(int mid) {
        String sql = "select * from schedule where mentor_id = ? and startDay >= ?";
        List<Schedule> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, mid);
            st.setDate(2, Date.valueOf(LocalDate.now()));
            ResultSet rs = st.executeQuery();
            MentorDao md = new MentorDao();
            ScheduleDetailDao sdd = new ScheduleDetailDao();
            while (rs.next()) {
                Schedule scc = new Schedule(rs.getInt(1), rs.getString(3), rs.getString(4), sdd.getScheduleDtBySid(rs.getInt(1)), md.getMentorByID(rs.getInt(2)), rs.getString(5));
                list.add(scc);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ScheduleDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public boolean createSchedule(int mid, String startDay, String endDay, String Status) {
        boolean check = false;
        String sql = "INSERT INTO [dbo].[schedule]\n"
                + "           ([mentor_id]\n"
                + "           ,[startDay]\n"
                + "           ,[endDay]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, mid);
            st.setString(2, startDay);
            st.setString(3, endDay);
            st.setString(4, Status);
            check = st.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(ScheduleDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;
    }

    public int getscheduleNewID() {
        String sql = "select top 1 * from schedule\n"
                + "order by id desc ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            MentorDao md = new MentorDao();
            ScheduleDetailDao sdd = new ScheduleDetailDao();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ScheduleDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Schedule> getAllSchedule() {
        List<Schedule> list = new ArrayList<>();
        String query = "select * from	schedule";

        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            MentorDao md = new MentorDao();
            ScheduleDetailDao sdd = new ScheduleDetailDao();
            while (rs.next()) {
                Schedule sd = new Schedule(rs.getInt(1), rs.getString(3), rs.getString(4), sdd.getScheduleDtBySid(rs.getInt(1)), md.getMentorByID(rs.getInt(2)), rs.getString(5));
                list.add(sd);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ScheduleDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;

    }

    public List<Schedule> getListByPage(List<Schedule> list, int start, int end) {
        ArrayList<Schedule> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }public boolean updateStatus(String Status,int id) {
        boolean check = false;
        String sql = "UPDATE [dbo].[schedule]\n"
                + "     SET  [status] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, Status);
            st.setInt(2, id);
            st.executeUpdate();
            check = true;
        } catch (SQLException ex) {

        }
        return check;
    }

    public boolean updateSchedule(int mid, String startDay, String endDay, String Status) {
        boolean check = false;
        String sql = "UPDATE [dbo].[schedule]\n"
                + "   SET [mentor_id] = ?\n"
                + "      ,[startDay] = ?\n"
                + "      ,[endDay] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, mid);
            st.setString(2, startDay);
            st.setString(3, endDay);
            st.setString(4, Status);
            st.executeUpdate();
            check = true;
        } catch (SQLException ex) {

        }
        return check;
    }

    public Schedule searchScheduleById(int id) {
        String query = "select * from	schedule where id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            MentorDao md = new MentorDao();
            ScheduleDetailDao sdd = new ScheduleDetailDao();

            if (rs.next()) {
                Schedule scd = new Schedule(rs.getInt(1), rs.getString(3), rs.getString(4), sdd.getScheduleDtBySid(rs.getInt(1)), md.getMentorByID(rs.getInt(2)), rs.getString(5));
                return scd;
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }
    public static void main(String[] args) {
        ScheduleDao sd = new ScheduleDao();
        
                System.out.println(sd.updateStatus("Approve", 10));
    }

}
