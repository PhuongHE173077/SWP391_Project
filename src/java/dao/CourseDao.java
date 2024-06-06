/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Course;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author TUF F15
 */
public class CourseDao extends DBContext {

    public List<Course> getAll() {
        String sql = "select * from course";
        List<Course> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            MentorDao md = new MentorDao();
            SkillDao sd = new SkillDao();
            WeeksDao wd = new WeeksDao();
            TimeSlotDao tsd = new TimeSlotDao();
            while (rs.next()) {
                Course course = new Course(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5), md.getMentorByID(rs.getInt(6)),tsd.getTimeSlotByid(rs.getInt(9)), sd.searchSkill(rs.getInt(7)),rs.getString(8),wd.getListWeeksDayByCid(rs.getInt(1)));
                list.add(course);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
// Dee lam sau
//    public List<Course> getTop5CoursePopular() {
//        String sql = "SELECT TOP 5 \n"
//                + "    c.*"
//                + "    COUNT(r.id) AS request_count\n"
//                + "FROM \n"
//                + "    course c\n"
//                + "JOIN \n"
//                + "    request r ON c.id = r.course_id\n"
//                + "GROUP BY \n"
//                + "    c.id, c.courseName, c.description, c.price, c.status,c.mentor_id,c.timeSlot,c.skill_id\n"
//                + "ORDER BY \n"
//                + "    request_count DESC;";
//        List<Course> list = new ArrayList<>();
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            MentorDao md = new MentorDao();
//            SkillDao sd = new SkillDao();
//            while (rs.next()) {
//                Course course = new Course(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5), md.getMentorByID(rs.getInt(6)), rs.getString(7), sd.searchSkill(rs.getInt(8)));
//                list.add(course);
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(CourseDao.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return list;
//    }

    public List<Course> getTop5Course() {
        String sql = "select top 5 * from course";
        List<Course> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            MentorDao md = new MentorDao();
            SkillDao sd = new SkillDao();
            WeeksDao wd = new WeeksDao();
            TimeSlotDao tsd = new TimeSlotDao();
            while (rs.next()) {
                Course course = new Course(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5), md.getMentorByID(rs.getInt(6)),tsd.getTimeSlotByid(rs.getInt(9)), sd.searchSkill(rs.getInt(7)),rs.getString(8),wd.getListWeeksDayByCid(rs.getInt(1)));
                list.add(course);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;

    }
    public List<Course> getCourseBySkillId(int id){
          String sql = "select * from course where skill_id = ?;";
        List<Course> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
             MentorDao md = new MentorDao();
            SkillDao sd = new SkillDao();
            WeeksDao wd = new WeeksDao();
            TimeSlotDao tsd = new TimeSlotDao();
            while (rs.next()) {
                Course course = new Course(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5), md.getMentorByID(rs.getInt(6)),tsd.getTimeSlotByid(rs.getInt(9)), sd.searchSkill(rs.getInt(7)),rs.getString(8),wd.getListWeeksDayByCid(rs.getInt(1)));
                list.add(course);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
        
    }
    public List<Course> getCourseByMentorId(int id){
          String sql = "select * from course where mentor_id = ?;";
        List<Course> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
             MentorDao md = new MentorDao();
            SkillDao sd = new SkillDao();
            WeeksDao wd = new WeeksDao();
            TimeSlotDao tsd = new TimeSlotDao();
            while (rs.next()) {
                Course course = new Course(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5), md.getMentorByID(rs.getInt(6)),tsd.getTimeSlotByid(rs.getInt(9)), sd.searchSkill(rs.getInt(7)),rs.getString(8),wd.getListWeeksDayByCid(rs.getInt(1)));
                list.add(course);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
        
    }
    public Course getCourse(int course_id) {
        String sql = "select * from course\n"
                + "where id =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, course_id);
            ResultSet rs = st.executeQuery();
             MentorDao md = new MentorDao();
            SkillDao sd = new SkillDao();
            WeeksDao wd = new WeeksDao();
            TimeSlotDao tsd = new TimeSlotDao();
            if (rs.next()) {
                Course course = new Course(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5), md.getMentorByID(rs.getInt(6)),tsd.getTimeSlotByid(rs.getInt(9)), sd.searchSkill(rs.getInt(7)),rs.getString(8),wd.getListWeeksDayByCid(rs.getInt(1)));
                return course;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Course> getCourseByCid(int cid) {
        String sql = "SELECT c.*\n"
                + "FROM course c\n"
                + "JOIN skill s ON c.skill_id = s.id\n"
                + "JOIN categorySkill cs ON s.cid = cs.id\n"
                + "WHERE cs.id = ?;";
        List<Course> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            MentorDao md = new MentorDao();
            SkillDao sd = new SkillDao();
            WeeksDao wd = new WeeksDao();
            TimeSlotDao tsd = new TimeSlotDao();
            while (rs.next()) {
                Course course = new Course(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5), md.getMentorByID(rs.getInt(6)),tsd.getTimeSlotByid(rs.getInt(9)), sd.searchSkill(rs.getInt(7)),rs.getString(8),wd.getListWeeksDayByCid(rs.getInt(1)));
                list.add(course);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public static void main(String[] args) {
        CourseDao cd = new CourseDao();
        List<Course> list = cd.getCourseBySkillId(2);
        System.out.println(list.get(0).getCourseName());
    }

}
