/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;

import entity.Skill;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Dell
 */
public class SkillDetailDao extends DBContext {

    public boolean addSkillDetail(int mid, Skill skill) {
        boolean check = false;
        String sql = "INSERT INTO [dbo].[skill_detail]\n"
                + "           ([skill_id]\n"
                + "           ,[mentor_id])\n"
                + "     VALUES\n"
                + "           (?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, skill.getId());
            st.setInt(2, mid);
            st.executeUpdate();
            check = true;
        } catch (SQLException ex) {
            Logger.getLogger(SkillDetailDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;
    }

    public boolean addRequestkill(int rid, Skill skill) {
        boolean check = false;
        String sql = "INSERT INTO [dbo].[requestSkill]\n"
                + "           ([rid]\n"
                + "           ,[skid])\n"
                + "     VALUES\n"
                + "           (?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, rid);
            st.setInt(2, skill.getId());
            st.executeUpdate();
            check = true;
        } catch (SQLException ex) {
            Logger.getLogger(SkillDetailDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;
    }
       public List<Skill> getListkillByRid(int rid) {
           List<Skill> list = new ArrayList<>();
  
        String sql = "select* from requestSkill where rid =?";
           SkillDao sd = new SkillDao();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, rid);
  
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Skill sk = sd.searchSkill(rs.getInt(2));
                list.add(sk);
                
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(SkillDetailDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    
    public static void main(String[] args) {
        SkillDetailDao sdd = new SkillDetailDao();
        SkillDao sd = new SkillDao();
        Skill sk = sd.searchSkill(1);
        List<Skill> list = sdd.getListkillByRid(1);
        for (Skill skill : list) {
            System.out.println(skill.getSkill());
        }
    }
}
