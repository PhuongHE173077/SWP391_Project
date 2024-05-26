/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Mentee;
import entity.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author TUF F15
 */
public class UserDao extends DBContext {

    public List<User> getUser() {
        List<User> list = new ArrayList<>();
        String sql = "select * from [User]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getDouble(9), rs.getString(10), rs.getInt(11));
                list.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public boolean addUser(User user) {
        boolean check = false;
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([name]\n"
                + "           ,[email]\n"
                + "           ,[password]\n"
                + "           ,[dob]\n"
                + "           ,[phone]\n"
                + "    \n"
                + "           ,[gender]\n"
                + "           ,[balance]\n"
                + "           ,[address]\n"
                + "           ,[rid])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           \n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getName());
            st.setString(2, user.getEmail());
            st.setString(3, user.getPass());
            st.setString(4, user.getDob());
            st.setString(5, user.getPhone());
            st.setInt(6, user.getGender());
            st.setDouble(7, user.getBalance());
            st.setString(8, user.getAddress());
            st.setInt(9, user.getRole_id());
            st.executeUpdate();
            check = true;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;
    }

    public static void main(String[] args) {
        UserDao ud = new UserDao();
//        List<User> list = ud.getUser();
//        for (User user : list) {
//            System.out.println(user.getRole_id());
//        }
        List<User> list = ud.getUser();
        for (User user : list) {
            System.out.println(user.getRole_id());
        }
        User user = new User(5, "phuong", "phuongddhe173077@fpt.edu.vn", "123456", "20/2/2003", "0123505412", "null", 1, 0, "bg", 0);
        System.out.println(ud.addUser(user));
    }
    
    public User checkLogin(String email, String pass) {
        String sql = "select * from [User] where [email] = ? and [password] = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getDouble(9), rs.getString(10), rs.getInt(11));
                        
                return user;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public boolean changePassword(String email, String pass) {
        boolean check = false;
        String sql = "update [User] SET [password] = ? WHERE [email] = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, pass);
            ps.setString(2, email);
            ps.executeUpdate();
            check = true;
            connection.close();
        } catch (SQLException e) {
        }
        return check;
    }
    
    public User checkEmail(String email) {
        String sql = "SELECT * from [User] WHERE [email] = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                 User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getDouble(9), rs.getString(10), rs.getInt(11));
                return user;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public User getUserByEmail(String email) {
        String sql = "select * from [User] where [email] = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                 User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getDouble(9), rs.getString(10), rs.getInt(11));
                return user;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

}
