<%-- 
    Document   : menu_izq
    Created on : 31-may-2015, 10:32:58
    Author     : yo
--%>
<div style="margin: 0 auto">
    
    <h1>..: Quiniela :..</h1>
    
</div>
 
<div style="background-color:SandyBrown; text-align: center; padding-right: 5px" >
   
    
  
     <a href="formulario?modo=text">Quiniela en modo texto</a>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="formulario?modo=graf">Quiniela en modo gráfico</a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <%
        if (session.getAttribute("Partida_Anterior") != null) {
        %>
        <a href="ultimaApuesta.jsp">Mostrar última apuesta</a>
        <%
            }
        %>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="cerrar_sesion">Salir</a>
    
    
</div>
