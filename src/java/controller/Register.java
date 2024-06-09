/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.UserDao;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Random;
import service.SendEmail;

/**
 *
 * @author TUF F15
 */
@WebServlet(name="register", urlPatterns={"/register"})
public class Register extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet register</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet register at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String id = request.getParameter("role");
        if (id.equals("mentee")) {
            request.getRequestDispatcher("registerMentee.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("registerMentor.jsp").forward(request, response);
        }
        
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String passCf = request.getParameter("confirmPass");
        String phone = request.getParameter("phoneNumber");
        int gender =Integer.parseInt(request.getParameter("gender"));
        String dob = request.getParameter("dob");
        String address =request.getParameter("address");
        int role = Integer.parseInt(request.getParameter("role"));
        User user;
        if (role == 0) {
            user = new User(0, name, email, pass, dob, phone, "null", gender, 0, address, role,"active");
        }else{
            user = new User(0, name, email, pass, dob, phone, "null", gender, 0, address, role,"Processing");
        }
        
        PrintWriter out = response.getWriter();
        
        UserDao ud = new UserDao();
        List<User> list = ud.getUser();
        // kiem tra xem mail da ton tai ch
        if (checkEmail(list, email)) {
            String error = "This mail is Exits";
            request.setAttribute("error", error);
            if (role == 0 ) {
                 request.getRequestDispatcher("registerMentee.jsp").forward(request, response);
            }else{
                request.getRequestDispatcher("registerMentor.jsp").forward(request, response);
            }
           
        }// kiem tra xem nhap pass và confirm pass có giống nhau ko 
        else if (!pass.equals(passCf)) {
            String error = "Password confirm is different password";
            request.setAttribute("error", error);
           if (role == 0 ) {
                 request.getRequestDispatcher("registerMentee.jsp").forward(request, response);
            }else{
                request.getRequestDispatcher("registerMentor.jsp").forward(request, response);
            }
        }else{
            // tạo 1 mã OTP để verify email
            String code = getRandom();
            SendEmail se = new SendEmail();
            se.sendEmail(email, "Your code is :", code);
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("code", code);
            
          
           
            request.getRequestDispatcher("Verify_Email.jsp").forward(request, response);
        }
            
       
    }
    // random 1 mã OTP
    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }

    // kiem tra xem co trung mail trung data ko
    public Boolean checkEmail(List<User>list, String mail){
        for (User user : list) {
            if (user.getEmail().equals(mail)) {
               return true;
            }
        }
        return false;
    }
    

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
