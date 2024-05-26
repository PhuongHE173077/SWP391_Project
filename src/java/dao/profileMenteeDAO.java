/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import entity.Mentee;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Acer
 */
public class profileMenteeDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;




public boolean updateMentee(Mentee m){
        boolean check = false;
        String query = "update \"User\" set name = ?, email=?, password = ?,dob=?,phone=?,img=?,gender=?, balance=?,address=?\n" +
"where user_id = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
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
