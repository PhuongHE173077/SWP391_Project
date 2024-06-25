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
        String query = "select * from	skill";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            CategorySkillDao cs = new CategorySkillDao();

            while (rs.next()) {
                list.add(new Skill(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), cs.searchCategorySkill(rs.getInt(5))));
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
               list.add(new Skill(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), cs.searchCategorySkill(rs.getInt(5))));
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
                list.add(new Skill(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), cs.searchCategorySkill(rs.getInt(5))));
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
                Skill abc  = new Skill(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), cs.searchCategorySkill(rs.getInt(5)));
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
     public void insertNewSkill(String skillImage, String skillName, String skillDescription, int skillCategory) {
        String query = "INSERT INTO [dbo].[skill]\n"
                + "           ([skill]\n"
                + "           ,[descpition]\n"
                + "           ,[images]\n"
                + "           ,[cid])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);

            stmt.setString(3, skillImage);
            stmt.setString(1, skillName);
            stmt.setString(2, skillDescription);
            stmt.setInt(4, skillCategory);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteSkill(int id) {//bien request
        String query = "delete from skill where id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public boolean editSkill(int id, String name, String description, String image, int cid) {
        boolean check = false;

        String query = "UPDATE [dbo].[skill]\n"
                + "   SET [skill] = ?\n"
                + "      ,[descpition] = ?\n"
                + "      ,[images] = ?\n"
                + "      ,[cid] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, name);
            st.setString(2, description);
            st.setString(3, image);
            st.setInt(4, cid);
            st.executeUpdate();
            check = true;
        } catch (SQLException e) {
        }
        return check;
    }

    public List<Skill> searchSkillByName(String txtSearch) {
        List<Skill> list = new ArrayList<>();
        String query = "select * from	[skill] where skill like ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, "%" + txtSearch + "%");
            ResultSet rs = st.executeQuery();
            CategorySkillDao cs = new CategorySkillDao();

            while (rs.next()) {
                list.add(new Skill(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), cs.searchCategorySkill(rs.getInt(5))));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Skill> getListByPage(List<Skill> list, int start, int end) {
        ArrayList<Skill> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
    
    public static void main(String[] args) {
        SkillDao sd = new SkillDao();
        List<Skill> list = sd.getAllSkill();
        for (Skill skill : list) {
            System.out.println(skill.getSkill());
        }
        
    }
    

}