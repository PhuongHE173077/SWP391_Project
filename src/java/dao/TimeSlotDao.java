/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.TimeSlot;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author TUF F15
 */
public class TimeSlotDao extends DBContext{
    public TimeSlot getTimeSlotByid(int id){
        String sql = "select * from timeSlot where id =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                TimeSlot ts = new TimeSlot(rs.getInt(1), rs.getString(2));
                return ts;
            }
        } catch (SQLException ex) {
            Logger.getLogger(TimeSlotDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
