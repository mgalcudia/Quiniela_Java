

<%-- 
    Document   : texto
    Created on : 25-may-2015, 0:45:51
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
    <body style="background-color:#009999">
    <%@ include file = "menu_izq.jsp"%>
        <h3>Apuestas generadas</h3>
        
        <!-- Número de boletos rescatado del campo oculto -->
        <% int numeros_boletos = Integer.parseInt(request.getParameter("num_boletos"));
        double total=0;   
        %>
        <!-- Muestra Boletos -->
        <% for(int i=1; i<=numeros_boletos; i++) {%>
        <br>Boleto <%=i%>º<br>
        <% total+=0.5; %>
        <% int valor=Integer.parseInt(request.getParameter("apuesta"+i));%>
        <!-- Muestra el numero de apuestas -->
        <% for(int j=1; j<=valor; j++) {%>
        <br>Apuesta <%=j%>: 
        <br/>
        <!-- Mostramos los equipos y su 1X2 correspondiente -->
        <% for(int k=0;k<14;k++) 
        {
                 NumeroAleatorios ale = new NumeroAleatorios(1,3);
                    //genero aleatorio
                    int apuesta = ale.generar();

                    String equipo_local= equipos.equipo_casa(k);
                    String  equipo_visitante= equipos.equipo_fuera(k); 
                    String resultado= equipos.valor_texto(apuesta);    

                    out.print(equipo_local+" - "+equipo_visitante+":       ");                    
                    out.print(resultado);                    
                    out.print(" <br/> ");                  
            }
        }
        %> 
        <p> Pleno al 15:</p>
        <%
                
                NumeroAleatorios ale = new NumeroAleatorios(1,3);
                int apu_pleno = ale.generar();
                String pleno_quice= equipos.pleno();
                out.print(pleno_quice+":       ");

                 String resultado= equipos.valor_texto(apu_pleno);
                 out.print(resultado);

              
            out.print(" <br/> ");

            %>

            <p> Importe Boleto: 0.50 € </p>
            <br/>


            <%//}
            %>

            <%}%>
            <br/>
            <p>El importe Total que debe abonar son: <%=total%> €</p>

        </body>
        </html>
