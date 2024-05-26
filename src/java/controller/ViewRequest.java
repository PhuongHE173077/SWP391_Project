/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.CategorySkillDao;
import dao.RequestDao;
import dao.SkillDao;
import entity.CategorySkill;
import entity.Mentee;
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
import java.util.List;

/**
 *
 * @author TUF F15
 */
@WebServlet(name="ViewRequest", urlPatterns={"/ViewRequest"})
public class ViewRequest extends HttpServlet {
   
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
            out.println("<title>Servlet ViewRequest</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewRequest at " + request.getContextPath () + "</h1>");
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
       
        CategorySkillDao csd = new CategorySkillDao();
        List<CategorySkill> listCs = csd.getAllCategorySkill();
        RequestDao rd = new RequestDao();
        HttpSession session = request.getSession();
        Mentee mentee = (Mentee) session.getAttribute("mentee");
        if (mentee != null) {
            List<Request> reList = rd.getAllRequestOfMentee(mentee.getId());
            int count = rd.getCountRequest(mentee.getId());
            int total = getTotalHoure(reList);
            request.setAttribute("total", total);
            request.setAttribute("cnt", count);
            request.setAttribute("reList", reList);

        }
        
        request.setAttribute("listCs", listCs);
       
        request.getRequestDispatcher("viewRequest.jsp").forward(request, response);
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
    public int getTotalHoure(List<Request>list){
        int total = 0;
        for (Request request : list) {
            total += request.getDay_number()*2;
        }
        return total;
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
