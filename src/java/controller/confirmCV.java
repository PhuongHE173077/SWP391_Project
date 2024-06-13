//package controller;
//
//import dao.CvDao;
//import dao.MentorDao;
//import dao.UserDao;
//import entity.User;
//import service.SendEmail;
//import java.io.IOException;
//import java.io.PrintWriter;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.util.List;
//
///**
// *
// * @author Acer
// */
//public class confirmCV extends HttpServlet {
//
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet confirmCV</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet confirmCV at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        //processRequest(request, response);
//        CvDao cvd = new CvDao();
//        MentorDao mtd = new MentorDao();
//        UserDao userDao = new UserDao();
//        SendEmail sendEmailService = new SendEmail();
//
//        String id = request.getParameter("mid");
//        int mid = Integer.parseInt(id);
//        String status = request.getParameter("status");
//        String emailSubject;
//        String emailMessage;
//
//        if (status.equals("approve")) {
//            mtd.updateStatusMentor(mid, "active");
//            cvd.updateStatusCV(mid, status);
//            emailSubject = "CV Approved";
//            emailMessage = "Your CV has been approved.";
//        } else {
//            mtd.updateStatusMentor(mid, "block");
//            cvd.updateStatusCV(mid, status);
//            emailSubject = "CV Rejected";
//            emailMessage = "Your CV has been rejected.";
//        }
//
//        List<User> users = userDao.getUser();
//        for (User user : users) {
//            String toMail = user.getEmail();
//            sendEmailService.sendEmail(toMail, emailSubject, emailMessage);
//        }
//
//        response.sendRedirect("loadcontroll");
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//}
package controller;

import dao.CvDao;
import dao.MentorDao;
import dao.UserDao;
import entity.User;
import service.SendEmail;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet để xác nhận phê duyệt hoặc từ chối CV.
 */
public class confirmCV extends HttpServlet {

    private static final ExecutorService executorService = Executors.newFixedThreadPool(10);

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* Xuất trang của bạn ở đây. Bạn có thể sử dụng mã mẫu sau. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet confirmCV</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet confirmCV tại " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CvDao cvd = new CvDao();
        MentorDao mtd = new MentorDao();
        UserDao userDao = new UserDao();

        String id = request.getParameter("mid");
        int mid = Integer.parseInt(id);
        String status = request.getParameter("status");
        String emailSubject;
        String emailMessage;

        if (status.equals("approve")) {
            mtd.updateStatusMentor(mid, "active");
            cvd.updateStatusCV(mid, status);
            emailSubject = "CV Approved";
            emailMessage = "Your CV has been approved.";
        } else {
            mtd.updateStatusMentor(mid, "block");
            cvd.updateStatusCV(mid, status);
            emailSubject = "CV Rejected";
            emailMessage = "Your CV has been rejected.";
        }

        List<User> users = userDao.getUser();
        for (User user : users) {
            String toMail = user.getEmail();
            executorService.submit(() -> {
                SendEmail sendEmailService = new SendEmail();
                sendEmailService.sendEmail(toMail, emailSubject, emailMessage);
            });
        }

        response.sendRedirect("loadcontroll");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
