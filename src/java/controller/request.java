/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.MentorDao;
import dao.PaymentDao;
import dao.RequestDao;
import dao.ScheduleDao;
import dao.SkillDao;
import dao.UserDao;
import dao.WeeksDao;

import entity.Mentee;
import entity.Mentor;
import entity.Payment;
import entity.Request;
import entity.Schedule;
import entity.Skill;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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

        int id = Integer.parseInt(request.getParameter("id"));
        int sid = Integer.parseInt(request.getParameter("sid"));
        MentorDao menntorDao = new MentorDao();
        SkillDao sd = new SkillDao();
        Mentor m = menntorDao.getMentorByID(id);
        Skill skill = sd.searchSkill(sid);
        WeeksDao wd = new WeeksDao();
        request.setAttribute("listWeek", wd.getListWeeksDay());
        request.setAttribute("mentor", m);
        request.setAttribute("skill", skill);
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
        String deadLineDay = request.getParameter("deadlineDate");
        String content = request.getParameter("content");
        int Day = Integer.parseInt(request.getParameter("dayNumber"));
        String timeSchedule[] = request.getParameterValues("key");
        HttpSession session = request.getSession();
        Mentee mentee = (Mentee) session.getAttribute("mentee");
        if (mentee == null) {
            response.sendRedirect("login");
        } else {
            ScheduleDao sd = new ScheduleDao();
            int[] skillArray = new int[timeSchedule.length];
            List<Schedule> list = new ArrayList<>();
            for (int i = 0; i < skillArray.length; i++) {
                try {
                    int id = Integer.parseInt(timeSchedule[i]);
                    Schedule s = sd.getlistScheduleMetorById(id);
                    list.add(s);
                } catch (NumberFormatException e) {
                    // Xử lý lỗi chuyển đổi (nếu có)
                    e.printStackTrace();
                }
            }
            SkillDao ssd = new SkillDao();
            MentorDao md = new MentorDao();
            RequestDao rd = new RequestDao();
            UserDao ud = new UserDao();
            PaymentDao pd = new PaymentDao();
            LocalDate today = LocalDate.now();
            DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String date = today.format(dateFormat);
            Request rq = new Request(0, md.getMentorByID(mid), mentee, subject, deadLineDay, Day, content, ssd.searchSkill(sid), "Processing", list,date);
            if (mentee.getBalance() < rq.getTotal()) {
                MentorDao menntorDao = new MentorDao();
                Mentor m = menntorDao.getMentorByID(mid);
                Skill skill = ssd.searchSkill(sid);
                WeeksDao wd = new WeeksDao();
                request.setAttribute("listWeek", wd.getListWeeksDay());
                request.setAttribute("mentor", m);
                request.setAttribute("skill", skill);
                String error = "So du khong du";
                request.setAttribute("error", error);
                request.getRequestDispatcher("request.jsp").forward(request, response);
            } else {
                rd.addRequest(rq);
                ud.removeMoney(mentee, rq.getTotal());

                LocalDateTime currentDateTime = LocalDateTime.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
                String formattedDateTime = currentDateTime.format(formatter);

                Payment payment = new Payment(sid, rd.getTop1Rq(), rq.getTotal(), formattedDateTime, content);
                pd.addPayment(payment);
//                String announce = "Tru tien thanh cong";
                request.getRequestDispatcher("payment").forward(request, response);
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
