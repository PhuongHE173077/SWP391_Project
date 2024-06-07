/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.CategorySkillDao;
import dao.CourseDao;
import dao.MentorDao;
import dao.RequestDao;
import dao.SkillDao;
import entity.CategorySkill;
import entity.Course;
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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author TUF F15
 */
@WebServlet(name="ViewMentor", urlPatterns={"/ViewCourse"})
public class ViewCourse extends HttpServlet {
   
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
            out.println("<title>Servlet ViewMentor</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewMentor at " + request.getContextPath () + "</h1>");
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
        SkillDao sd = new SkillDao();
        CourseDao cd = new CourseDao();
        List<Course> listC = cd.getCourseBySkillId(id);
        CategorySkillDao csd = new CategorySkillDao();
        List<CategorySkill> listCs = csd.getAllCategorySkill();
        List<Skill> listS = new ArrayList<>();
        Skill skill = sd.searchSkill(id);
        
        
        RequestDao rd = new RequestDao();
        HttpSession session = request.getSession();
        Mentee mentee = (Mentee) session.getAttribute("mentee");
        if (mentee != null) {
            List<Request> reList = rd.getAllRequestOfMentee(mentee.getId());
            int count = rd.getCountRequest(mentee.getId());
            request.setAttribute("cnt", count);
            request.setAttribute("reList", reList);
            

        }
        request.setAttribute("listS", listS);
        request.setAttribute("skill", skill);
        request.setAttribute("id", id);
        request.setAttribute("listCs", listCs);
        request.setAttribute("listC", listC);
        request.getRequestDispatcher("ViewCourse.jsp").forward(request, response);
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
        processRequest(request, response);
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