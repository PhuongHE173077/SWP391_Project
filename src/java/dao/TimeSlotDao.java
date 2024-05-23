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
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author ADMIN
 */
public class TimeSlotDao extends DBContext{
    public List<TimeSlot> getAllTimeSlot (){
         String query = "select * from time_slot  ";
         List<TimeSlot>list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(query);
            
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
             TimeSlot time  = new TimeSlot(rs.getInt(1),rs.getString(2));
                list.add(time);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    public TimeSlot searchTimeSlot (int id){
         String query = "select * from time_slot where id = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
             TimeSlot abc  = new TimeSlot(rs.getInt(1),rs.getString(2));
                return abc;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
}
