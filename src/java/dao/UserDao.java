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
                User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(11));
                list.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void addUser(User user, int rol) {
        
    }

    public static void main(String[] args) {
        UserDao ud = new UserDao();
//        List<User> list = ud.getUser();
//        for (User user : list) {
//            System.out.println(user.getRole_id());
//        }
        System.out.println(ud.getUserByEmail("tienanhbkp03@gmail.com").getId());
    }
    
    public User checkLogin(String email, String pass) {
        String sql = "select * from [User] where [email] = ? and [password] = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setEmail(rs.getString(3));
                user.setPass(rs.getString(4));
                user.setRole_id(rs.getInt(11));
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
                User user = new User();
                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setEmail(rs.getString(3));
                user.setPass(rs.getString(4));
                user.setRole_id(rs.getInt(11));
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
                User user = new User();
                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setEmail(rs.getString(3));
                user.setPass(rs.getString(4));
                user.setRole_id(rs.getInt(11));
                return user;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
