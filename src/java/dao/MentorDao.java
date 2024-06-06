/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Mentor;
import entity.Skill;
import java.sql.Connection;
import java.sql.DriverManager;
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
            CvDao cvd = new CvDao();
            SkillDao sd = new SkillDao();
            while (rs.next()) {
                List<Skill> list = sd.getSkillOfMentor(rs.getInt(1));
                Mentor mentor = new Mentor(rs.getInt(1),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getInt(10),rs.getDouble(11),rs.getString(12),cvd.getCvMentorByID(rs.getInt(1)), list);
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
            CvDao cvd = new CvDao();
            SkillDao sd = new SkillDao();
            while (rs.next()) {
                List<Skill> list = sd.getSkillOfMentor(rs.getInt(1));
                Mentor mentor = new Mentor(rs.getInt(1),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getInt(10),rs.getDouble(11),rs.getString(12),cvd.getCvMentorByID(rs.getInt(1)), list);
                return mentor;
            }
        } catch (SQLException ex) {
            Logger.getLogger(MentorDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }
    
        public Mentor getMentorByUserID(int id) {
        String sql = "SELECT    mentor.*, [User].*\n"
                + "FROM         mentor INNER JOIN\n"
                + "                      [User] ON mentor.userId = [User].user_id"
                + " where [User].user_id =?";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            CvDao cvd = new CvDao();
            SkillDao sd = new SkillDao();
            while (rs.next()) {
                List<Skill> list = sd.getSkillOfMentor(rs.getInt(1));
                Mentor mentor = new Mentor(rs.getInt(1),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getInt(10),rs.getDouble(11),rs.getString(12),cvd.getCvMentorByID(rs.getInt(1)), list);
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
            CvDao cvd = new CvDao();
            SkillDao sd = new SkillDao();
            while (rs.next()) {
                List<Skill> list = sd.getSkillOfMentor(rs.getInt(1));
                Mentor mentor = new Mentor(rs.getInt(1),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getInt(10),rs.getDouble(11),rs.getString(12),cvd.getCvMentorByID(rs.getInt(1)), list);
                listMentor.add(mentor);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MentorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listMentor;
    }

    public void updateUserProfilePicture(String userId, String newPicturePath) throws SQLException {
        String jdbcURL = "jdbc:sqlserver://localhost:1433;databaseName= SWP391_project";
        String jdbcUsername = "sa";
        String jdbcPassword = "123";

        String sql = "update \"User\" set img = ? where user_id = ?";

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword); PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, newPicturePath);
            statement.setString(2, userId);
            statement.executeUpdate();
        }
    }
    

    public static void main(String[] args) {
        MentorDao md = new MentorDao();
        System.out.println(md.getMentorByID(1).getPicture());
    }
}
