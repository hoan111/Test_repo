<%-- 
    Document   : rect
    Created on : Jan 10, 2022, 11:18:35 AM
    Author     : Sap-lap
--%>

<%@page import="model.Rect"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <% 
            //impicit objects
            ArrayList<Rect> rects = (ArrayList<Rect>)request.getAttribute("rects");
        %>
    </head>
    <body>
        <canvas id="myCanvas" width="500" height="500" style="border:1px solid #d3d3d3;">
        xxxx</canvas>

        <script>
        var c = document.getElementById("myCanvas");
        var ctx = c.getContext("2d");
        ctx.beginPath();
        <% for (Rect rect : rects) {
        %>
            ctx.rect(<%=rect.getX()%>, <%=rect.getY()%>, <%=rect.getW()%>, <%=rect.getH()%>);
        <%}%>
        ctx.stroke();
        </script> 
    </body>
</html>
