/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.SkillDao;
import entity.Skill;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 *
 * @author Dell
 */
@MultipartConfig
@WebServlet(name="ViewSkill", urlPatterns={"/ViewSkill"})
public class ViewSkill extends HttpServlet {

   
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
        int id = Integer.parseInt(request.getParameter("id"));
        SkillDao sd = new SkillDao();
        Skill s = sd.searchSkill(id);
        request.setAttribute("detail", s);
        request.getRequestDispatcher("viewskillmanage.jsp").forward(request, response);
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
        processRequest(request, response);
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
         
        
        
//        Part filePart = request.getPart("skillImage");
//        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
//        String name = request.getParameter("skillName");
//        String description = request.getParameter("skillDescription");
//        int category = Integer.parseInt(request.getParameter("skillCategory"));
//
//        
//        String uploadFilePath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
//        File uploadDir = new File(uploadFilePath);
//        if (!uploadDir.exists()) {
//            uploadDir.mkdirs();
//        }
//
//        Path filePath = Paths.get(uploadFilePath, fileName);
//        boolean redirectToHome = false;
//        if (filePart != null && filePart.getSize() > 0) {
//            fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
//
//            String newPicturePath = UPLOAD_DIR + File.separator + fileName;
//            // Save the new profile picture file
//            try (InputStream fileContent = filePart.getInputStream()) {
//               
//                Files.copy(fileContent, filePath, StandardCopyOption.REPLACE_EXISTING);  
//                SkillDao sd = new SkillDao();
//                sd.insertNewSkill(newPicturePath, name, description, category);
//                response.sendRedirect("viewListSkill");
//            } catch (Exception e) {
//                throw new ServletException("Database error", e);
//            }
//        }
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
