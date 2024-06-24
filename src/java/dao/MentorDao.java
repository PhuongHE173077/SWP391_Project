package dao;

import context.DBContext;
import entity.CvMentor;
import entity.Mentor;
import entity.Schedule;
import entity.ScheduleMentor;
import entity.Skill;
import entity.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Data Access Object for Mentor
 */
public class MentorDao extends DBContext {

  public List<Mentor> getAllMentor() {
    String sql = "SELECT mentor.*, [User].* " +
                 "FROM mentor " +
                 "INNER JOIN [User] ON mentor.userId = [User].user_id";
    List<Mentor> listMentor = new ArrayList<>();
    CvDao cvd = new CvDao();
    SkillDao sd = new SkillDao();
    ScheduleMentorDao scd = new ScheduleMentorDao();

    try (PreparedStatement st = connection.prepareStatement(sql);
         ResultSet rs = st.executeQuery()) {

        while (rs.next()) {
            int mentorId = rs.getInt("mentor_id");
            String username = rs.getString("username");
            String password = rs.getString("password");
            String fullName = rs.getString("fullName");
            String email = rs.getString("email");
            String phone = rs.getString("phone");
            String address = rs.getString("address");
            int status = rs.getInt("status");
            double price = rs.getDouble("price");
            double rating = rs.getDouble("rating");
            String avatar = rs.getString("avatar");

            List<Skill> skills = sd.getSkillOfMentor(mentorId);
            List<ScheduleMentor> schedules = scd.getListScheduleByMentor(mentorId);
            CvMentor cv = cvd.getCvMentorByID(mentorId);

            Mentor mentor = new Mentor(mentorId, username, password, fullName, email, phone,
                                       address, status, price, rating, avatar, cv, skills, schedules);
            listMentor.add(mentor);
        }
    } catch (SQLException ex) {
        Logger.getLogger(MentorDao.class.getName()).log(Level.SEVERE, null, ex);
    }

    return listMentor;
}

    public Mentor getMentorByID(int id) {
        String sql = "SELECT mentor.*, [User].* " +
                     "FROM mentor " +
                     "INNER JOIN [User] ON mentor.userId = [User].user_id " +
                     "WHERE mentor_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    CvDao cvd = new CvDao();
                    SkillDao sd = new SkillDao();
                    ScheduleMentorDao scd = new ScheduleMentorDao();
                    Mentor mentor = new Mentor(
                        rs.getInt("mentor_id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("fullName"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("avatar"),
                        rs.getInt("status"),
                        rs.getDouble("price"),
                        rs.getDouble("rating"),
                        rs.getString("address"),
                        cvd.getCvMentorByID(rs.getInt("mentor_id")),
                        sd.getSkillOfMentor(rs.getInt("mentor_id")),
                        scd.getListScheduleByMentor(rs.getInt("mentor_id"))
                    );
                    return mentor;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(MentorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Mentor getMentorByUserID(int id) {
        String sql = "SELECT mentor.*, [User].* " +
                     "FROM mentor " +
                     "INNER JOIN [User] ON mentor.userId = [User].user_id " +
                     "WHERE [User].user_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    CvDao cvd = new CvDao();
                    SkillDao sd = new SkillDao();
                    ScheduleMentorDao scd = new ScheduleMentorDao();
                    Mentor mentor = new Mentor(
                        rs.getInt("mentor_id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("fullName"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getInt("status"),
                        rs.getDouble("price"),
                        rs.getDouble("rating"),
                        rs.getString("avatar"),
                        cvd.getCvMentorByID(rs.getInt("mentor_id")),
                        sd.getSkillOfMentor(rs.getInt("mentor_id")),
                        scd.getListScheduleByMentor(rs.getInt("mentor_id"))
                    );
                    return mentor;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(MentorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Mentor> getAllMentorBySkill(int skillId) {
        String sql = "SELECT * FROM skill_detail WHERE skill_id = ?";
        List<Mentor> listMentor = new ArrayList<>();
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, skillId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Mentor mentor = getMentorByID(rs.getInt("mentor_id"));
                    if (mentor != null) {
                        listMentor.add(mentor);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(MentorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listMentor;
    }

    public void addMentor(User user, double price) {
        String sql = "INSERT INTO mentor (userId, price) VALUES (?, ?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, user.getId());
            st.setDouble(2, price);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(MentorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Mentor> searchMentor(String name) {
    List<Mentor> listMentor = new ArrayList<>();
    String sql = "SELECT mentor.*, [User].* " +
                 "FROM mentor " +
                 "INNER JOIN [User] ON mentor.userId = [User].user_id " +
                 "WHERE [User].name LIKE ?";
    try (PreparedStatement st = connection.prepareStatement(sql)) {
        st.setString(1, "%" + name + "%");
        try (ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                // Gọi lại phương thức getMentorByID để lấy thông tin chi tiết của mentor
                Mentor mentor = getMentorByID(rs.getInt("mentor_id"));
                listMentor.add(mentor);
            }
        }
    } catch (SQLException ex) {
        Logger.getLogger(MentorDao.class.getName()).log(Level.SEVERE, null, ex);
    }
    return listMentor;
}
    
    
    
    
  public List<Mentor> searchMentorSkill(int skillId, String name) {
    List<Mentor> listMentor = new ArrayList<>();
    String sql = "SELECT mentor.*, [User].* " +
                 "FROM mentor " +
                 "INNER JOIN [User] ON mentor.userId = [User].user_id " +
                 "WHERE mentor.mentor_id IN (SELECT mentor_id FROM skill_detail WHERE skill_id = ?) " +
                 "AND [User].name LIKE ?";
    
    try (PreparedStatement st = connection.prepareStatement(sql)) {
        st.setInt(2, skillId);
        st.setString(2, "%" + name + "%");
        
        try (ResultSet rs = st.executeQuery()) {
            CvDao cvd = new CvDao();
            SkillDao sd = new SkillDao();
            ScheduleMentorDao scd = new ScheduleMentorDao();
            
            while (rs.next()) {
                int mentorId = rs.getInt("mentor_id");
                Mentor mentor = (Mentor) getAllMentorBySkill(1);
                

                listMentor.add(mentor);
            }
        }
    } catch (SQLException ex) {
        Logger.getLogger(MentorDao.class.getName()).log(Level.SEVERE, null, ex);
    }
    
    return listMentor;
}


    public static void main(String[] args) {
    
    }
}

