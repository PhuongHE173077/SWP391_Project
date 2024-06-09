/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CvDao;
import dao.MentorDao;
import dao.SkillDao;
import dao.UserDao;
import entity.Mentee;
import entity.Mentor;
import entity.Skill;
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

/**
 *
 * @author TUF F15
 */
@WebServlet(name = "VerifyEmail", urlPatterns = {"/VerifyEmail"})
public class VerifyEmail extends HttpServlet {

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
            out.println("<title>Servlet VerifyEmail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VerifyEmail at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        PrintWriter out = response.getWriter();
        String code_ip = request.getParameter("first") + request.getParameter("second") 
                + request.getParameter("third") + request.getParameter("fourth") + 
                request.getParameter("fifth") + request.getParameter("sixth");
        HttpSession session = request.getSession();
        String code =(String) session.getAttribute("code");
        MentorDao md = new MentorDao();
        
        if(code_ip.equals(code)){
            UserDao ud = new UserDao();
            User user1 = (User)session.getAttribute("user");
            ud.addUser(user1);
            User user =  ud.getUserByEmail(user1.getEmail());
            if(user.getRole_id() == 0){
                Mentee mentee = new Mentee(user.getId(), user.getName(), user.getEmail(), user.getPass(), user.getDob(), user.getPhone(), user.getPicture(), user.getGender(), 0, user.getAddress());
                session.setAttribute("mentee", mentee);
                response.sendRedirect("home");
            }else{
                md.adaMentor(user, 0);
                Mentor m = md.getMentorByUserID(user.getId());
                request.setAttribute("mentor", m);
                SkillDao sd = new SkillDao();
                List<Skill>list = sd.getAllSkill();
                request.setAttribute("sk", list);
                request.getRequestDispatcher("Cv_insert.jsp").forward(request, response);
            }
            
        }else{
            String erro = "The code is not correct!!";
            
            request.getRequestDispatcher("Verify_Email.jsp").forward(request, response);
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
