<%-- 
    Document   : ultimaApuesta
    Created on : 03-jun-2015, 1:52:15
    Author     : yo
--%>

<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            out.println(session.getAttribute("Partida_Anterior"));
            out.println(session.getAttribute("Equipos_anterior"));
            out.println(session.getAttribute("num_boletos"));
            out.println(session.getAttribute("numero_apuestas"));
            Vector equipos = (Vector) session.getAttribute("Equipos_anterior");
            Vector apuestas = (Vector) session.getAttribute("Partida_Anterior");
            Vector num_apuestas = (Vector) session.getAttribute("numero_apuestas");
            Integer numero_boletos = (Integer) session.getAttribute("num_boletos");
            out.print(apuestas.size());
            out.print(numero_boletos);
            out.print(num_apuestas.elementAt(1));
            int indice= 0;
        %>
        <% for (int j = 0; j < numero_boletos; j++) {
        int num_apuesta = Integer.parseInt( num_apuestas.elementAt(j).toString()) ;
        %>
        <table border="1">
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