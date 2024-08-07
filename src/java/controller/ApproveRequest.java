/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.RequestDao;
import dao.ScheduleDetailDao;
import dao.ScheduleRequestDao;
import entity.Request;
import entity.ScheduleRequest;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author TUF F15
 */
@WebServlet(name = "ApproveRequest", urlPatterns = {"/approveRequest"})
public class ApproveRequest extends HttpServlet {

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
            out.println("<title>Servlet ApproveRequest</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ApproveRequest at " + request.getContextPath() + "</h1>");
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
        int tid = Integer.parseInt(request.getParameter("tid"));
        int rid = Integer.parseInt(request.getParameter("rid"));
        if (tid == 1) {

        } else if (tid == 2) {
            RequestDao rqd = new RequestDao();
            ScheduleRequestDao srq = new ScheduleRequestDao();
            List<ScheduleRequest>list = srq.getScheduleRequestsByRid(rid);
            ScheduleDetailDao sdd = new ScheduleDetailDao();
            rqd.updateStatus("Approve", rid);
            for (ScheduleRequest scheduleRequest : list) {
                sdd.updateStatus("Booking", scheduleRequest.getScd().getId());
            }
        } else {
            RequestDao rqd = new RequestDao();
            rqd.updateStatus("Reject", rid);
        }
        response.sendRedirect("requestFromMentee");
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
