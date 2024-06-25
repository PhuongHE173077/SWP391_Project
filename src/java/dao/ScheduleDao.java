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
import java.util.logging.Level;
import java.util.logging.Logger;

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
}
