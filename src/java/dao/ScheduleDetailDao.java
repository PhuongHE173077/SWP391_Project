/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import controller.request;
import entity.ScheduleDetail;
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
public class ScheduleDetailDao extends DBContext {

    public List<ScheduleDetail> getScheduleDtBySid(int id) {
        String sql = "select * from schedule_datail where sid =?";
        List<ScheduleDetail> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            TimeSlotDao td = new TimeSlotDao();
            WeeksDao wd = new WeeksDao();
            while (rs.next()) {
                ScheduleDetail sd = new ScheduleDetail(rs.getInt(1), rs.getString(2), td.getTimeSlotByid(rs.getInt(6)), wd.getWeeksday(rs.getInt(4)), rs.getString(5));
                list.add(sd);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ScheduleDetailDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<ScheduleDetail> getScheduleDtInTime(int mid, String startDay, String endDay) {
        String sql = "SELECT    schedule_datail.*\n"
                + "FROM         schedule INNER JOIN\n"
                + "                      schedule_datail ON schedule.id = schedule_datail.sid"
                + "   where schedule.mentor_id = ? and schedule_datail.date>= ? and schedule_datail.date <=?";
        List<ScheduleDetail> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, mid);
            st.setString(2, startDay);
            st.setString(3, endDay);
            ResultSet rs = st.executeQuery();
            TimeSlotDao td = new TimeSlotDao();
            WeeksDao wd = new WeeksDao();
            while (rs.next()) {
                ScheduleDetail sd = new ScheduleDetail(rs.getInt(1), rs.getString(2), td.getTimeSlotByid(rs.getInt(6)), wd.getWeeksday(rs.getInt(4)), rs.getString(5));
                list.add(sd);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ScheduleDetailDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<ScheduleDetail> getScheduleDtByMid(int mid, int wid) {
        String sql = "SELECT    schedule_datail.*\n"
                + "FROM         schedule INNER JOIN\n"
                + "                      schedule_datail ON schedule.id = schedule_datail.sid \n"
                + "					  where schedule.mentor_id =? and schedule_datail.wid =?";
        List<ScheduleDetail> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, mid);
            st.setInt(2, wid);
            ResultSet rs = st.executeQuery();
            TimeSlotDao td = new TimeSlotDao();
            WeeksDao wd = new WeeksDao();
            while (rs.next()) {
                ScheduleDetail sd = new ScheduleDetail(rs.getInt(1), rs.getString(2), td.getTimeSlotByid(rs.getInt(6)), wd.getWeeksday(rs.getInt(4)), rs.getString(5));
                list.add(sd);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ScheduleDetailDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<ScheduleDetail> getScheduleDtByMidAppro(int mid, int wid) {
        String sql = "SELECT    schedule_datail.*\n"
                + "                FROM         schedule INNER JOIN\n"
                + "                                     schedule_datail ON schedule.id = schedule_datail.sid \n"
                + "                				  where schedule.mentor_id =? and schedule_datail.wid =? and schedule.status='Approve'";
        List<ScheduleDetail> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, mid);
            st.setInt(2, wid);
            ResultSet rs = st.executeQuery();
            TimeSlotDao td = new TimeSlotDao();
            WeeksDao wd = new WeeksDao();
            while (rs.next()) {
                ScheduleDetail sd = new ScheduleDetail(rs.getInt(1), rs.getString(2), td.getTimeSlotByid(rs.getInt(6)), wd.getWeeksday(rs.getInt(4)), rs.getString(5));
                list.add(sd);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ScheduleDetailDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int widScheduele() {
        String sql = "SELECT  top 1  schedule_datail.wid\n"
                + "                FROM         schedule INNER JOIN\n"
                + "                                     schedule_datail ON schedule.id = schedule_datail.sid ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public boolean createScheduleDetail(String date, int sid, int wid, int tid) {
        boolean check = false;
        String sql = "INSERT INTO [dbo].[schedule_datail]\n"
                + "           ([date]\n"
                + "           ,[sid]\n"
                + "           ,[wid]\n"
                + "           ,[status]\n"
                + "           ,[tid])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, date);
            st.setInt(2, sid);
            st.setInt(3, wid);
            st.setString(4, "open");
            st.setInt(5, tid);
            check = st.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(ScheduleDetailDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;
    }

    public ScheduleDetail getScheduleDtById(int id) {
        String sql = "select * from schedule_datail where id =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            TimeSlotDao td = new TimeSlotDao();
            WeeksDao wd = new WeeksDao();
            while (rs.next()) {
                ScheduleDetail sd = new ScheduleDetail(rs.getInt(1), rs.getString(2), td.getTimeSlotByid(rs.getInt(6)), wd.getWeeksday(rs.getInt(4)), rs.getString(5));
                return sd;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ScheduleDetailDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean updateStatus(String status, int id) {
        boolean check = false;
        String sql = "UPDATE [dbo].[schedule_datail]\n"
                + "   SET \n"
                + "     [status] = ?\n"
                + " WHERE id =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setInt(2, id);
            check = st.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(ScheduleDetailDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;
    }

    public static void main(String[] args) {
        ScheduleDetailDao sd = new ScheduleDetailDao();
        String timeSchedule[] = {"21", "22"};
        List<ScheduleDetail> lists = new ArrayList<>();
        for (int i = 0; i < timeSchedule.length; i++) {
            int sdid = Integer.parseInt(timeSchedule[i]);
            ScheduleDetail sdt = sd.getScheduleDtById(sdid);
            lists.add(sdt);
        }
        request rq = new request();
        int slotNumber = rq.getSlotRequest("2024-06-25", "2024-07-25", 1, lists);
        System.out.println(slotNumber);

    }
}
