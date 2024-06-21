/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Mentor;
import entity.Schedule;
import entity.ScheduleMentor;
import entity.Skill;
import entity.User;
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

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            CvDao cvd = new CvDao();
            SkillDao sd = new SkillDao();
            ScheduleMentorDao scd = new ScheduleMentorDao();
            while (rs.next()) {
                List<Skill> list = sd.getSkillOfMentor(rs.getInt(1));
                Mentor mentor = new Mentor(rs.getInt(1), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getInt(11), rs.getDouble(3), rs.getDouble(12), rs.getString(13), cvd.getCvMentorByID(rs.getInt(1)), sd.getSkillOfMentor(rs.getInt(1)), scd.getListScheduleByMentor(rs.getInt(1)));
                listMentor.add(mentor);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MentorDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listMentor;
    }
    public List<Mentor> getAllMentorCVpre() {
        String sql = "SELECT mentor.*, [User].* FROM mentor INNER JOIN [User] ON mentor.userId = [User].user_id  where [User].status = 'Processing'";
        List<Mentor> listMentor = new ArrayList<>();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            CvDao cvd = new CvDao();
            SkillDao sd = new SkillDao();
            ScheduleMentorDao scd = new ScheduleMentorDao();
            while (rs.next()) {
                List<Skill> list = sd.getSkillOfMentor(rs.getInt(1));
                Mentor mentor = new Mentor(rs.getInt(1), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getInt(11), rs.getDouble(3), rs.getDouble(12), rs.getString(13), cvd.getCvMentorByID(rs.getInt(1)), sd.getSkillOfMentor(rs.getInt(1)), scd.getListScheduleByMentor(rs.getInt(1)));
                listMentor.add(mentor);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MentorDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listMentor;
    }
    public void updateStatusMentor(int mentorid, String status) {
        String query = "UPDATE [dbo].[User]\n"
                + "   SET [status] = ?\n"
                + " WHERE user_id = (select userId from mentor where mentor_id = ?)";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, status);
            st.setInt(2, mentorid);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
     public void updateImgMentor(int mentorid, String img) {
        String query = "UPDATE [dbo].[User]\n"
                + "   SET img = ?\n"
                + " WHERE user_id = (select userId from mentor where mentor_id = ?)";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, img);
            st.setInt(2, mentorid);
            st.executeUpdate();
        } catch (Exception e) {
        }
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
            ScheduleMentorDao scd = new ScheduleMentorDao();
            if (rs.next()) {
                Mentor mentor = new Mentor(rs.getInt(1), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getInt(11), rs.getDouble(3), rs.getDouble(12), rs.getString(13), cvd.getCvMentorByID(rs.getInt(1)), sd.getSkillOfMentor(rs.getInt(1)), scd.getListScheduleByMentor(rs.getInt(1)));
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
            ScheduleMentorDao scd = new ScheduleMentorDao();
            if (rs.next()) {
                Mentor mentor = new Mentor(rs.getInt(1), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getInt(11), rs.getDouble(3), rs.getDouble(12), rs.getString(13), cvd.getCvMentorByID(rs.getInt(1)), sd.getSkillOfMentor(rs.getInt(1)), scd.getListScheduleByMentor(rs.getInt(1)));
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
            ScheduleDao scd = new ScheduleDao();
            while (rs.next()) {

                Mentor mentor = getMentorByID(rs.getInt(2));
                listMentor.add(mentor);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MentorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listMentor;
    }

    public void adaMentor(User user, double price) {
        String sql = "INSERT INTO [dbo].[mentor]\n"
                + "           ([userId]\n"
                + "           ,[price])\n"
                + "     VALUES\n"
                + "           (?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, user.getId());
            st.setDouble(2, price);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(MentorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        Mentor me = md .getMentorByID(1);
        System.out.println(me.getName());
       

    }
}
