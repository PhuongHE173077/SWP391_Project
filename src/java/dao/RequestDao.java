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
import entity.Schedule;
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
import javax.print.attribute.standard.SheetCollate;

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
            ScheduleDao sd = new ScheduleDao();
            MentorDao mentor = new MentorDao();
            MenteeDao mentee = new MenteeDao();
            SkillDao ssd = new SkillDao();
            while (rs.next()) {

                Request rq = new Request(rs.getInt(1), mentor.getMentorByID(rs.getInt(4)), mentee.getMenteeById(3), rs.getString(2), rs.getString(5), rs.getInt(9), rs.getString(6), ssd.searchSkill(rs.getInt(7)), rs.getString(8), sd.getlistScheduleByInRequest(rs.getInt(1)));
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
            ScheduleDao sd = new ScheduleDao();
            MentorDao mentor = new MentorDao();
            MenteeDao mentee = new MenteeDao();
            SkillDao ssd = new SkillDao();
            while (rs.next()) {

                Request rq = new Request(rs.getInt(1), mentor.getMentorByID(rs.getInt(4)), mentee.getMenteeById(3), rs.getString(2), rs.getString(5), rs.getInt(9), rs.getString(6), ssd.searchSkill(rs.getInt(7)), rs.getString(8), sd.getlistScheduleByInRequest(rs.getInt(1)));
                list.add(rq);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RequestDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public List<Request> getAllRequestOfMentor(int id) {
        String query = "SELECT    request.*\n"
                + "FROM         course INNER JOIN\n"
                + "request ON course.id = request.course_id\n"
                + "Where course.status = 'active' and request.mentor_id=?";
        List<Request> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            ScheduleDao sd = new ScheduleDao();
            MentorDao mentor = new MentorDao();
            MenteeDao mentee = new MenteeDao();
            SkillDao ssd = new SkillDao();
            while (rs.next()) {

                Request rq = new Request(rs.getInt(1), mentor.getMentorByID(rs.getInt(4)), mentee.getMenteeById(3), rs.getString(2), rs.getString(5), rs.getInt(9), rs.getString(6), ssd.searchSkill(rs.getInt(7)), rs.getString(8), sd.getlistScheduleByInRequest(rs.getInt(1)));
                list.add(rq);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RequestDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public boolean addRequest(Request r) {
        boolean check = false;
        String sql = "INSERT INTO [dbo].[request]\n"
                + "           ([subject]\n"
                + "           ,[mentee_id]\n"
                + "           ,[mentor_id]\n"
                + "           ,[DeadlineDay]\n"
                + "           ,[content]\n"
                + "           ,[skill_id]\n"
                + "           ,[status]\n"
                + "           ,[number_stady])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, r.getSubject());
            st.setInt(2, r.getMentee().getId());
            st.setInt(3, r.getMentor().getId());
            st.setString(4, r.getDeadlineday());
            st.setString(5, r.getContent());
            st.setInt(6, r.getSkill().getId());
            st.setString(7, r.getStatus());
            st.setInt(8, r.getDay_number());
            st.executeUpdate();
            String sql2 = "select top 1 * from request\n"
                    + "Order by id desc";
            PreparedStatement st2 = connection.prepareStatement(sql2);
            ResultSet rs = st2.executeQuery();
            ScheduleDao sd = new ScheduleDao();
            if (rs.next()) {
                for (Schedule s : r.getSchedule()) {
                    sd.addSchedule(rs.getInt(1), s);
                }
                check =true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(RequestDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;

    }
    

    public static void main(String[] args) {
        RequestDao r = new RequestDao();
        System.out.println(r.getAllRequestOfMentor(3).get(0));
    }
}
