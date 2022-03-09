/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.student;

import controller.auth.BaseAuthController;
import dal.DepartmentDBContext;
import dal.StudentDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Department;
import model.Student;

/**
 *
 * @author SAP-LAP-FPT
 */
public class EditController extends BaseAuthController {


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
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        StudentDBContext studentDB = new StudentDBContext();
        Student student = studentDB.getStudent(id);
        request.setAttribute("student", student);
        
        DepartmentDBContext deptDB = new DepartmentDBContext();
        ArrayList<Department> depts = deptDB.getDepts();
        request.setAttribute("depts", depts);
        
        request.getRequestDispatcher("../view/student/edit.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String raw_id = request.getParameter("id");
        String raw_name = request.getParameter("name");
        String raw_gender = request.getParameter("gender");
        String raw_dob = request.getParameter("dob");
        String raw_did = request.getParameter("did");
        
        //processing - validate data
        int id = Integer.parseInt(raw_id);
        String name = raw_name;
        boolean gender = (raw_gender.equals("male"));
        Date dob = Date.valueOf(raw_dob);
        int did = Integer.parseInt(raw_did);
        
        // construct student object
        Department dept = new Department();
        dept.setId(did);
        Student student = new Student();
        student.setId(id);
        student.setName(name);
        student.setGender(gender);
        student.setDob(dob);
        student.setDept(dept);
        
        StudentDBContext db = new StudentDBContext();
        db.updateStudent(student);
        
        //response.getWriter().println("student already added");
        response.sendRedirect("search");
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
