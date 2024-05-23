/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Mentee;
import entity.Mentor;
import entity.Request;
import entity.Skill;
import entity.TimeSlot;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class RequestDao extends DBContext {

    public List<Request> getAllRequest() {
        String query = "select * from request";
        List<Request> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            SkillDao sk = new SkillDao();
            MentorDao mentor = new MentorDao();
            MenteeDao mentee = new MenteeDao();
            TimeSlotDao time = new TimeSlotDao();
            while (rs.next()) {
                List<Skill> skillList = sk.getSkillOfMentor(rs.getInt(1));
                Request rq = new Request(rs.getInt(1), mentor.getMentorByID(rs.getInt(4)), mentee.getMenteeById(3), rs.getString(2), rs.getString(5), rs.getString(6), time.searchTimeSlot(7), rs.getInt(8), rs.getString(9), skillList);
                list.add(rq);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RequestDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public List<Request> getAllRequestOfMentee(int id) {
        String query = "select * from request where mentee_id = ?";
        List<Request> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            SkillDao sk = new SkillDao();
            MentorDao mentor = new MentorDao();
            MenteeDao mentee = new MenteeDao();
            TimeSlotDao time = new TimeSlotDao();
            while (rs.next()) {
                List<Skill> skillList = sk.getSkillOfMentor(rs.getInt(1));
                Request rq = new Request(rs.getInt(1), mentor.getMentorByID(rs.getInt(4)), mentee.getMenteeById(3), rs.getString(2), rs.getString(5), rs.getString(6), time.searchTimeSlot(7), rs.getInt(8), rs.getString(9), skillList);
                list.add(rq);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RequestDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public void addRequest(Mentee mentee, int mentor_id,String subject,String dday,String dtime,String content, int dayNumber,List<Skill> list, int timeId) {
        String sql = "INSERT INTO [dbo].[request]\n"
                + "           ([subject]\n"
                + "           ,[mentee_id]\n"
                + "           ,[mentor_id]\n"
                + "           ,[deadlineDay]\n"
                + "           ,[deadlineHours]\n"
                + "           ,[content]\n"
                + "           ,[time_slot_id]\n"
                + "           ,[day_number]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
           PreparedStatement st = connection.prepareStatement(sql);
           st.setString(1, subject);
           st.setInt(2, mentee.getId());
           st.setInt(3, mentor_id);
           st.setString(4, dday);
           st.setString(5, dtime);
           st.setString(6, content);
           st.setInt(7, timeId);
           st.setInt(8, dayNumber);
           st.setString(9, "Processing");
           st.executeUpdate();
           String sql2 = "select top 1 * from request";
           PreparedStatement st2 = connection.prepareStatement(sql2);
           ResultSet rs = st2.executeQuery();
           SkillDetailDao sdd = new SkillDetailDao();
            if (rs.next()) {
                int id = rs.getInt(1);
                for (Skill skill : list) {
                    sdd.addSkillDetail(id, skill);
                }
            }
        } catch (Exception e) {
        }
        
    }

    public static void main(String[] args) {

    }
}
