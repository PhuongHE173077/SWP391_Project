/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Mentee;
import entity.Payment;
import entity.Request;
import entity.User;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class PaymentDao extends DBContext {

    public boolean addPayment(Payment payment) {
        boolean check = false;
        String sql = "INSERT INTO [dbo].[payment]\n"
                + "           ([request_id]\n"
                + "           ,[amount]\n"
                + "           ,[date_payment]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)\n";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, payment.getRequest_id().getId());
            st.setDouble(2, payment.getAmount());
            st.setString(3, payment.getDate_payment());
            st.setString(4, payment.getStatus());
            st.executeUpdate();
            check = true;
        } catch (SQLException ex) {
            Logger.getLogger(PaymentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;
    }

    public List<Payment> getPaymentByUserID(Mentee mentee) {
        String sql = "SELECT payment.*\n"
                + "FROM   payment INNER JOIN\n"
                + "             request ON payment.request_id = request.id INNER JOIN\n"
                + "             [User] ON request.mentee_id = [User].user_id\n"
                + "WHERE [User].user_id = ?";
        List<Payment> list = new ArrayList<>();
        PreparedStatement st = null;
        ResultSet rs = null;
        RequestDao rd = new RequestDao();

        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, mentee.getId());
            rs = st.executeQuery();
            while (rs.next()) {
                Payment payment = new Payment(
                        rs.getInt("id"),
                        rd.getRequestById(rs.getInt(2)),
                        rs.getDouble("amount"),
                        rs.getString("date_payment"),
                        rs.getString("status")
                );
                list.add(payment);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PaymentDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(PaymentDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return list;
    }

    public static void main(String[] args) {
        PaymentDao pd = new PaymentDao();
        RequestDao rq = new RequestDao();
        System.out.println(pd.addPayment(new Payment(1, rq.getTop1Rq(), 1000, "20-02-2024", "payed")));

    }
}
