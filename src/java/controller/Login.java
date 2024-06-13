/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.MenteeDao;
import dao.MentorDao;
import dao.UserDao;
import entity.Mentee;
import entity.Mentor;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author TUF F15
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class Login extends HttpServlet {

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
            out.println("<title>Servlet login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet login at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String Rmb = request.getParameter("rem");
        UserDao ud = new UserDao();
        MenteeDao md = new MenteeDao();
        PrintWriter out = response.getWriter();
        User m = ud.checkLogin(email, password);
        HttpSession session = request.getSession();
        Cookie em = new Cookie("email", email);
        Cookie pas = new Cookie("cpass", password);
        Cookie re = new Cookie("re", Rmb);
        if (m == null) {
            String erro = "Email and passworld is not correct";
            request.setAttribute("erro", erro);
            em.setMaxAge(0);
            pas.setMaxAge(0);
            re.setMaxAge(0);
            response.addCookie(em);
            response.addCookie(pas);
            response.addCookie(re);
            request.getRequestDispatcher("login.jsp").forward(request, response);

        } else {

            if (Rmb != null) {

                em.setMaxAge(60 * 60 * 24 * 7);
                pas.setMaxAge(60 * 60 * 24 * 7);
                re.setMaxAge(60 * 60 * 24 * 7);
            } else {
                em.setMaxAge(0);
                pas.setMaxAge(0);
                re.setMaxAge(0);
            }
            response.addCookie(em);
            response.addCookie(pas);
            response.addCookie(re);
            switch (m.getRole_id()) {
                case 0: // Mentee
                    Mentee mentee = md.getMenteeById(m.getId());
                    session.setAttribute("mentee", mentee);
                    response.sendRedirect("home");
                    break;
                case 1: // Mentor 
                    MentorDao mod = new MentorDao();
                    Mentor mentor = mod.getMentorByUserID(m.getId());
                    String status = m.getStatus();
                    if ("Block".equals(status)) {
                        String error = "The Account is blocked! Please contact admin via phone number: 0123456789";
                        request.setAttribute("error", error);
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    } else if ("Processing".equals(status)) {
                        if (mentor.getCv() == null) {
                            session.setAttribute("mentor", mentor);
                            request.getRequestDispatcher("updateCvMentor").forward(request, response);
                        } else {
                            String thongbao = "Your CV is reviewing by management. Please waitting!";
                            request.setAttribute("thongbao", thongbao);
                            request.getRequestDispatcher("login.jsp").forward(request, response);
                        }

                    } else {

                        session.setAttribute("mentor", mentor);
                        response.sendRedirect("HomeMentor");
                    }
                    break;
                case 2: // Admin
                    out.print("Admin");
                    break;
                default: // Manager or other roles
                    out.print("Manager");
                    break;
            }

        }
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
