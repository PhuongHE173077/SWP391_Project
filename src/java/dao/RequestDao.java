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
                ScheduleRequestDao srd = new ScheduleRequestDao();
                Request rq = new Request(rs.getInt(1), rs.getString(2), mentee.getMenteeById(rs.getInt(3)), mentor.getMentorByID(rs.getInt(4)), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), ssd.searchSkill(rs.getInt(9)), rs.getString(10), rs.getString(11), srd.getScheduleRequestsByRid(rs.getInt(1)));
                list.add(rq);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RequestDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public int getTop1Rq() {
        String sql = "select top 1 * from request order by id desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RequestDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
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

            MentorDao mentor = new MentorDao();
            MenteeDao mentee = new MenteeDao();
            SkillDao ssd = new SkillDao();
            while (rs.next()) {

                ScheduleRequestDao srd = new ScheduleRequestDao();
                Request rq = new Request(rs.getInt(1), rs.getString(2), mentee.getMenteeById(rs.getInt(3)), mentor.getMentorByID(rs.getInt(4)), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), ssd.searchSkill(rs.getInt(9)), rs.getString(10), rs.getString(11), srd.getScheduleRequestsByRid(rs.getInt(1)));
                list.add(rq);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RequestDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public List<Request> getAllRequestOfMentor(int id) {
        String query = "select * from request where mentor_id =?";
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
                ScheduleRequestDao srd = new ScheduleRequestDao();
                Request rq = new Request(rs.getInt(1), rs.getString(2), mentee.getMenteeById(rs.getInt(3)), mentor.getMentorByID(rs.getInt(4)), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), ssd.searchSkill(rs.getInt(9)), rs.getString(10), rs.getString(11), srd.getScheduleRequestsByRid(rs.getInt(1)));
                list.add(rq);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RequestDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public boolean createRequest(Request r) {
        boolean result = false;
        String sql = "INSERT INTO [dbo].[request]\n"
                + "           ([subject]\n"
                + "           ,[mentee_id]\n"
                + "           ,[mentor_id]\n"
                + "           ,[content]\n"
                + "           ,[startDay]\n"
                + "           ,[endDay]\n"
                + "           ,[slot_number]\n"
                + "           ,[skill_id]\n"
                + "           ,[dateSent]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, r.getSubject());
            st.setInt(2, r.getMentee().getId());
            st.setInt(3, r.getMentor().getId());
            st.setString(4, r.getContent());
            st.setString(5, r.getStartDay());
            st.setString(6, r.getEndDay());
            st.setInt(7, r.getSlot_number());
            st.setInt(8, r.getSkill().getId());
            st.setString(9, r.getDateSent());
            st.setString(10, r.getStatus());
            result = st.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(RequestDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public void deleteRequest(int id) {//bien request
        String query = "delete from request where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    //ham sua
    public Request getRequestById(int id) {
        String query = "select * from request where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            ScheduleDao sd = new ScheduleDao();
            MentorDao mentor = new MentorDao();
            MenteeDao mentee = new MenteeDao();
            SkillDao ssd = new SkillDao();
            if (rs.next()) {
                ScheduleRequestDao srd = new ScheduleRequestDao();
                Request rq = new Request(rs.getInt(1), rs.getString(2), mentee.getMenteeById(rs.getInt(3)), mentor.getMentorByID(rs.getInt(4)), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), ssd.searchSkill(rs.getInt(9)), rs.getString(10), rs.getString(11), srd.getScheduleRequestsByRid(rs.getInt(1)));
                return rq;
            }

        } catch (SQLException ex) {
            Logger.getLogger(RequestDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

//    public boolean editRequest(Request r) {
//        boolean check = false;
//        String query = "UPDATE [dbo].[request]\n"
//                + "   SET [subject] = ?\n"
//                + "      ,[DeadlineDay] = ?\n"
//                + "      ,[content] = ?\n"
//                + "      ,[number_stady] = ?\n"
//                + " WHERE id = ?";
//        try {
//            PreparedStatement st = connection.prepareStatement(query);
//            st.setString(1, r.getSubject());
//            st.setString(2, r.getDeadlineday());
//            st.setString(3, r.getContent());
//            st.setInt(4, r.getDay_number());
//            st.setInt(5, r.getId());
//            st.executeUpdate();
//            check = true;
//        } catch (SQLException e) {
//        }
//        return check;
//    }
    public boolean updateStatus(String status, int id) {
        boolean check = false;
        String sql = "UPDATE [dbo].[request]\n"
                + "   SET \n"
                + "      [status] = ?\n"
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
        RequestDao r = new RequestDao();
        System.out.println(r.getAllRequestOfMentee(1).get(0).getSkill().getSkill());
//        System.out.println(r.getTop1Rq().getMentor());
    }
}
