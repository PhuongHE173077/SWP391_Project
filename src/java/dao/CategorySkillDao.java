/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package dao;

import context.DBContext;
import entity.CategorySkill;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class CategorySkillDao extends DBContext{
    public List<CategorySkill> getAllCategorySkill() {
        List<CategorySkill> list = new ArrayList<>();
        String query = "select * from CategorySkill";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                list.add(new CategorySkill(rs.getInt(1) ,rs.getString(2)));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public CategorySkill searchCategorySkill(int id){
        String query = "select * from CategorySkill where id = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                CategorySkill abc  = new CategorySkill(rs.getInt(1),rs.getString(2));
                return abc;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        CategorySkillDao csd = new CategorySkillDao();
        System.out.println(csd.searchCategorySkill(1).getName());
    }
    
}
