/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.MentorDao;
import dao.RequestDao;
import dao.SkillDao;
import dao.TimeSlotDao;
import entity.Mentee;
import entity.Mentor;
import entity.Skill;
import entity.TimeSlot;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author TUF F15
 */
@WebServlet(name = "request", urlPatterns = {"/request"})
public class request extends HttpServlet {

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
            out.println("<title>Servlet request</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet request at " + request.getContextPath() + "</h1>");
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
        int id = Integer.parseInt(request.getParameter("mid"));
        MentorDao md = new MentorDao();
        Mentor mentor = md.getMentorByID(id);
        TimeSlotDao tm = new TimeSlotDao();
        List<TimeSlot> list = tm.getAllTimeSlot();
        request.setAttribute("listTime", list);

        request.setAttribute("mentor", mentor);
        request.getRequestDispatcher("request.jsp").forward(request, response);
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
        int mentor_id = Integer.parseInt(request.getParameter("id"));
        String subject = request.getParameter("subject");
        String deadlineTime = request.getParameter("deadlineTime");
        String deadLineDay = request.getParameter("deadlineDate");
        String content = request.getParameter("content");
        int time_slot = Integer.parseInt(request.getParameter("time"));
        int dayNumber = Integer.parseInt(request.getParameter("dayNumber"));
        String skill[] = request.getParameterValues("skill");
        HttpSession session = request.getSession();
        Mentee mentee = (Mentee) session.getAttribute("mentee");
        if (mentee == null) {
            response.sendRedirect("login");
        } else if (skill.length < 1 || skill.length > 3) {
            String erro = "You must be choice least 1 course !";
            request.setAttribute("erro", erro);
            MentorDao md = new MentorDao();
            Mentor mentor = md.getMentorByID(mentor_id);
            TimeSlotDao tm = new TimeSlotDao();
            List<TimeSlot> list = tm.getAllTimeSlot();
            request.setAttribute("listTime", list);
            request.setAttribute("mentor", mentor);
            request.getRequestDispatcher("request.jsp").forward(request, response);
        }else{
            int[] skillArray = new int[skill.length];
            SkillDao sk = new SkillDao();
            List<Skill> list = new ArrayList<>();
            // Chuyển đổi các giá trị từ chuỗi sang số nguyên
            for (int i = 0; i < skillArray.length; i++) {
                try {
                    int id = Integer.parseInt(skill[i]);
                    Skill s = sk.searchSkill(id);
                    list.add(s);
                } catch (NumberFormatException e) {
                    // Xử lý lỗi chuyển đổi (nếu có)
                    e.printStackTrace();
                }
            }
            RequestDao rqDao = new RequestDao();
            
            rqDao.addRequest(mentee, mentor_id, subject, deadLineDay, deadlineTime,content , dayNumber, list, time_slot);
            response.sendRedirect("home");
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
