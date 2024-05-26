/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.MenteeDao;
import dao.profileMenteeDAO;
import entity.Mentee;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/updateProfile")
@MultipartConfig
public class updateProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String UPLOAD_DIR = "uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part filePart = request.getPart("profilePicture");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        int sid = Integer.parseInt(request.getParameter("id"));
        String sname = request.getParameter("name");
        String semail = request.getParameter("email");
        String spass = request.getParameter("pass");
        String sdob = request.getParameter("dob");
        String sphone = request.getParameter("phone");
        String spicture = request.getParameter("picture");
        int sgender = Integer.parseInt(request.getParameter("gender"));
        Double sbalance = Double.parseDouble(request.getParameter("balance"));
        String saddress = request.getParameter("address");

        String uploadFilePath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        Path filePath = Paths.get(uploadFilePath, fileName);
        MenteeDao m = new MenteeDao();
        boolean redirectToHome = false;
        if (filePart != null && filePart.getSize() > 0) {
            fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String userId = request.getParameter("id");
            String newPicturePath = UPLOAD_DIR + File.separator + fileName;

            // Save the new profile picture file
            try (InputStream fileContent = filePart.getInputStream()) {
                Files.copy(fileContent, filePath, StandardCopyOption.REPLACE_EXISTING);
                m.updateUserProfilePicture(userId, newPicturePath);
            } catch (SQLException e) {
                throw new ServletException("Database error", e);
            }

            Mentee me = new Mentee(sid, sname, semail, spass, sdob, sphone, newPicturePath, sgender, sbalance, saddress);
            m.updateMentee(me);

            HttpSession session = request.getSession();
            session.setAttribute(sphone, m);
            session.setAttribute("mentee", me);
        } else {
            Mentee me = new Mentee(sid, sname, semail, spass, sdob, sphone, spicture, sgender, sbalance, saddress);
            m.updateMentee(me);

            HttpSession session = request.getSession();
            session.setAttribute(sphone, m);
            session.setAttribute("mentee", me);
        }

        response.sendRedirect("home"); // Ensure this page uses the updated session attributes
    }

}
