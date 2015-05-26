<%@page import="controlador.dwes.NumeroAleatorios"%>
<%@page import="controlador.dwes.equipos"%>

<%-- 
    Document   : texto
    Created on : 25-may-2015, 0:45:51
    Author     : yo
--%>

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
        int total=0;   
        %>
        <!-- Muestra Boletos -->
        <% for(int i=1; i<=numeros_boletos; i++) {%>
            <br>Boleto <%=i%>º<br>
            
            <% int valor=Integer.parseInt(request.getParameter("apuesta"+i));%>
            <!-- Muestra el numero de apuestas -->
            <% for(int j=1; j<=valor; j++) {%>
                <br>Apuesta <%=j%>: 
                <br/>
                <% for(int k=0;k<14;k++) 
                {
                NumeroAleatorios ale = new NumeroAleatorios(1,3);
                    //genero apuesta
                    int apuesta = ale.generar();
                     
                    String equipo_local= equipos.equipo_casa(k);
                    String  equipo_visitante= equipos.equipo_fuera(k);
                    //out.print(equipo_local+" - "+);
                    //inicializo apuesta a 0
                   out.print(equipo_local+" - "+equipo_visitante+":       ");



                    switch(apuesta){

                    case 1:
                    out.print("&nbsp;&nbsp;&nbsp;&nbsp;      [1]-[&nbsp;&nbsp;]-[&nbsp;&nbsp;] ");
                    break;
                    case 2:
                     out.print("&nbsp;&nbsp;&nbsp;&nbsp;     [&nbsp;&nbsp;]-[2]-[&nbsp;&nbsp;] ");
                    break;
                    case 3:
                     out.print("&nbsp;&nbsp;&nbsp;&nbsp;     [&nbsp;&nbsp;]-[&nbsp;&nbsp;]-[X] ");
                    break;
                    default:
                     out.print(" Errorr ");
                    break;
                    }
                    out.print(" <br/> ");  
                                     
                    apuesta=0;
                }%> 
               <p> Pleno al 15:</p>
                <%
                //
                 NumeroAleatorios ale = new NumeroAleatorios(1,3);
                int apu_pleno = ale.generar();
                String pleno_quice= equipos.pleno();
                 out.print(pleno_quice+":       ");
                 switch(apu_pleno){

                    case 1:
                    out.print("&nbsp;&nbsp;&nbsp;&nbsp;      [1]-[&nbsp;&nbsp;]-[&nbsp;&nbsp;] ");
                    break;
                    case 2:
                     out.print("&nbsp;&nbsp;&nbsp;&nbsp;     [&nbsp;&nbsp;]-[2]-[&nbsp;&nbsp;] ");
                    break;
                    case 3:
                     out.print("&nbsp;&nbsp;&nbsp;&nbsp;     [&nbsp;&nbsp;]-[&nbsp;&nbsp;]-[X] ");
                    break;
                    default:
                     out.print(" Errorr ");
                    break;
                    }
                       out.print(" <br/> ");
                    
                    %>
                    
                   <p> Importe Boleto: 0'50 € </p>
                   <br/>

            <%}%>
           
        <%}%>
        <br>
        
        
    </body>
</html>
