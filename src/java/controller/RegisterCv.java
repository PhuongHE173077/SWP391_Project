/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CvDao;
import dao.MentorDao;
import dao.SkillDao;
import dao.SkillDetailDao;
import entity.CvMentor;
import entity.Mentee;
import entity.Mentor;

import entity.Skill;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
import java.util.List;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author TUF F15
 */
@WebServlet(name = "RegisterCv", urlPatterns = {"/registerCv"})
@MultipartConfig
public class RegisterCv extends HttpServlet {

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
            out.println("<title>Servlet RegisterCv</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterCv at " + request.getContextPath() + "</h1>");
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
        SkillDao sd = new SkillDao();
        List<Skill> list = sd.getAllSkill();
        request.setAttribute("sk", list);
        request.getRequestDispatcher("Cv_insert.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final long serialVersionUID = 1L;

    private static final String UPLOAD_DIR = "uploads";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullName = request.getParameter("name");
        String dob = request.getParameter("dob");
        String email = request.getParameter("email");
        int gender = Integer.parseInt(request.getParameter("gender"));
        PrintWriter out = response.getWriter();
        String address = request.getParameter("address");
        Part filePart = request.getPart("profilePicture");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String profession = request.getParameter("profession");
        String profession_introduction = request.getParameter("profession_introduction");
        String skills[] = request.getParameterValues("skills");
        String achievement = request.getParameter("achievement");
        HttpSession session = request.getSession();
        Mentor mentor = (Mentor) session.getAttribute("mentor");
        String uploadFilePath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        MentorDao mentorDao = new MentorDao();
        Path filePath = Paths.get(uploadFilePath, fileName);
        boolean redirectToHome = false;
        if (filePart != null && filePart.getSize() > 0) {
            fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String userId = request.getParameter("id");
            String newPicturePath = UPLOAD_DIR + File.separator + fileName;
            CvDao cv = new CvDao();
            // Save the new profile picture file
            try (InputStream fileContent = filePart.getInputStream()) {
                Files.copy(fileContent, filePath, StandardCopyOption.REPLACE_EXISTING);
                CvMentor cvd = new CvMentor(0, fullName, email, dob, gender, mentor.getPhone(), address, newPicturePath, profession, profession_introduction, achievement, "Processing");
                mentor.setCv(cvd);
                cv.addCvMentor(mentor);
                SkillDetailDao sdt = new SkillDetailDao();
                mentorDao.updateImgMentor(mentor.getId(), cvd.getImg());
                List<Skill> list = listSkill(skills);
                for (Skill skill : list) {
                    sdt.addSkillDetail(mentor.getId(), skill);
                }
                request.setAttribute("tbao", "Wating manager approve cv");
                request.getRequestDispatcher("home").forward(request, response);
            } catch (Exception e) {
                throw new ServletException("Database error", e);
            }

        } else {
            request.getRequestDispatcher("Cv_insert.jsp");
        }

    }

    private List<Skill> listSkill(String skills[]) {
        SkillDao sd = new SkillDao();
        int[] skillArray = new int[skills.length];
        List<Skill> list = new ArrayList<>();
        for (int i = 0; i < skillArray.length; i++) {
            try {
                int id = Integer.parseInt(skills[i]);
                Skill s = sd.searchSkill(id);
                list.add(s);
            } catch (NumberFormatException e) {
                // Xử lý lỗi chuyển đổi (nếu có)
                e.printStackTrace();
            }
        }
        return list;
    }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
