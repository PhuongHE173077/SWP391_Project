/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.CvMentor;
import entity.Mentor;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author TUF F15
 */
public class CvDao extends DBContext {

    public CvMentor getCvMentorByID(int id) {
        String sql = "select * from Cv_Mentor where metor_id =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                CvMentor cv = new CvMentor(rs.getInt(1), rs.getString(3), rs.getString(4), rs.getString(5),rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13));
                return cv;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CvDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }
   
    public Boolean addCvMentor(Mentor mentor) {
        boolean check = false;
        String sql = "INSERT INTO [dbo].[Cv_Mentor]\n"
                + "           ([metor_id]\n"
                + "           ,[full_name]\n"
                + "           ,[email]\n"
                + "           ,[dob]\n"
                + "           ,[gender]\n"
                + "           ,[phone]\n"
                + "           ,[address]\n"
                + "           ,[img]\n"
                + "           ,[education]\n"
                + "           ,[word_experice]\n"
                + "           ,[achievements]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, mentor.getId());
            st.setString(2, mentor.getCv().getFullName());
            st.setString(3, mentor.getCv().getEmail());
            st.setString(4, mentor.getCv().getDob());
            st.setInt(5, mentor.getCv().getGender());
            st.setString(6, mentor.getCv().getPhone());
            st.setString(7, mentor.getCv().getAddress());
            st.setString(8, mentor.getCv().getImg());
            st.setString(9, mentor.getCv().getEducation());
            st.setString(10, mentor.getCv().getWordexpereice());
            st.setString(11, mentor.getCv().getAchievements());
            st.setString(12, mentor.getCv().getStatus());
            st.executeUpdate();
            check = true;
        } catch (SQLException ex) {
            Logger.getLogger(CvDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  check;
    }
    public void updateStatusCV(int mentorid, String status) {
        String query = "UPDATE [dbo].[Cv_Mentor]\n"
                + "   SET [status] = ?\n"
                + " WHERE metor_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, status);
            st.setInt(2, mentorid);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        CvDao cvd = new CvDao();
        System.out.println(cvd.getCvMentorByID(1).getFullName());
    }
}
