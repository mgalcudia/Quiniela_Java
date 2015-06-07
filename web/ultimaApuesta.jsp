<%-- 
    Document   : ultimaApuesta
    Created on : 03-jun-2015, 1:52:15
    Author     : yo
--%>

<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%
            if((String) request.getSession().getAttribute("logueado") == null)
                {
                response.sendRedirect("index.jsp");
                }
            %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background-color:#009999">
        <%@ include file = "menu_izq.jsp"%>
        <h3>Ultima apuesta</h3>
        <%
            Vector equipos = (Vector) session.getAttribute("Equipos_anterior");
            Vector apuestas = (Vector) session.getAttribute("Partida_Anterior");
            Vector num_apuestas = (Vector) session.getAttribute("numero_apuestas");
            Integer numero_boletos = (Integer) session.getAttribute("num_boletos");
            
            int indice= 0;
        %>
        <% for (int j = 0; j < numero_boletos; j++) {
        int num_apuesta = Integer.parseInt( num_apuestas.elementAt(j).toString()) ;
        %>
        <table>
            <!-- Una fila por cada equipo -->
            <!-- ponemos for 14-->
            <% for (int i = 0; i < 14; i++) {
            %>
            <tr>
                <td>
                    <%
                         out.print(equipos.elementAt(i));
                    %>
                </td>
                <%for (int k = 0; k < num_apuesta; k++) {%>

                <td>
                    <%
                       out.print(apuestas.elementAt(indice));
                       indice++;
                    %>
                </td>

                <%
                   }
                %>
            </tr>
            <%
                }%>
                <th colspan="25">Pleno al quince</th>
                <tr>
                    <td><%out.print(equipos.elementAt(14));%><td>
                    <td><%out.print(apuestas.elementAt(indice));
                           indice++; %><td>
                        
                </tr>

        </table>
                <br>
        <%}
        out.print(indice);%>
    </body>