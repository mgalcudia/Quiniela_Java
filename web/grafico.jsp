<%--
    Document   : grafico
    Created on : 27-may-2015, 0:37:41
    Author     : yo
--%>


<%@page import="java.util.Vector"%>
<%@page import="controlador.dwes.NumeroAleatorios"%>
<%@page import="controlador.dwes.Jornada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  
    /*
    
    if tengo que recuperar jornada de sesion
       recupero jornada de sesion
    sino 
       genero apuestas
    */ 
    
    
    // Guardo la jornada en la sesion
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
        <% int numeros_boletos = Integer.parseInt(request.getParameter("num_boletos"));
        double total=0; 
        Jornada jornadaActual=new Jornada();
        HttpSession sesion=request.getSession();
        Vector v=new Vector();
        Vector equip=new Vector();
        %>
        <!-- Muestra Boletos -->
        <% for(int j=1; j<=numeros_boletos; j++) {%>
            <br>Boleto <%=j%>º<br>
            <% total+=0.5; %>
            <!-- recogemos el valor de cada apuesta -->
            
            <% int valor=Integer.parseInt(request.getParameter("apuesta"+j));
            int valor_colspan= valor*3;
            //out.print(valor_colspan);%>
            <table border="1" bordercolor="red">

            <tr>
                
            <th colspan="25" bgcolor='red'><font color='#fff'>Pronósticos</font></th>
            </tr>

            <!-- Una fila por cada equipo -->
            <!-- ponemos for 14-->
             <% for(int i=0;i<14;i++){ 
            
             String equipo_local= jornadaActual.equipo_casa(i);
             String  equipo_visitante= jornadaActual.equipo_fuera(i);
             equip.addElement(equipo_local+" - "+equipo_visitante+":       ");
                    
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
                if(resultado == "1"){
                    out.print("<td bgcolor='red'><font color='#fff'>1</font></td><td>X</td><td>2</td>");
                }else if(resultado == "X"){
                    
                    out.print("<td>1</td><td>X</td><td bgcolor='red'><font color='#fff'>2</font></td>");
                }else{
                    
                    out.print("<td>1</td><td bgcolor='red' ><font color='#fff'>X</font></td><td>2</td>");
                }
                 
                 
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
                   equip.addElement(pleno_quice);
                    out.print(pleno_quice+":       ");                 
                   %>
               </td>
               
                   <!--<td> pintamos apuestas pleno 15-->
                   <%
                    
                     //int apu_pleno = ale.generar();
                      String resultado= jornadaActual.GeneraResultadoApuesta();
                       v.addElement(resultado);
                      if(resultado == "1"){
                    out.print("<td bgcolor='red'><font color='#fff'>1</font></td><td>X</td><td>2</td>");
                }else if(resultado == "X"){
                    
                    out.print("<td>1</td><td>X</td><td bgcolor='red'><font color='#fff'>2</font></td>");
                }else{
                    
                    out.print("<td>1</td><td bgcolor='red' ><font color='#fff'>X</font></td><td>2</td>");
                }
                      
               sesion.setAttribute("Partida_Anterior",v);
               sesion.setAttribute("Equipos_anterior",equip);
                   %> 
           </tr>
            </table>
                   <p> Importe Boleto: 0.50 € </p>
                   <br/>
        <%}%>
        <br/>
        <p>El importe Total que debe abonar son: <%=total%> €</p>
        
    </body>
</html>

