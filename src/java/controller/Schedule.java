/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DayStartEndDao;
import dao.MentorDao;
import dao.ScheduleDao;
import dao.ScheduleMentorDao;
import dao.SkillDao;
import dao.TimeSlotDao;
import dao.WeeksDao;
import entity.DayStartAndEnd;
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
        if (schedule == null) {
            DayStartEndDao dsd = new DayStartEndDao();
            List<DayStartAndEnd> list = dsd.getAllDayFE();
            LocalDate today = LocalDate.now();
            DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String date = today.format(dateFormat);
            DayStartAndEnd de = dsd.getDayinWeekday(date);
            request.setAttribute("date", de);
            String startDateStr = de.getStartDay();
            String endDateStr = de.getEndDay();
            ArrayList<String> dates = new ArrayList<>();
            TimeSlotDao td = new TimeSlotDao();
            List<TimeSlot> timeSlots = td.getTimeSlot();
            List<DayStartAndEnd> listDfeToday = dsd.getGenderDayFEgenterToDay();
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
            request.setAttribute("listDe", listDfeToday);
            request.setAttribute("de", de);
            request.setAttribute("listw", list);
            request.setAttribute("dates", dates);
            request.setAttribute("timeSlots", timeSlots);
            request.getRequestDispatcher("schedule.jsp").forward(request, response);
        } else {
            int week = Integer.parseInt(schedule);
            DayStartEndDao dsd = new DayStartEndDao();
            List<DayStartAndEnd> list = dsd.getAllDayFE();
            DayStartAndEnd de = dsd.getDayById(week);
            request.setAttribute("date", de);
            String startDateStr = de.getStartDay();
            String endDateStr = de.getEndDay();
            ArrayList<String> dates = new ArrayList<>();
            TimeSlotDao td = new TimeSlotDao();
            List<TimeSlot> timeSlots = td.getTimeSlot();
            List<DayStartAndEnd> listDfeToday = dsd.getGenderDayFEgenterToDay();
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
            request.setAttribute("listDe", listDfeToday);
            request.setAttribute("de", de);
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
        String[] week = request.getParameterValues("weeks");
        if (week == null) {
            int fid = Integer.parseInt(request.getParameter("week"));
            ScheduleMentorDao scd = new ScheduleMentorDao();
            WeeksDao wd = new WeeksDao();
            HttpSession session = request.getSession();
            Mentor m = (Mentor) session.getAttribute("mentor");

            if (schedules != null) {
                for (String schedule : schedules) {
                    // Split the value to get slot and date
                    String[] parts = schedule.split(",");
                    int slot = Integer.parseInt(parts[0]);
                    String date = parts[1];

                    WeeksDay weekDay = wd.getWeeksDayByDate(date);
                    if (weekDay == null) {
                        wd.addWeeksDay(date);
                        weekDay = wd.getWeeksDayByDate(date);
                    }

                    if (weekDay != null) {
                        scd.addShedule(weekDay.getId(), slot, m.getId(), fid, "Approve");
                        MentorDao md = new MentorDao();
                        Mentor me = md.getMentorByID(m.getId());
                        session.setAttribute("mentor", me);
                    } else {
                        
                        System.err.println("Failed to retrieve or create WeeksDay for date: " + date);
                    }
                }

            }
            response.sendRedirect("schedule");
        } else {
            ScheduleMentorDao scd = new ScheduleMentorDao();
            WeeksDao wd = new WeeksDao();
            HttpSession session = request.getSession();
            Mentor m = (Mentor) session.getAttribute("mentor");
            DayStartEndDao dsd = new DayStartEndDao();
            List<DayStartAndEnd> list = new ArrayList<>();
            for (int i = 0; i < week.length; i++) {
                int id = Integer.parseInt(week[i]);
                DayStartAndEnd day = dsd.getDayById(id);
                list.add(day);
            }
            for (String schedule : schedules) {
                String[] parts = schedule.split(",");
                int slot = Integer.parseInt(parts[0]);
                String date = parts[1];
                for (DayStartAndEnd de : list) {
                    String dates = getDateSample(de.getStartDay(), de.getEndDay(), date);
                    WeeksDay weekDay = wd.getWeeksDayByDate(dates);
                    if (weekDay == null) {
                        wd.addWeeksDay(dates);
                        weekDay = wd.getWeeksDayByDate(dates);
                    }
                    if (weekDay != null) {
                        scd.addShedule(weekDay.getId(), slot, m.getId(), de.getId(), "Approve");
                        MentorDao md = new MentorDao();
                        Mentor me = md.getMentorByID(m.getId());
                        session.setAttribute("mentor", me);
                    } else {
                        System.err.println("Failed to retrieve or create WeeksDay for date: " + date);
                    }
                }

            }
            response.sendRedirect("schedule");
        }
    }

    public String getDateSample(String start, String end, String dates) {
        String specificDateStr = dates;   // Specific date as a string
        String startDateStr = start;      // Start date of the week as a string
        String endDateStr = end;        // End date of the week as a string

        // Formatter for the date strings
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        // Convert strings to LocalDate
        LocalDate specificDate = LocalDate.parse(specificDateStr, formatter);
        LocalDate startDate = LocalDate.parse(startDateStr, formatter);
        LocalDate endDate = LocalDate.parse(endDateStr, formatter);

        // Get the day of the week of the specific date
        DayOfWeek specificDayOfWeek = specificDate.getDayOfWeek();

        // Variable to store the result
        LocalDate matchingDay = null;

        // Iterate through the days in the week
        for (LocalDate date = startDate; !date.isAfter(endDate); date = date.plusDays(1)) {
            if (date.getDayOfWeek() == specificDayOfWeek) {
                matchingDay = date;
                break;
            }
        }
        DateTimeFormatter fm1 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        return matchingDay.format(fm1);
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
