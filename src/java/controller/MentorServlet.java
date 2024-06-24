package controller;

import dao.MentorDao;
import entity.Mentor;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/searchMentorSkill")
    public class MentorServlet extends HttpServlet {

    private MentorDao mentorDao = new MentorDao(); // Assuming MentorDao is properly configured and accessible

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            // Get parameters from request
            int skillId = Integer.parseInt(request.getParameter("skillId"));
            String name = request.getParameter("name");

            // Call DAO to get list of mentors based on skillId and name
            List<Mentor> mentors = mentorDao.searchMentorSkill(skillId, name);

            // Generate HTML response
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Mentor List</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Mentor List</h1>");
            out.println("<table border=\"1\">");
            out.println("<tr><th>Mentor ID</th><th>Username</th><th>Email</th><th>Phone</th><th>Address</th></tr>");

            for (Mentor mentor : mentors) {
                out.println("<tr>");
                out.println("<td>" + mentor.getId()+ "</td>");
                out.println("<td>" + mentor.getName()+ "</td>");
                out.println("<td>" + mentor.getEmail() + "</td>");
                out.println("<td>" + mentor.getPhone() + "</td>");
                out.println("<td>" + mentor.getAddress() + "</td>");
                out.println("</tr>");
            }

            out.println("</table>");
            out.println("</body>");
            out.println("</html>");
        } catch (Exception e) {
            Logger.getLogger(MentorServlet.class.getName()).log(Level.SEVERE, null, e);
            out.println("Error: " + e.getMessage());
        } finally {
            out.close();
        }
    }
}
