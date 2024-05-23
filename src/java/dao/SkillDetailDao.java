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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Dell
 */
public class SkillDetailDao extends DBContext {

    public void addSkillDetail(int rid, Skill skill) {
        String sql = "INSERT INTO [dbo].[skill_detail]\n"
                + "           ([skill_id]\n"
                + "           ,[mentor_id])\n"
                + "     VALUES\n"
                + "           (?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, rid);
            st.setInt(2, skill.getId());
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SkillDetailDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
