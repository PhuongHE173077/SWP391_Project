/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ScheduleDao;
import dao.ScheduleDetailDao;
import dao.ScheduleRequestDao;
import dao.TimeSlotDao;
import dao.WeeksDao;
import entity.Mentee;
import entity.Mentor;
import entity.Schedule;
import entity.ScheduleRequest;
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
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 *
 * @author TUF F15
 */
@WebServlet(name = "TimeTableOfMentor", urlPatterns = {"/TimeTableOfMentor"})
public class TimeTableOfMentor extends HttpServlet {

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
            out.println("<title>Servlet TimeTableOfMentor</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TimeTableOfMentor at " + request.getContextPath() + "</h1>");
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
        String schedules = request.getParameter("key");
        HttpSession session = request.getSession();
        Mentor m = (Mentor) session.getAttribute("mentor");
        LocalDate today = LocalDate.now();
        DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String date = today.format(dateFormat);
        if (schedules == null) {

            WeeksDao wd = new WeeksDao();
            WeeksDay week = wd.getWeekNow(date);
            List<WeeksDay> list = wd.getListWeeksDay();
            String startDateStr = week.getStartDay();
            ArrayList<String> dates = new ArrayList<>();
            TimeSlotDao td = new TimeSlotDao();
            List<TimeSlot> timeSlots = td.getTimeSlot();

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat displayFormat = new SimpleDateFormat("yyyy-MM-dd");

            try {
                Date startDate = sdf.parse(startDateStr);
                Calendar cal = Calendar.getInstance();
                cal.setTime(startDate);

                for (int i = 0; i < 7; i++) {
                    dates.add(displayFormat.format(cal.getTime()));
                    cal.add(Calendar.DAY_OF_MONTH, 1);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            ScheduleDetailDao scd = new ScheduleDetailDao();
            ScheduleDao sd = new ScheduleDao();
            List<Schedule> listS = sd.getSchedulesProcessing(m.getId());
            ScheduleRequestDao srd = new ScheduleRequestDao();
            List<ScheduleRequest> listsche = srd.getScheduleRequestsOfMentor(week.getId(), m.getId());
            request.setAttribute("today", today);
            request.setAttribute("listS", listS);
            request.setAttribute("listsch", listsche);
            request.setAttribute("de", week);
            request.setAttribute("listw", list);
            request.setAttribute("dates", dates);
            request.setAttribute("timeSlots", timeSlots);
            request.getRequestDispatcher("TimeTableOfMentor.jsp").forward(request, response);
        } else {
            int weekId = Integer.parseInt(schedules);
            WeeksDao wd = new WeeksDao();
            WeeksDay week = wd.getWeeksday(weekId);
            List<WeeksDay> list = wd.getListWeeksDay();
            String startDateStr = week.getStartDay();
            ArrayList<String> dates = new ArrayList<>();
            TimeSlotDao td = new TimeSlotDao();
            List<TimeSlot> timeSlots = td.getTimeSlot();

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat displayFormat = new SimpleDateFormat("yyyy-MM-dd");

            try {
                Date startDate = sdf.parse(startDateStr);
                Calendar cal = Calendar.getInstance();
                cal.setTime(startDate);

                for (int i = 0; i < 7; i++) {
                    dates.add(displayFormat.format(cal.getTime()));
                    cal.add(Calendar.DAY_OF_MONTH, 1);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            ScheduleDetailDao scd = new ScheduleDetailDao();
            ScheduleDao sd = new ScheduleDao();
            List<Schedule> listS = sd.getSchedulesProcessing(m.getId());
            ScheduleRequestDao srd = new ScheduleRequestDao();
            List<ScheduleRequest> listsche = srd.getScheduleRequestsOfMentor(week.getId(), m.getId());
            request.setAttribute("today", today);
            request.setAttribute("listS", listS);
            request.setAttribute("listsch", listsche);
            request.setAttribute("de", week);
            request.setAttribute("listw", list);
            request.setAttribute("dates", dates);
            request.setAttribute("timeSlots", timeSlots);
            request.getRequestDispatcher("TimeTableOfMentor.jsp").forward(request, response);

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
        processRequest(request, response);
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
