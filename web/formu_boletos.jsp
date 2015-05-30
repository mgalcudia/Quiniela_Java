<%-- 
    Document   : formu_boletos
    Created on : 22-may-2015, 23:53:03
    Author     : yo
--%>
<%@page import="controlador.dwes.FormHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>JSP Page</title>
    </head>
        <body>
        <h3>Apuestas</h3>
        <%String modo=request.getParameter("modo");%>
        <%=request.getParameter("modo") %>
        <form action="formularioII?modo=<%=modo%>" method="post">
            <%-- Guardo el número de boletos convirtiendolo como entero --%>
            <% int num_boletos = Integer.parseInt(request.getParameter("num_boletos"));%>
            <p>Se juegan <%=num_boletos%> boletos.</p>
            <%=FormHelper.ShowIfError(request.getAttribute("error_Apuesta"))%><br>
            <%-- Muestra una apuesta por cada boleto --%>
            <% for(int numero=1; numero<=num_boletos; numero++) 
            {%>
                Boleto <%=numero%> - Nº Apuestas: 
                <select name="apuesta<%= numero %>">
                    <option> Seleccione </option>
                    <% for(int i=1; i<=8; i++)
                    {
                        String apuesta = request.getParameter("apuesta"+numero);
                        String num = new Integer(i).toString();%>
                        <option value="<%=i%>" <% if(apuesta!=null && num.equals(apuesta)) {out.print("selected=\"selected\"");}%> ><%=i %></option>
                    <% } %>
                </select><br>
                <input type="hidden" value="<%=num_boletos%>" name="num_boletos"/>
            <%}%>
            <button type="submit" name="continuar">Continuar</button>
        </form>
    </body>
</html>
