<%-- 
    Document   : grafico
    Created on : 27-may-2015, 0:37:41
    Author     : yo
--%>


<%@page import="controlador.dwes.NumeroAleatorios"%>
<%@page import="controlador.dwes.equipos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
        <body>
        <h3>Apuestas generadas</h3>
        
        <!-- Número de boletos rescatado del campo oculto -->
        <% int numeros_boletos = Integer.parseInt(request.getParameter("num_boletos"));
        double total=0;   
        %>
        <!-- Muestra Boletos -->
        <% for(int i=1; i<=numeros_boletos; i++) {%>
            <br>Boleto <%=i%>º<br>
            <% total+=0.5; %>
            <!-- recogemos el valor de cada apuesta -->
            
            <% int valor=Integer.parseInt(request.getParameter("apuesta"+i));
            int valor_colspan= valor*3;
            out.print(valor_colspan);%>
            <table border="1" bordercolor="red">

            <tr>
                
            <th colspan="25" bgcolor='red'><font color='#fff'>Pronósticos</font></th>
            </tr>

            <!-- Una fila por cada equipo -->
            <!-- ponemos for 14-->
             <% for(int k=0;k<14;k++){ 
            
             String equipo_local= equipos.equipo_casa(k);
             String  equipo_visitante= equipos.equipo_fuera(k);
                    
             %>
            <tr>
            <td>
            <%
            out.print(equipo_local+" - "+equipo_visitante+":       ");
                %>
            </td>            
            <!--  for para apuestas -->
             <% for(int j=1; j<=valor; j++) {
            NumeroAleatorios ale = new NumeroAleatorios(1,3);
                    //genero aleatorio
            int apuesta = ale.generar();
             %>            
                <!--pintamos la apuesta[i]-->
                <%
                 String resultado= equipos.valor_grafica(apuesta);
                out.print(resultado);               
               }%>           
                <!--fin for apuestas-->               
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
                   String pleno_quice= equipos.pleno();
                    out.print(pleno_quice+":       ");
                  NumeroAleatorios ale = new NumeroAleatorios(1,3);
                   %>
               </td>
              
                   <!-- pintamos apuestas pleno 15-->
                   <%
                    
                     int apu_pleno = ale.generar();
                      String resultado= equipos.valor_grafica(apu_pleno);
                    out.print(resultado);
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

