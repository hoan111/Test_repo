<%-- 
    Document   : search
    Created on : Jan 21, 2022, 11:23:28 AM
    Author     : Sap-lap
--%>

<%@page import="model.Student"%>
<%@page import="model.Department"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            ArrayList<Department> depts = (ArrayList<Department>) request.getAttribute("depts");
            ArrayList<Student> students = (ArrayList<Student>) request.getAttribute("students");
            int did = (Integer)request.getAttribute("did");
        %>
        <script>
            function submitForm()
            {
                document.getElementById("searchForm").submit();
            }
            
            function deleteStudent(id)
            {
                var result = confirm("Are you sure?");
                if(result)
                {
                    window.location.href = "delete?id=" + id;
                }
            }
            
        </script>
    </head>
    <body>
        <form action="search" method="GET" id="searchForm"> 
            Department: <select name="did" onchange="submitForm();">
                <option value="-1" >Please select a department</option>
                <% for (Department d : depts) {
                %>
                <option 
                    <%=(d.getId()==did)?"selected=\"selected\"":""%>
                    value="<%=d.getId()%>" ><%=d.getName()%></option>
                <%}%>
            </select>
        </form>
        <br/>
        <table border="1px">
            <tr>
                <td>Id</td>
                <td>Name</td>
                <td>Gender</td>
                <td>Dob</td>
                <td>Deparmtent</td>
                <td></td>
            </tr>
            <% for (Student s : students) {
            %>
            <tr>
                <td><%=s.getId() %></td>
                <td><%=s.getName()%></td>
                <td><%=s.isGender()%></td>
                <td><%=s.getDob() %></td>
                <td><%=s.getDept().getName()%></td>
                <td><a href="edit?id=<%=s.getId()%>">Edit</a>
                    <a href="#" onclick="deleteStudent(<%=s.getId()%>)">Delete</a>
                </td>
            </tr>
            <%}%>
        </table> 
        <a href="insert">Insert</a>
    </body>
</html>
