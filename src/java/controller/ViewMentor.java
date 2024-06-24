/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.CategorySkillDao;
import dao.MentorDao;
import dao.SkillDao;
import entity.CategorySkill;
import entity.Mentor;
import entity.Skill;
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
@WebServlet(name="ViewMentor", urlPatterns={"/ViewMentor"})
public class ViewMentor extends HttpServlet {
   
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
        try{
        String srm =request.getParameter("name");
        String skillIdParam = request.getParameter("id");
        int skillId = Integer.parseInt(skillIdParam);
        SkillDao sd = new SkillDao();
        Skill skill = sd.searchSkill(skillId);

        MentorDao md = new MentorDao();
        List<Mentor> listM = md.searchMentorSkill(2, srm);

        CategorySkillDao csd = new CategorySkillDao();
        List<CategorySkill> listCs = csd.getAllCategorySkill();

        // Đặt các thuộc tính vào request để chuyển đến JSP
        request.setAttribute("listM", listM);
        request.setAttribute("skill", skill);
        request.setAttribute("listCs", listCs);

        // Chuyển hướng đến trang JSP để hiển thị kết quả
        request.getRequestDispatcher("ViewMentor.jsp").forward(request, response);
    }
    catch (Exception e

    
        ) {
    // Xử lý ngoại lệ
    e.printStackTrace();
        // Hoặc có thể đưa ra thông báo lỗi hoặc chuyển hướng đến trang lỗi
        response.sendRedirect("error.jsp");
    }
  
  
    }
}
