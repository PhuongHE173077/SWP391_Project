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
            CategorySkillDao cs = new CategorySkillDao();

            while (rs.next()) {
                list.add(new Skill(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), cs.searchCategorySkill(rs.getInt(4))));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public List<Skill> getTopSkill() {
        List<Skill> list = new ArrayList<>();
        String query = "select Top 5 * from skill";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            CategorySkillDao cs = new CategorySkillDao();

            while (rs.next()) {
                list.add(new Skill(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), cs.searchCategorySkill(rs.getInt(4))));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public List<Skill> getSkillById(int cid) {
        List<Skill> list = new ArrayList<>();
        String query = "select * from skill where cid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            CategorySkillDao cs = new CategorySkillDao();

            while (rs.next()) {
                list.add(new Skill(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), cs.searchCategorySkill(rs.getInt(4))));
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
            CategorySkillDao cs = new CategorySkillDao();

            if (rs.next()) {
                Skill abc  = new Skill(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), cs.searchCategorySkill(rs.getInt(4)));
                return abc;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
     public List<Skill> getSkillOfMentor(int id) {
        List<Skill> list = new ArrayList<>();
        String query = "select * from skill_detail where mentor_id =?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1,    id);
            ResultSet rs = st.executeQuery();
            CategorySkillDao cs = new CategorySkillDao();
            while (rs.next()) {
                Skill skill = searchSkill(rs.getInt(1));
                list.add(skill);
            }
        } catch (SQLException e) {
        }
        return list;
    }  
    
    
    public static void main(String[] args) {
        SkillDao sd = new SkillDao();
        List<Skill> list = sd.getSkillOfMentor(2);
        for (Skill skill : list) {
            System.out.println(skill.getSkill());
        }
    }
    

}