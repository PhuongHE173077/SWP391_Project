/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.MenteeDao;
import dao.PaymentDao;
import dao.UserDao;
import entity.Mentee;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import utils.Config;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

/**
 *
 * @author Legion
 */
@WebServlet(name = "HanldePaymentResponseController", urlPatterns = {"/hanlde-payment-respone"})
public class HanldePaymentResponseController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HanldePaymentResponseController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HanldePaymentResponseController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Map fields = new HashMap();
        for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
            String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
            String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                fields.put(fieldName, fieldValue);
            }
        }

        String vnp_SecureHash = request.getParameter("vnp_SecureHash");
        if (fields.containsKey("vnp_SecureHashType")) {
            fields.remove("vnp_SecureHashType");
        }
        if (fields.containsKey("vnp_SecureHash")) {
            fields.remove("vnp_SecureHash");
        }
        String signValue = Config.hashAllFields(fields);
        Mentee mentee = (Mentee) request.getSession().getAttribute("mentee");
        if (signValue.equals(vnp_SecureHash)) {

            if ("00".equals(request.getParameter("vnp_ResponseCode"))) {
                new PaymentDao().updatePayment(request.getParameter("vnp_TxnRef"), 1, "OK", request.getParameter(signValue));
                new UserDao().updateUserBalance(mentee.getId(), Double.parseDouble(request.getParameter("vnp_Amount")) / 100);
            } else {
                new PaymentDao().updatePayment(request.getParameter("vnp_TxnRef"), 2, "ERROR", request.getParameter(signValue));
            }

        } else {
            new PaymentDao().updatePayment(request.getParameter("vnp_TxnRef"), 2, "UNAUTHORIZED", request.getParameter(signValue));
        }

        MenteeDao md = new MenteeDao();
        Mentee mt = md.getMenteeById(mentee.getId());
        request.getSession().setAttribute("mentee", mt);

        response.sendRedirect("home");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
