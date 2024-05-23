/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Mentor;
import entity.Skill;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Dell
 */
public class MentorDao extends DBContext {

    public List<Mentor> getAllMentor() {
        String sql = "SELECT    mentor.*, [User].*\n"
                + "FROM         mentor INNER JOIN\n"
                + "                      [User] ON mentor.userId = [User].user_id";
        List<Mentor> listMentor = new ArrayList<>();
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            SkillDao sd = new SkillDao();
            while (rs.next()) {
                List<Skill> list = sd.getSkillOfMentor(rs.getInt(1));
                Mentor mentor = new Mentor(rs.getInt(1), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getDouble(3), rs.getDouble(13), rs.getString(14), list);
                listMentor.add(mentor);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MentorDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listMentor;
    }

    public Mentor getMentorByID(int id) {
        String sql = "SELECT    mentor.*, [User].*\n"
                + "FROM         mentor INNER JOIN\n"
                + "                      [User] ON mentor.userId = [User].user_id"
                + " where mentor_id =?";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            SkillDao sd = new SkillDao();
            if (rs.next()) {
                List<Skill> list = sd.getSkillOfMentor(rs.getInt(1));
                Mentor mentor = new Mentor(rs.getInt(1), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getDouble(3), rs.getDouble(13), rs.getString(14), list);
                return mentor;
            }
        } catch (SQLException ex) {
            Logger.getLogger(MentorDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public List<Mentor> getAllMentorBySkill(int skillId) {
        String sql = "SELECT * from skill_detail\n"
                + "where skill_id = ?";
        List<Mentor> listMentor = new ArrayList<>();
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, skillId);
            ResultSet rs = st.executeQuery();
            SkillDao sd = new SkillDao();
            while(rs.next()) {
               Mentor mentor = getMentorByID(rs.getInt(2));
               listMentor.add(mentor);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MentorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listMentor;
    }

    public static void main(String[] args) {
        MentorDao md = new MentorDao();

        System.out.println(md.getMentorByID(3));
//        List<Mentor> list = md.getMentorByID(3);
//        for (Mentor mentor : list) {
//            System.out.println(mentor.getName());
//        }
    }
}
