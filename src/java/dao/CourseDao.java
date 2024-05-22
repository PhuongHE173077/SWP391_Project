/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Course;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class CourseDao extends DBContext{
    public List<Course> getAllCourse() {
        List<Course> list = new ArrayList<>();
        String query = "select * from course";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            SkillDao sd = new SkillDao();
            CategorySkillDao csd = new CategorySkillDao();
            

            while (rs.next()) {
                
                list.add(new Course(rs.getInt(1), rs.getInt(2), rs.getString(4), rs.getString(5), rs.getDouble(3),sd.searchSkill(rs.getInt(6)),csd.searchCategorySkill(rs.getInt(7))));
            }
        } catch (Exception e) {
        }
        return list;
    }
     public List<Course> getTopCourse() {
        List<Course> list = new ArrayList<>();
        String query = "select Top 5 * from course";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            SkillDao sd = new SkillDao();
            CategorySkillDao csd = new CategorySkillDao();
            

            while (rs.next()) {
                
                list.add(new Course(rs.getInt(1), rs.getInt(2), rs.getString(4), rs.getString(5), rs.getDouble(3),sd.searchSkill(rs.getInt(6)),csd.searchCategorySkill(rs.getInt(7))));
            }
        } catch (Exception e) {
        }
        return list;
     }
     public List<Course> getCourseByCid(int cid) {
        List<Course> list = new ArrayList<>();
        String query = "select * from course where cid =?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            
            SkillDao sd = new SkillDao();
            CategorySkillDao csd = new CategorySkillDao();
            while (rs.next()) {
                
                list.add(new Course(rs.getInt(1), rs.getInt(2), rs.getString(4), rs.getString(5), rs.getDouble(3),sd.searchSkill(rs.getInt(6)),csd.searchCategorySkill(rs.getInt(7))));
            }
        } catch (Exception e) {
        }
        return list;
     }
    /**
     * 
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        CourseDao sd = new CourseDao();
        List<Course> list = sd.getCourseByCid(1);
        for (Course course : list){
            System.out.println(course.getSkill_id().getSkil());
        }
    }
    
}
