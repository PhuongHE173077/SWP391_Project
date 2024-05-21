/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Skill;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class SkillDao extends DBContext{
    public List<Skill> getAllSkill() {
        List<Skill> list = new ArrayList<>();
        String query = "select * from skill";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                list.add(new Skill(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public Skill searchSkill(int id){
        String query = "select * from skill where id = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Skill abc  = new Skill(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
                return abc;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public static void main(String[] args) {
        SkillDao sd = new SkillDao();
        System.out.println(sd.searchSkill(1).getSkil());
    }
    

}