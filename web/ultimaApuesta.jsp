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
        Vector equipos=(Vector) session.getAttribute("Equipos_anterior");
        Vector apuestas=(Vector) session.getAttribute("Partida_Anterior");
        out.print(apuestas.size());
        out.print(equipos.size());
        %>
        <table border="1">
            <!-- Una fila por cada equipo -->
            <!-- ponemos for 14-->
             <% for(int i=0;i<15;i++){ 
            %>
              <tr>
                  <td>
                      <%
                        out.print(equipos.elementAt(i));
                      %>
                  </td>
                  <% for(int k=0; k<apuestas.size(); k++) {%>
                  
                  <td>
                      <%
                      out.print(apuestas.elementAt(k));
                      %>
                  </td>
                  
                  <%
                  }
                  %>
              </tr>
            <%
             }%>
             
        </table>
    </body>
</html>
