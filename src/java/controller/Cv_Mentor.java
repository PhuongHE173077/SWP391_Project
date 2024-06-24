import dao.CvDao;
import dao.SkillDao;
import entity.CvMentor;
import entity.Skill;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/UpdateCvofMentor")
@MultipartConfig
public class Cv_Mentor extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "uploads";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        SkillDao skd = new SkillDao();
        List<Skill> ls = skd.getAllSkill();
        request.setAttribute("sk", ls);
        request.getRequestDispatcher("UpdateCvofMentor.jsp").forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // Gather form data
        Part filePart = request.getPart("profilePicture");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        int mentorId = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String dob = request.getParameter("dob");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String education = request.getParameter("education");
        String workExperience = request.getParameter("workExperience");
        String achievements = request.getParameter("achievements");
        String[] skillsArray = request.getParameterValues("skills");

        // Collect skills into a list
        List<Skill> skillList = new ArrayList<>();
        if (skillsArray != null) {
            for (String skillId : skillsArray) {
                skillList.add(new Skill(Integer.parseInt(skillId)));
            }
        }

        String picturePath = request.getParameter("picture"); // Default to existing picture

        // Directory for file uploads
        String uploadFilePath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // Full path to save the uploaded file
        Path filePath = Paths.get(uploadFilePath, fileName);

        CvDao cvDao = new CvDao();
        boolean fileUploaded = false;
        String newPicturePath = picturePath; // Default to existing picture if no new picture is uploaded

        // Handle file upload
        if (filePart != null && filePart.getSize() > 0) {
            try (InputStream fileContent = filePart.getInputStream()) {
                Files.copy(fileContent, filePath, StandardCopyOption.REPLACE_EXISTING);
                newPicturePath = UPLOAD_DIR + File.separator + fileName;
                fileUploaded = true;
            } catch (IOException e) {
                throw new ServletException("File upload error", e);
            }
        }

        // Update CV
       CvMentor cvMentor = new CvMentor(mentorId, name, email, dob, gender, address, education, workExperience, achievements, phone, newPicturePath, email);

        // Update profile picture if uploaded
       if (fileUploaded) {
            // Your logic to update the profile picture if needed
        }
        // Update CV
        //cvDao.updateCvMentor(cvMentor);

        // Redirect to home page
       response.sendRedirect("home");
    }
}

