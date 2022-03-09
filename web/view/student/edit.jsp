<%-- 
    Document   : edit
    Created on : Feb 11, 2022, 11:09:48 AM
    Author     : SAP-LAP-FPT
--%>

<%@page import="model.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Department"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            ArrayList<Department> depts = (ArrayList<Department>) request.getAttribute("depts");
            Student s = (Student)request.getAttribute("student");
        %>
    </head>
    <body>
        <form action="edit" method="POST">
            Id: <%=s.getId()%> <input type="hidden" name="id" value="<%=s.getId()%>" /> <br/>
            Name: <input type="text" name="name" value="<%=s.getName()%>"/> <br/>
            Gender: <input type="radio" 
                           <%if(s.isGender()){%>
                           checked="checked"
                           <%}%>
                           name="gender" value="male"/> Male 
            <input type="radio" 
                   <%=!s.isGender()?"checked=\"checked\"":""%>
                   name="gender" value="female"/> Female 
            <br/>
            Dob: <input type="date" name="dob" value="<%=s.getDob()%>" /> <br/>
            Department: <select name="did">
                <% for (Department d : depts) {
                %>
                <option
                    <%=(d.getId() == s.getDept().getId())?"selected=\"selected\"":""%>
                    value="<%=d.getId()%>"><%=d.getName()%></option>
                <%}%>
            </select>
            <br/>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
