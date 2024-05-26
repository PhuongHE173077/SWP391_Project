/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Mentee;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

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

    public static void main(String[] args) {
        MenteeDao md = new MenteeDao();
//        Mentee m = md.getMentee("phuongbg0910@gmail.com", "123456p");
//        System.out.println(m.getName());
//        System.out.println(md.getMenteeById(12).getPass());
    }
}
