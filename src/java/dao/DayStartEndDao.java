/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.DayStartAndEnd;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author TUF F15
 */
public class DayStartEndDao extends DBContext{
    public  List<DayStartAndEnd> getAllDayFE(){
        String sql = "select * from fromDayToDay";
        List<DayStartAndEnd> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                DayStartAndEnd dt = new DayStartAndEnd(rs.getInt(1), rs.getString(2), rs.getString(3));
                list.add(dt);
            }
                    
        } catch (SQLException ex) {
            Logger.getLogger(DayStartEndDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public  List<DayStartAndEnd> getGenderDayFEgenterToDay(){
        String sql = "select top 8 * from fromDayToDay where endDay >= ?";
        List<DayStartAndEnd> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            LocalDate today = LocalDate.now();
            DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String date = today.format(dateFormat);
            st.setString(1, date);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                DayStartAndEnd dt = new DayStartAndEnd(rs.getInt(1), rs.getString(2), rs.getString(3));
                list.add(dt);
            }
                    
        } catch (SQLException ex) {
            Logger.getLogger(DayStartEndDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public DayStartAndEnd getDayinWeekday(String today){
        String sql = "select * from fromDayToDay where startday <= ? and endday >= ?";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, today);
            st.setString(2, today);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                DayStartAndEnd dt = new DayStartAndEnd(rs.getInt(1), rs.getString(2), rs.getString(3));
               return dt;
            }
                    
        } catch (SQLException ex) {
            Logger.getLogger(DayStartEndDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    
    public DayStartAndEnd getDayById(int id){
        String sql = "select * from fromDayToDay where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                DayStartAndEnd dt = new DayStartAndEnd(rs.getInt(1), rs.getString(2), rs.getString(3));
               return dt;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DayStartEndDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public static void main(String[] args) {
        DayStartEndDao dstd = new DayStartEndDao();
        List<DayStartAndEnd> list = dstd.getGenderDayFEgenterToDay();
        for (DayStartAndEnd dayStartAndEnd : list) {
            System.out.println(dayStartAndEnd.getStartDay());
        }
    }
    
}
