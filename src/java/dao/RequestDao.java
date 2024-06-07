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

            MentorDao mentor = new MentorDao();
            MenteeDao mentee = new MenteeDao();
            while (rs.next()) {

                Request rq = new Request(rs.getInt(1), mentor.getMentorByID(rs.getInt(4)), mentee.getMenteeById(3), rs.getString(2), rs.getInt(5), rs.getString(6), rs.getString(8), cd.getCourse(rs.getInt(7)));
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
            CourseDao cd = new CourseDao();
            MentorDao mentor = new MentorDao();
            MenteeDao mentee = new MenteeDao();
            while (rs.next()) {

                Request rq = new Request(rs.getInt(1), mentor.getMentorByID(rs.getInt(4)), mentee.getMenteeById(3), rs.getString(2), rs.getInt(5), rs.getString(6), rs.getString(8), cd.getCourse(rs.getInt(7)));
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
            CourseDao cd = new CourseDao();
            MentorDao mentor = new MentorDao();
            MenteeDao mentee = new MenteeDao();
            while (rs.next()) {

                Request rq = new Request(rs.getInt(1), mentor.getMentorByID(rs.getInt(4)), mentee.getMenteeById(rs.getInt(3)), rs.getString(2), rs.getInt(5), rs.getString(6), rs.getString(8), cd.getCourse(rs.getInt(7)));
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
                + "           ,[content]\n"
                + "           ,[course_id]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, r.getSubject());
            st.setInt(2, r.getMentee().getId());
            st.setInt(3, r.getMentor().getId());
            st.setInt(4, r.getDeadlineday());
            st.setString(5, r.getContent());
            st.setInt(6, r.getCourse().getId());
            st.setString(7, r.getStatus());

            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RequestDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static void main(String[] args) {
        RequestDao r = new RequestDao();
        System.out.println(r.getAllRequestOfMentor(3).get(0));
    }
}
