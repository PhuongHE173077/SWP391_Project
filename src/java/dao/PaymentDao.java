/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Mentee;
import entity.Payment;

import entity.User;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class PaymentDao extends DBContext {
    
    public boolean createPayment(Payment payment) {
        boolean rowInserted = false;
        String INSERT_PAYMENT_SQL = "INSERT INTO [SWP391_project].[dbo].[payment] " +
        "(request_id, user_id, amount, datail, paymentDate, note, transactionType, bankCode, bankTranNo, cardType, transactionNo, transactionStatus, txnRef, secureHash, status) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PAYMENT_SQL)) {

            preparedStatement.setInt(1, payment.getRequestId());
            preparedStatement.setInt(2, payment.getUserId());
            preparedStatement.setDouble(3, payment.getAmount()/100);
            preparedStatement.setString(4, payment.getDetail());
            preparedStatement.setDate(5, new java.sql.Date(payment.getPaymentDate().getTime()));
            preparedStatement.setString(6, payment.getNote());
            preparedStatement.setString(7, payment.getTransactionType());
            preparedStatement.setString(8, payment.getBankCode());
            preparedStatement.setString(9, payment.getBankTranNo());
            preparedStatement.setString(10, payment.getCardType());
            preparedStatement.setString(11, payment.getTransactionNo());
            preparedStatement.setString(12, payment.getTransactionStatus());
            preparedStatement.setString(13, payment.getTxnRef());
            preparedStatement.setString(14, payment.getSecureHash());
            preparedStatement.setInt(15, payment.getStatus());

            rowInserted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("createPayment: " + e.getMessage());
        }
        return rowInserted;
    }
    
    public boolean updatePayment(String txnRef, int status, String transactionStatus, String bankCode) {
        boolean rowUpdated = false;
        String UPDATE_PAYMENT_SQL = "UPDATE [SWP391_project].[dbo].[payment] SET " +
        "status = ?, transactionStatus = ?, bankCode = ? WHERE txnRef = ?";
        try (
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PAYMENT_SQL)) {

            preparedStatement.setInt(1, status);
            preparedStatement.setString(2, transactionStatus);
            preparedStatement.setString(3, bankCode);
            preparedStatement.setString(4, txnRef);

            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("updatePayment: " + e.getMessage());
        }
        return rowUpdated;
    }
      public List<Payment> getAllPayment() {
        List<Payment> list = new ArrayList<>();
        String query = "SELECT * FROM [dbo].[Payment] ORDER BY [id] DESC";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            CategorySkillDao cs = new CategorySkillDao();

            while (rs.next()) {
                Payment p = new Payment(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12), 
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15),
                        rs.getInt(16));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Payment> getListByPage(List<Payment> list, int start, int end) {
        ArrayList<Payment> arr = new ArrayList<>();
        for(int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
    public static void main(String[] args) {
        PaymentDao pd = new PaymentDao();
         Date date = Date.valueOf(LocalDate.now());
        Payment p = new Payment(0, 0, 1, 5000.00, "abc", date, "abc", "abc", "abc", "abc", "abc", "abc", "abc", "abc", "abc", 0);
        System.out.println(pd.createPayment(p));
    }

}
