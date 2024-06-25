/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.MentorDao;
import dao.PaymentDao;
import dao.RequestDao;
import dao.ScheduleDao;
import dao.ScheduleDetailDao;
import dao.ScheduleRequestDao;
import dao.SkillDao;
import dao.TimeSlotDao;
import dao.UserDao;
import dao.WeeksDao;

import entity.Mentee;
import entity.Mentor;
import entity.Payment;
import entity.Request;
import entity.Schedule;
import entity.ScheduleDetail;
import entity.Skill;
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
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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

        int mid = Integer.parseInt(request.getParameter("id"));
        int sid = Integer.parseInt(request.getParameter("sid"));
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
        MentorDao menntorDao = new MentorDao();
        SkillDao sd = new SkillDao();
        Mentor m = menntorDao.getMentorByID(mid);
        Skill skill = sd.searchSkill(sid);
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
        List<ScheduleDetail> listsche = scd.getScheduleDtByMid(mid, week.getId());
        request.setAttribute("listsch", listsche);
        request.setAttribute("de", week);
        request.setAttribute("listw", list);
        request.setAttribute("dates", dates);
        request.setAttribute("mentor", m);
        request.setAttribute("skill", skill);
        request.setAttribute("timeSlots", timeSlots);
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

        int mid = Integer.parseInt(request.getParameter("id"));
        int sid = Integer.parseInt(request.getParameter("sid"));
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");
        String startDay = request.getParameter("fromDay");
        String endDay = request.getParameter("endDay");
        String timeSchedule[] = request.getParameterValues("schedule");
        ScheduleDetailDao sdd = new ScheduleDetailDao();
        List<ScheduleDetail> lists = new ArrayList<>();
        for (int i = 0; i < timeSchedule.length; i++) {
            int sdid = Integer.parseInt(timeSchedule[i]);
            ScheduleDetail sd = sdd.getScheduleDtById(sdid);
            lists.add(sd);

        }
        MentorDao md = new MentorDao();
        HttpSession session = request.getSession();
        SkillDao skd = new SkillDao();
        Mentee mentee = (Mentee) session.getAttribute("mentee");
        if (mentee == null) {
            response.sendRedirect("login");
        } else {
            ScheduleDao sd = new ScheduleDao();
            RequestDao rqd = new RequestDao();
            ScheduleRequestDao srd = new ScheduleRequestDao();
            int slotNumber = getSlotRequest(startDay, endDay, mid, lists);

            double total_menoy = slotNumber * md.getMentorByID(mid).getPrice();
            if (mentee.getBalance() < total_menoy) {
                request.setAttribute("tbao", "so du ban ko du");
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
                MentorDao menntorDao = new MentorDao();
                SkillDao ssddd = new SkillDao();
                Mentor m = menntorDao.getMentorByID(mid);
                Skill skill = ssddd.searchSkill(sid);
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
                List<ScheduleDetail> listsche = scd.getScheduleDtByMid(mid, week.getId());
                request.setAttribute("listsch", listsche);
                request.setAttribute("de", week);
                request.setAttribute("listw", list);
                request.setAttribute("dates", dates);
                request.setAttribute("mentor", m);
                request.setAttribute("skill", skill);
                request.setAttribute("timeSlots", timeSlots);
                request.getRequestDispatcher("request.jsp").forward(request, response);
            } else {
                LocalDate today = LocalDate.now();
                DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                String date = today.format(dateFormat);
                Request rq = new Request(0, subject, mentee, md.getMentorByID(mid), content, startDay, endDay, slotNumber, skd.searchSkill(sid), date, "Processing", null);
                rqd.createRequest(rq);
                List<ScheduleDetail> list = sdd.getScheduleDtInTime(mid, startDay, endDay);
                int rid = rqd.getTop1Rq();
                for (ScheduleDetail scheduleDetail : list) {
                    for (ScheduleDetail sch : lists) {
                        if (areSameDayOfWeek(scheduleDetail.getDay(), sch.getDay())) {
                            srd.createScheduleRequest(rid, scheduleDetail.getId());
                        }
                    }
                }
                UserDao ud = new UserDao();
                PaymentDao pd = new PaymentDao();
                ud.removeMoney(mentee, total_menoy);
                Payment payment = new Payment(0, rid, mentee.getId(), total_menoy, "Thanh toan request",java.sql.Date.valueOf(LocalDate.now()), date, content, null, null, null, null, null, null, null, 0);
                pd.createPayment(payment);
                request.getRequestDispatcher("payment").forward(request, response);
            }

        }

    }

    public int getSlotRequest(String startDay, String endDay, int mid, List<ScheduleDetail> lists) {
        ScheduleDetailDao sdd = new ScheduleDetailDao();
        List<ScheduleDetail> list = sdd.getScheduleDtInTime(mid, startDay, endDay);
        int count = 0;
        for (ScheduleDetail scheduleDetail : list) {
            for (ScheduleDetail sch : lists) {
                if (areSameDayOfWeek(scheduleDetail.getDay(), sch.getDay())) {
                    count++;
                }
            }

        }
        return count;
    }

    public static boolean areSameDayOfWeek(String dateStr1, String dateStr2) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        try {
            // Chuyển đổi chuỗi sang LocalDate
            LocalDate date1 = LocalDate.parse(dateStr1, formatter);
            LocalDate date2 = LocalDate.parse(dateStr2, formatter);

            // Lấy thứ của mỗi ngày
            DayOfWeek dayOfWeek1 = date1.getDayOfWeek();
            DayOfWeek dayOfWeek2 = date2.getDayOfWeek();

            // Kiểm tra xem hai ngày có cùng thứ hay không
            return dayOfWeek1 == dayOfWeek2;
        } catch (DateTimeParseException e) {
            // Xử lý ngoại lệ khi chuỗi không đúng định dạng
            System.out.println("Định dạng ngày không hợp lệ. Vui lòng sử dụng định dạng yyyy-MM-dd.");
            return false;
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
