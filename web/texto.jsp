<%@page import="controlador.dwes.NumeroAleatorios"%>

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
                <%aleatorio ale = new aleatorio(1,3);
                for(int k=1; k<=14; k++) 
                {
                    //genero apuesta
                    int apuesta = ale.generar();

                    //out.print(apuesta+", ");
                    //inicializo apuesta a 0
                    
                    switch(apuesta){

                    case 1:
                    out.print(" 1 ");
                    break;
                    case 2:
                     out.print(" 2 ");
                    break;
                    case 3:
                     out.print(" X ");
                    break;
                    default:
                     out.print(" Errorr ");
                    break;
                    }
                <br/>                         
                    apuesta=0;
                }%>
            <%}
            aleatorio reintegro = new aleatorio(1,9);
            %>            
            <br>Reintegro: <%out.print(reintegro.generar());%>
            <br>Importe Boleto: <%=valor%> €
            <br><% total += valor;%>
        <%}%>
        <br>
        
        El importe <strong>Total</strong> que debe abonar son: <%=total %>€
    </body>
</html>
