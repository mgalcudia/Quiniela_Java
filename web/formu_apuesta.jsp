<%-- 
    Document   : formu_apuesta
    Created on : 19-may-2015, 17:57:59
    Author     : yo
--%>

<%@page import="controlador.dwes.FormHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Apuestas Quiniela</title>
    </head>
    <body>
       
       <form method="post">
            <h2>Generación de apuestas modo texto</h2>
            Nº Boletos <input type="text" name="num_boletos"
           value="<%= request.getParameter("num_boletos") == null ? "1" : request.getParameter("num_boletos") %>"/>
            <button type="submit" name="btnenviarboleto">Continuar</button>
            <%=FormHelper.ShowIfError(request.getAttribute("error_num_boletos"))%>
        </form>
        
    </body>
</html>

