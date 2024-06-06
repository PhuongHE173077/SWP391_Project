/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.WeeksDay;
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
public class WeeksDao extends DBContext{
    public WeeksDay getWeeksday(int id){
        String sql ="select * from weeksday where id =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return  new WeeksDay(rs.getInt(1), rs.getString(2));
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(WeeksDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public List<WeeksDay> getListWeeksDayByCid(int cid){
        String sql="select * from WeeksCourse where cid =?";
        List<WeeksDay> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            
            while (rs.next()) {                
                WeeksDay w = getWeeksday(rs.getInt(2));
                list.add(w);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(WeeksDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    } 
    public static void main(String[] args) {
        WeeksDao wd = new WeeksDao();
        List<WeeksDay> list = wd.getListWeeksDayByCid(1);
        for (WeeksDay weeksDay : list) {
            System.out.println(weeksDay.getName());
        }
    }
}
