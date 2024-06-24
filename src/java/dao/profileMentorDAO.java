/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Mentee;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import entity.Mentor;
import java.lang.System.Logger;
import java.lang.System.Logger.Level;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Acer
 */
public class profileMentorDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

  public List<Mentor> getAll() {
        List<Mentor> list = new ArrayList<>();
        String query = "select * from \"Mentor\"";
        
        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
             
            while (rs.next()) {
                Mentor mentor;
                mentor = new Mentor( 
                        rs.getInt("mentor_id"),
                        rs.getString("name"),
                        rs.getString("password"),
                        rs.getString("name"), 
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("address"), 
                        rs.getInt("status"),
                        rs.getDouble("price"),
                        rs.getDouble("rating"), 
                        rs.getString("img"));
                list.add(mentor);
            }
        } catch (Exception e) {
        }
        return list;
    }


    public boolean updateMentor(Mentor m) {
        boolean check = false;
        String query = "update \"mentor\" set name = ?, email=?,dob=?,gender=?, phone=?,address=?, img=?, education=?,word_experice=?,achievements=? \n"
                + "where mentor_id = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, m.getName());
            ps.setString(2, m.getEmail());
            ps.setString(3, m.getPass());
            ps.setString(4, m.getDob());
            ps.setString(5, m.getPhone());
            ps.setString(6, m.getPicture());
           // ps.setInt(7, m.getGender());
            ps.setDouble(8, m.getBalance());
            ps.setString(9, m.getAddress());
            ps.setInt(10, m.getId());
            ps.executeUpdate();
            check = true;
        } catch (Exception e) {
        }
        return check;
    }

    public static void main(String[] args) {
        profileMenteeDAO dao = new profileMenteeDAO();
        MenteeDao m = new MenteeDao();
        Mentee me = m.getMenteeById(2);
        me.setName("Bao");
        System.out.println(me.getEmail());

        System.out.println(dao.updateMentee(me));
    }
}