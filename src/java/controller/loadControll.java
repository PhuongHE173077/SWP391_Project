/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CvDao;
import dao.MentorDao;
import dao.UserDao;
import entity.CvMentor;
import entity.Mentor;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Acer
 */
public class loadControll extends HttpServlet {

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
            out.println("<title>Servlet loadControll</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loadControll at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        CvDao cvd = new CvDao();
        //List<User> list = dao.getUser();
        UserDao ud = new UserDao();
        List<CvMentor> list1 = cvd.getCvUSer();
        
        int page, numberpage = 10;
        int size = list1.size();
        int num = (size%10==0?(size/10) : ((size/10))+1);
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page-1) * numberpage;
        end = Math.min(page*numberpage, size);
        List<CvMentor> list = cvd.getListByPageCv(list1, start, end);
        
        request.setAttribute("page", page);
        request.setAttribute("num", num);
        request.setAttribute("listS", list);
        request.getRequestDispatcher("Manager.jsp").forward(request, response);
        
        
        
//List<CvMentor> list = cvd.getUser();
// MentorDao dao = new MentorDao();
//        List<Mentor> list = dao.getAllMentorCVpre();
//        request.setAttribute("listS", list);
//        request.getRequestDispatcher("Manager.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}