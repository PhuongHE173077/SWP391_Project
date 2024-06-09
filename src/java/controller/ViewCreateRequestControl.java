/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.MentorDao;
import dao.RequestDao;
import dao.WeeksDao;
import entity.Mentee;
import entity.Mentor;
import entity.Request;
import entity.Skill;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Dell
 */
@WebServlet(name="ViewCreateRequestControl", urlPatterns={"/view"})
public class ViewCreateRequestControl extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet ViewCreateRequestControl</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewCreateRequestControl at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        RequestDao rqDao = new RequestDao();
        Request rq = rqDao.getRequestById(id);
        Skill skill = rq.getSkill();
        
        MentorDao menntorDao = new MentorDao();
        Mentor m = menntorDao.getMentorByID(rq.getMentor().getId());
        WeeksDao wd = new WeeksDao();
        request.setAttribute("skill", skill);
        request.setAttribute("listWeek", wd.getListWeeksDay());
        request.setAttribute("mentor", m);
        request.setAttribute("request", rq);
        request.getRequestDispatcher("viewCRRequest.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String rsubject = request.getParameter("subject");
        String rdealine = request.getParameter("deadlineDate");
        String rcontent = request.getParameter("content");
        int rdaynumber = Integer.parseInt(request.getParameter("dayNumber"));
        RequestDao rqd = new RequestDao();
        Request r = rqd.getRequestById(id);
        

        if ("Processing".equals(r.getStatus())) {
            r.setDeadlineday(rdealine);
            r.setSubject(rsubject);
            r.setContent(rcontent);
            r.setDay_number(rdaynumber);
            
        }
        response.sendRedirect("ViewRequest");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
