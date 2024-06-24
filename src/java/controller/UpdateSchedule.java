/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.MentorDao;
import dao.ScheduleDao;
import dao.ScheduleDetailDao;
import dao.SkillDao;
import dao.TimeSlotDao;
import dao.WeeksDao;
import entity.Mentor;
import entity.Schedule;
import entity.ScheduleDetail;
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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
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
@WebServlet(name = "Schedule", urlPatterns = {"/schedule"})
public class UpdateSchedule extends HttpServlet {

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
        String schedules = request.getParameter("key");
        HttpSession session = request.getSession();
        Mentor m = (Mentor) session.getAttribute("mentor");
        if (schedules == null) {
            LocalDate today = LocalDate.now();
            DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String date = today.format(dateFormat);
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
            List<ScheduleDetail> listsche = scd.getScheduleDtByMid(m.getId(), week.getId());
            request.setAttribute("listsch", listsche);
            request.setAttribute("de", week);
            request.setAttribute("listw", list);
            request.setAttribute("dates", dates);
            request.setAttribute("timeSlots", timeSlots);
            request.getRequestDispatcher("schedule.jsp").forward(request, response);
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
            List<ScheduleDetail> listsche = scd.getScheduleDtByMid(m.getId(), week.getId());
            request.setAttribute("listsch", listsche);
            request.setAttribute("de", week);
            request.setAttribute("listw", list);
            request.setAttribute("dates", dates);
            request.setAttribute("timeSlots", timeSlots);
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
        String[] schedules = request.getParameterValues("schedule");
        String startDay = request.getParameter("start-date");
        String endDay = request.getParameter("end-date");
        ScheduleDao sd = new ScheduleDao();
        ScheduleDetailDao sdd = new ScheduleDetailDao();
        if (startDay == "" || endDay == "") {
            int wid = Integer.parseInt(request.getParameter("week"));

            WeeksDao wd = new WeeksDao();
            HttpSession session = request.getSession();
            Mentor m = (Mentor) session.getAttribute("mentor");
            sd.createSchedule(m.getId(), wd.getWeeksday(wid).getStartDay(), wd.getWeeksday(wid).getEndDay(), "Processing");
            int sid = sd.getscheduleNewID();
            if (schedules != null) {
                for (String schedule : schedules) {
                    // Split the value to get slot and date
                    String[] parts = schedule.split(",");
                    int slot = Integer.parseInt(parts[0]);
                    String date = parts[1];
                    sdd.createScheduleDetail(date, sid, wid, slot);
                }
            }
            response.sendRedirect("schedule");
        } else {
            WeeksDao wd = new WeeksDao();
            HttpSession session = request.getSession();
            Mentor m = (Mentor) session.getAttribute("mentor");
            sd.createSchedule(m.getId(), startDay, endDay, "Processing");
            int sid = sd.getscheduleNewID();
            if (schedules != null) {
                for (String schedule : schedules) {
                    // Split the value to get slot and date
                    String[] parts = schedule.split(",");
                    int slot = Integer.parseInt(parts[0]);
                    String date = parts[1];
                    List<String> result = getDatesWithSameDayOfWeek(startDay, endDay, date);
                    for (String string : result) {
                        sdd.createScheduleDetail(string, sid, wd.getWeekNow(date).getId(), slot);
                    }   
                    
                }
            }
            response.sendRedirect("schedule");

        }
    }
    

   public List<String> getDatesWithSameDayOfWeek(String start, String end, String dates) {
        String specificDateStr = dates;   
        String startDateStr = start;      
        String endDateStr = end;         

        // Formatter for the date strings
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        // Convert strings to LocalDate
        LocalDate specificDate = LocalDate.parse(specificDateStr, formatter);
        LocalDate startDate = LocalDate.parse(startDateStr, formatter);
        LocalDate endDate = LocalDate.parse(endDateStr, formatter);

        // Get the day of the week of the specific date
        DayOfWeek specificDayOfWeek = specificDate.getDayOfWeek();

        // List to store the result
        List<String> matchingDays = new ArrayList<>();

        // Iterate through the days in the week
        for (LocalDate date = startDate; !date.isAfter(endDate); date = date.plusDays(1)) {
            if (date.getDayOfWeek() == specificDayOfWeek) {
                matchingDays.add(date.format(formatter));
            }
        }

        return matchingDays;
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
