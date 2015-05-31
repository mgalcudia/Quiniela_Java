<%-- 
    Document   : index
    Created on : 18-may-2015, 23:27:56
    Author     : yo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
        
        
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>..: Quiniela :..</title>
    </head>
    <body style="background-color:#009999">
            <%
            if((String) request.getSession().getAttribute("logueado") == null)
                {
                response.sendRedirect("index.jsp");
                }
            %>       
        <%@ include file = "menu_izq.jsp"%>
    </body>
</html>
