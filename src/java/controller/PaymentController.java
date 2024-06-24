/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;


import dao.PaymentDao;
import entity.Mentee;
import entity.Payment;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import utils.Config;

/**
 *
 * @author Admin
 */
@WebServlet(name = "PaymentController", urlPatterns = {"/payment"})
public class PaymentController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse respone) throws ServletException, IOException {
        int amount = Integer.parseInt(request.getParameter("amount")) ;
        System.out.println(amount);
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String vnp_OrderInfo = request.getParameter("OrderDescription");
        String orderType = "other";
        String vnp_TxnRef = Config.getRandomNumber(8);
        String vnp_IpAddr = Config.getIpAddress(request);
        String vnp_TmnCode = Config.vnp_TmnCode;
        Map vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");
        String bank_code = request.getParameter("bankcode");
        if (bank_code != null && !bank_code.isEmpty()) {
            vnp_Params.put("vnp_BankCode", bank_code);
        }
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", vnp_OrderInfo);
        vnp_Params.put("vnp_OrderType", orderType);

        String locate = request.getParameter("language");
        if (locate != null && !locate.isEmpty()) {
            vnp_Params.put("vnp_Locale", locate);
        } else {
            vnp_Params.put("vnp_Locale", "vn");
        }
        vnp_Params.put("vnp_ReturnUrl", Config.vnp_Returnurl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);
        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));

        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());

        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        //Build data to hash and querystring
        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();

        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = Config.hmacSHA512(Config.vnp_HashSecret, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;

        //Section : Add new payment
        //Get user payment
        
        Mentee mentee = (Mentee) request.getSession().getAttribute("mentee");
        
        String paymentType = request.getParameter("type");
        
        Payment newPayment = new Payment();
        if(paymentType.equalsIgnoreCase("wallet")) {
            newPayment.setAmount(amount);
            newPayment.setRequestId(0);
            newPayment.setUserId(mentee.getId());
            newPayment.setDetail(locate);
            newPayment.setPaymentDate(new Date());
            newPayment.setNote(locate);
            newPayment.setTransactionType(paymentType);
            newPayment.setBankCode(bank_code);
            newPayment.setTransactionType(orderType);
            newPayment.setBankTranNo(vnp_TmnCode);
            newPayment.setCardType("Solid");
            newPayment.setTransactionNo(vnp_IpAddr);
            newPayment.setTransactionStatus("Pending");
            newPayment.setTxnRef(vnp_TxnRef);
            newPayment.setSecureHash(vnp_SecureHash);
            newPayment.setStatus(1);
            new PaymentDao().createPayment(newPayment);          
        } else if(paymentType.equalsIgnoreCase("request")) {
            newPayment.setAmount(amount);
            newPayment.setRequestId(Integer.parseInt(request.getParameter("requestId")));
            newPayment.setUserId(mentee.getId());
            newPayment.setDetail(locate);
            newPayment.setPaymentDate(new Date());
            newPayment.setNote(locate);
            newPayment.setTransactionType(paymentType);
            newPayment.setBankCode(bank_code);
            newPayment.setTransactionType(orderType);
            newPayment.setBankTranNo(vnp_TmnCode);
            newPayment.setCardType("Solid");
            newPayment.setTransactionNo(vnp_IpAddr);
            newPayment.setTransactionStatus("Pending");
            newPayment.setTxnRef(vnp_TxnRef);
            newPayment.setSecureHash(vnp_SecureHash);
            newPayment.setStatus(1);
            new PaymentDao().createPayment(newPayment);
        }
        respone.sendRedirect(paymentUrl);
    }

}
