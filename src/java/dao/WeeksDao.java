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
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author TUF F15
 */
public class WeeksDao extends DBContext {

    public WeeksDay getWeeksday(int id) {
        String sql = "select * from weeksday where id =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new WeeksDay(rs.getInt(1), rs.getString(2), rs.getString(3));

            }
        } catch (SQLException ex) {
            Logger.getLogger(WeeksDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public List<WeeksDay> getListWeeksDay() {
        String sql = "select * from weeksday ";
        List<WeeksDay> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                WeeksDay w = new WeeksDay(rs.getInt(1), rs.getString(2), rs.getString(3));
                list.add(w);
            }

        } catch (SQLException ex) {
            Logger.getLogger(WeeksDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public WeeksDay getWeekNow(String today) {
        String sql = "select * from weeksday where startDay <= ? and endDay>=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, today);
            st.setString(2, today);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                WeeksDay w = new WeeksDay(rs.getInt(1), rs.getString(2), rs.getString(3));
                return w;
            }
        } catch (SQLException ex) {
            Logger.getLogger(WeeksDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void main(String[] args) {
        WeeksDao wd = new WeeksDao();
        WeeksDay w = wd.getWeeksday(1);
        System.out.println(w.getStartDay());
    }
}
