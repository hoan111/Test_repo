/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Department;
import model.Student;

/**
 *
 * @author Sap-lap
 */
public class StudentDBContext extends DBContext {
    public ArrayList<Student> getStudents(int did)
    {
        ArrayList<Student> students = new ArrayList<>();
        try {
            String sql = "SELECT s.sid,s.sname,s.gender,s.dob,d.did,d.dname\n" +
                    "FROM Student s INNER JOIN Department d \n" +
                    "ON s.did = d.did";
            if(did > -1)
            {
                sql += " WHERE d.did = ?";
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            if(did > -1)
            {
                stm.setInt(1, did);
            }
            ResultSet rs = stm.executeQuery();
            while(rs.next())
            {
                Student s = new Student();
                Department d = new Department();
                s.setId(rs.getInt("sid"));
                s.setName(rs.getString("sname"));
                s.setGender(rs.getBoolean("gender"));
                s.setDob(rs.getDate("dob"));
                d.setId(rs.getInt("did"));
                d.setName(rs.getString("dname"));
                s.setDept(d);
                students.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return students;
    }
    
    public Student getStudent(int id)
    {
        try {
            String sql = "SELECT s.sid,s.sname,s.gender,s.dob,d.did,d.dname\n" +
                    "FROM Student s INNER JOIN Department d \n" +
                    "ON s.did = d.did WHERE s.sid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            
            ResultSet rs = stm.executeQuery();
            if(rs.next())
            {
                Student s = new Student();
                Department d = new Department();
                s.setId(rs.getInt("sid"));
                s.setName(rs.getString("sname"));
                s.setGender(rs.getBoolean("gender"));
                s.setDob(rs.getDate("dob"));
                d.setId(rs.getInt("did"));
                d.setName(rs.getString("dname"));
                s.setDept(d);
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public void insertStudent(Student s)
    {
        String sql = "INSERT INTO [Student]\n" +
                        "           ([sid]\n" +
                        "           ,[sname]\n" +
                        "           ,[gender]\n" +
                        "           ,[dob]\n" +
                        "           ,[did])\n" +
                        "     VALUES\n" +
                        "           (?\n" +
                        "           ,?\n" +
                        "           ,?\n" +
                        "           ,?\n" +
                        "           ,?)";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, s.getId());
            stm.setString(2, s.getName());
            stm.setBoolean(3, s.isGender());
            stm.setDate(4, s.getDob());
            stm.setInt(5, s.getDept().getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            if(stm!=null)
            {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if(connection != null)
            {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
    }
    
    public void updateStudent(Student s)
    {
        String sql = "UPDATE [Student]\n" +
                            "   SET [sname] = ?\n" +
                            "      ,[gender] = ?\n" +
                            "      ,[dob] = ?\n" +
                            "      ,[did] = ?\n" +
                            " WHERE [sid] = ?";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(5, s.getId());
            stm.setString(1, s.getName());
            stm.setBoolean(2, s.isGender());
            stm.setDate(3, s.getDob());
            stm.setInt(4, s.getDept().getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            if(stm!=null)
            {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if(connection != null)
            {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
    }
    
    public void deleteStudent(int id)
    {
        String sql = "DELETE Student" +
                     " WHERE [sid] = ?";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            if(stm!=null)
            {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if(connection != null)
            {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
    }
    
}
