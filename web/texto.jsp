

<%@page import="java.util.Vector"%>

<%@page import="controlador.dwes.Jornada"%>
<%-- 
    Document   : texto
    Created on : 25-may-2015, 0:45:51
    Author     : yo
    --%>


    <%@page import="controlador.dwes.NumeroAleatorios"%>
    <%@page import="controlador.dwes.equipos"%>
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
        <h3>Apuestas generadas</h3>
        
        <!-- Número de boletos rescatado del campo oculto -->
        <% 
        HttpSession sesion=request.getSession();
        int numeros_boletos = Integer.parseInt(request.getParameter("num_boletos"));
        Integer boleto = new Integer(numeros_boletos);
        sesion.setAttribute("num_boletos",boleto); 
        double total=0; 
        Jornada jornadaActual=new Jornada();
       
        Vector v=new Vector();
        Vector equipo= new Vector();
        Vector num_apuestas=new Vector();
        
        %>
        <!-- Muestra Boletos -->
        <% for(int j=1; j<=numeros_boletos; j++) {%>
            <br>Boleto <%=j%>º<br>
            <% total+=0.5; %>
            <!-- recogemos el valor de cada apuesta -->
            
            <% int valor=Integer.parseInt(request.getParameter("apuesta"+j));
             num_apuestas.addElement(valor);
            //out.print(valor_colspan);%>
            <%=valor%>
            <br>
            <table>
            <!-- Una fila por cada equipo -->
            <!-- ponemos for 14-->
             <% for(int i=0;i<14;i++){ 
            
             String equipo_local= jornadaActual.equipo_casa(i);
             String  equipo_visitante= jornadaActual.equipo_fuera(i);
             equipo.addElement(equipo_local+" - "+equipo_visitante+":");
             %>
            <tr>
            <td>
            <%
            out.print(equipo_local+" - "+equipo_visitante+":       ");
                %>
            </td>            
            <!--  for para apuestas -->
             <% for(int k=1; k<=valor; k++) {
                 
              String resultado= jornadaActual.GeneraResultadoApuesta();   
              v.addElement(resultado);
             
               // <!--pintamos la apuesta[i]-->
                out.print("<td>"+resultado+"</td>");                  
                 
                //out.print(resultado);               
               }%>           
                <!--  </td>fin for apuestas--> 
            
            </tr>
            <%} %>
           <!-- fin del for de 14 -->
           <tr>
               <th colspan="25">Pleno al quince</th>
           </tr>
           <tr>
               <td>
                   <!-- pintamos el equipos del pleno-->
                   <%
                   String pleno_quice= jornadaActual.pleno();
                   equipo.addElement(pleno_quice);
                    out.print(pleno_quice+":       ");                 
                   %>
               </td>
               
                   <!--<td> pintamos apuestas pleno 15-->
                   <%
                    
                     //int apu_pleno = ale.generar();
                      String resultado= jornadaActual.GeneraResultadoApuesta();
                       v.addElement(resultado);
                     
                    out.print("<td>"+resultado+"</td>"); 
                sesion.setAttribute("Partida_Anterior",v);
                sesion.setAttribute("Equipos_anterior",equipo);
                sesion.setAttribute("numero_apuestas", num_apuestas);
                   %> 
           </tr>
            </table>

            <p> Importe Boleto: 0.50 € </p>
            <br/>


            <%//}
            %>

            <%}%>
            <br/>
            <p>El importe Total que debe abonar son: <%=total%> €</p>

        </body>
        </html>
