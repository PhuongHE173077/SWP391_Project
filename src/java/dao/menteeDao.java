/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Mentee;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author TUF F15
 */
public class MenteeDao extends DBContext {

    public Mentee getMentee(String email, String password) {
        String sql = "select * from [User]\n"
                + "where email = ? and password =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Mentee mt = new Mentee(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getDouble(9), rs.getString(10));
                return mt;
            }
        } catch (SQLException ex) {

        }
        return null;
    }

    public Mentee getMenteeById(int id) {
        String sql = "select * from [User]\n"
                + "where user_id =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Mentee mt = new Mentee(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getDouble(9), rs.getString(10));
                return mt;
            }
        } catch (SQLException ex) {

        }
        return null;
    }
public void updateUserProfilePicture(String userId, String newPicturePath) throws SQLException {
        String jdbcURL = "jdbc:sqlserver://localhost:1433;databaseName= SWP391_project";
        String jdbcUsername = "sa";
        String jdbcPassword = "123";

        String sql = "update \"User\" set img = ? where user_id = ?";

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, newPicturePath);
            statement.setString(2, userId);
            statement.executeUpdate();
        }
    }


public boolean updateMentee(Mentee m) {
    boolean check = false;
    String query = "UPDATE \"User\" SET name = ?, email = ?, password = ?, dob = ?, phone = ?, img = ?, gender = ?, balance = ?, address = ? WHERE user_id = ?";

    try  {
        PreparedStatement ps = connection.prepareStatement(query);
        
        ps.setString(1, m.getName());
        ps.setString(2, m.getEmail());
        ps.setString(3, m.getPass());
        ps.setString(4, m.getDob());
        ps.setString(5, m.getPhone());
        ps.setString(6, m.getPicture());
        ps.setInt(7, m.getGender());
        ps.setDouble(8, m.getBalance());
        ps.setString(9, m.getAddress());
        ps.setInt(10, m.getId());

        ps.executeUpdate();
        check = true;
    } catch (SQLException e) {
        System.out.print(e.getMessage());
        // Hoặc sử dụng logging framework để ghi log
    }
    return check;
}

    public static void main(String[] args) {
        MenteeDao m = new MenteeDao();
        Mentee me = m.getMenteeById(2);
        me.setName("Bao");
        System.out.println(me.getEmail());

        System.out.println(m.updateMentee(me));
    }
}
