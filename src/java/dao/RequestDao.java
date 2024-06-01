/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import controller.request;
import entity.Mentee;
import entity.Mentor;
import entity.Request;
import entity.Skill;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
            SkillDetailDao sdd = new SkillDetailDao();
            MentorDao mentor = new MentorDao();
            MenteeDao mentee = new MenteeDao();
            while (rs.next()) {
                Skill skill = sk.searchSkill(rs.getInt(8));
                Request rq = new Request(rs.getInt(1), mentor.getMentorByID(rs.getInt(4)), mentee.getMenteeById(3), rs.getString(2), rs.getInt(6), rs.getInt(5), rs.getString(7), rs.getString(9), skill, rs.getString(10));
                list.add(rq);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RequestDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public int getCountRequest(int id) {
        String query = "select count(*) from request where mentee_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RequestDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return 0;
    }

    public List<Request> getAllRequestOfMentee(int id) {
        String query = "select * from request where mentee_id = ?";
        List<Request> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            SkillDao sk = new SkillDao();
            SkillDetailDao sdd = new SkillDetailDao();
            MentorDao mentor = new MentorDao();
            MenteeDao mentee = new MenteeDao();
            while (rs.next()) {
                Skill skill = sk.searchSkill(rs.getInt(8));
                Request rq = new Request(rs.getInt(1), mentor.getMentorByID(rs.getInt(4)), mentee.getMenteeById(3), rs.getString(2), rs.getInt(6), rs.getInt(5), rs.getString(7), rs.getString(9), skill, rs.getString(10));
                list.add(rq);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RequestDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public void addRequest(Request r) {
        String sql = "INSERT INTO [dbo].[request]\n"
                + "           ([subject]\n"
                + "           ,[mentee_id]\n"
                + "           ,[mentor_id]\n"
                + "           ,[DeadlineDay]\n"
                + "           ,[DeadlineHours]\n"
                + "           ,[content]\n"
                + "           ,[skillId]\n"
                + "           ,[status]"
                + ",[dateRequest])\n"
                + "     VALUES\n"
                + "           (?,?,? ,? ,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, r.getSubject());
            st.setInt(2, r.getMentee().getId());
            st.setInt(3, r.getMentor().getId());
            st.setInt(4, r.getDeadlineday());
            st.setInt(5, r.getDeadlinehour());
            st.setString(6, r.getContent());
            st.setInt(7, r.getSkill().getId());
            st.setString(8, r.getStatus());
            st.setString(9, r.getDateRq());
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RequestDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static void main(String[] args) {
        MentorDao mentorDao = new MentorDao();
        SkillDao sd = new SkillDao();
        MenteeDao md = new MenteeDao();
        RequestDao rqDao = new RequestDao();
        LocalDate dateRq = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String dateString = dateRq.format(formatter);
        Request r = new Request(0, mentorDao.getMentorByID(2), md.getMenteeById(1), "abc", 10, 2, "abc", "Processing", sd.searchSkill(1), dateString);
        rqDao.addRequest(r);
    }
}
