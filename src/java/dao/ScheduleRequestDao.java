/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.ScheduleRequest;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author TUF F15
 */
public class ScheduleRequestDao extends DBContext {

    public List<ScheduleRequest> getScheduleRequestsByRid(int rid) {
        String sql = "select * from schedule_request where rid =?";
        List<ScheduleRequest> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, rid);
            ResultSet rs = st.executeQuery();
            ScheduleDetailDao sdd = new ScheduleDetailDao();
            RequestDao rqd = new RequestDao();
            while (rs.next()) {
                ScheduleRequest sr = new ScheduleRequest(rs.getInt(1), sdd.getScheduleDtById(rs.getInt(2)), rqd.getRequestById(rs.getInt(3)),rs.getString(4));
                list.add(sr);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ScheduleRequestDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public boolean createScheduleRequest(int rid, int sd_id) {
        boolean result = false;
        String sql = "INSERT INTO [dbo].[schedule_request]\n"
                + "           ([scheduledd_id]\n"
                + "           ,[rid])\n"
                + "     VALUES\n"
                + "           (?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sd_id);
            st.setInt(2, rid);
            result = st.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(ScheduleRequestDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public List<ScheduleRequest> getScheduleRequestsOfMentee(int wid, int mid) {
        String sql = "SELECT    schedule_request.*\n"
                + "	FROM         schedule_datail INNER JOIN\n"
                + "						  schedule_request ON schedule_datail.id = schedule_request.scheduledd_id\n"
                + "						  where schedule_datail.wid = ?";
        List<ScheduleRequest> listS = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, wid);
            ResultSet rs = st.executeQuery();
            ScheduleDetailDao sdd = new ScheduleDetailDao();
            RequestDao rqd = new RequestDao();
            while (rs.next()) {
                ScheduleRequest sr = new ScheduleRequest(rs.getInt(1), sdd.getScheduleDtById(rs.getInt(2)), rqd.getRequestById(rs.getInt(3)),rs.getString(4));
                if (sr.getRq().getMentee().getId() == mid) {
                    listS.add(sr);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ScheduleRequestDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listS;
    }
    public List<ScheduleRequest> getScheduleRequestsOfMentor(int wid, int mid) {
        String sql = "SELECT    schedule_request.*\n"
                + "	FROM         schedule_datail INNER JOIN\n"
                + "					  	schedule_request ON schedule_datail.id = schedule_request.scheduledd_id\n"
                + "						  where schedule_datail.wid = ?";
        List<ScheduleRequest> listS = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, wid);
            ResultSet rs = st.executeQuery();
            ScheduleDetailDao sdd = new ScheduleDetailDao();
            RequestDao rqd = new RequestDao();
            while (rs.next()) {
                ScheduleRequest sr = new ScheduleRequest(rs.getInt(1), sdd.getScheduleDtById(rs.getInt(2)), rqd.getRequestById(rs.getInt(3)),rs.getString(4));
                if (sr.getRq().getMentor().getId() == mid) {
                    listS.add(sr);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ScheduleRequestDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listS;
    }

    public static void main(String[] args) {
        ScheduleRequestDao srq = new ScheduleRequestDao();
        List<ScheduleRequest> list = srq.getScheduleRequestsOfMentor(4, 1);
        for (ScheduleRequest scheduleRequest : list) {
            System.out.println(scheduleRequest.getScd().getId());
        }
    }
}
