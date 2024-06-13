/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.MentorDao;
import dao.ScheduleDao;
import dao.ScheduleMentorDao;
import dao.SkillDao;
import dao.TimeSlotDao;
import dao.WeeksDao;
import entity.Mentor;
import entity.ScheduleMentor;
import entity.TimeSlot;
import entity.WeeksDay;
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
@WebServlet(name = "Schedule", urlPatterns = {"/schedule"})
public class Schedule extends HttpServlet {

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
            out.println("<title>Servlet Schedule</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Schedule at " + request.getContextPath() + "</h1>");
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
        String schedule = request.getParameter("key");

        HttpSession session = request.getSession();
        Mentor m = (Mentor) session.getAttribute("mentor");
        WeeksDao wd = new WeeksDao();
        if (schedule == null) {
            int idw = 1;
            WeeksDay w = wd.getWeeksday(idw);
            ScheduleMentorDao scd = new ScheduleMentorDao();
            List<TimeSlot> listSch = scd.getTimeSlotInDay(idw, m.getId());
            request.setAttribute("listS", listSch);
            TimeSlotDao sd = new TimeSlotDao();
            List<TimeSlot> list = sd.getTimeSlot();
            request.setAttribute("listW", wd.getListWeeksDay());
            request.setAttribute("list", list);
            request.setAttribute("week", w);
            request.getRequestDispatcher("schedule.jsp").forward(request, response);
        } else {
            int idw = Integer.parseInt(schedule);
            WeeksDay w = wd.getWeeksday(idw);
            ScheduleMentorDao scd = new ScheduleMentorDao();
            List<TimeSlot> listSch = scd.getTimeSlotInDay(idw, m.getId());
            request.setAttribute("listS", listSch);
            TimeSlotDao sd = new TimeSlotDao();
            List<TimeSlot> list = sd.getTimeSlot();
            request.setAttribute("listW", wd.getListWeeksDay());
            request.setAttribute("list", list);
            request.setAttribute("week", w);
            request.getRequestDispatcher("schedule.jsp").forward(request, response);
        }

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
        int wid = Integer.parseInt(request.getParameter("week"));
        String key[] = request.getParameterValues("skill");
        HttpSession session = request.getSession();
        Mentor m = (Mentor) session.getAttribute("mentor");
        ScheduleMentorDao smd = new ScheduleMentorDao();
        SkillDao sd = new SkillDao();
        smd.deleteShedule(wid, m.getId());
        if (key != null && key.length > 0) {
            int[] skillArray = new int[key.length];

            for (int i = 0; i < skillArray.length; i++) {
                try {
                    int id = Integer.parseInt(key[i]);
                    smd.addShedule(wid, id, m.getId(), "open");
                } catch (NumberFormatException e) {
                    // Xử lý lỗi chuyển đổi (nếu có)
                    e.printStackTrace();
                }
            }
        }
        WeeksDao wd = new WeeksDao();
        
            int idw = wid;
            WeeksDay w = wd.getWeeksday(idw);
            ScheduleMentorDao scd = new ScheduleMentorDao();
            List<TimeSlot> listSch = scd.getTimeSlotInDay(idw, m.getId());
            request.setAttribute("listS", listSch);
            TimeSlotDao ssd = new TimeSlotDao();
            List<TimeSlot> list = ssd.getTimeSlot();
            request.setAttribute("listW", wd.getListWeeksDay());
            request.setAttribute("list", list);
            request.setAttribute("week", w);
            MentorDao md = new MentorDao();
            Mentor me = md .getMentorByID(m.getId());
            session.setAttribute("mentor", me);
            request.setAttribute("thongbao", "Update sccesfully!!");
            request.getRequestDispatcher("schedule.jsp").forward(request, response);
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
