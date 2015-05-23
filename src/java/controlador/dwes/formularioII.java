/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.dwes;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author yo
 */
public class formularioII extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");



        String boton_Apuesta=request.getParameter("continuar");
        String modo=request.getParameter("modo");


        if(boton_Apuesta!=null){

                 // Han enviado los datos
            // Comprobamos si hay errores
            int num_boletos = Integer.parseInt(request.getParameter("num_boletos")); 
            boolean error_Boleto= false;

            //Recorremos todos los boletos para comprobar si alguno esta sin añadir apuesta
            //
            for(int i=1; i<=num_boletos; i++) 
            {
             String apuesta=request.getParameter("apuesta"+i);

             if (apuesta.equals("Seleccione"))
             {
                request.setAttribute("error_Apuesta", "Todos los campos deben tener un número seleccionado");
                error_Boleto=true;
            }
        }

        if(error_Boleto){

                 // Hay error y volvemos a mostrar el jsp anterior
            request.getRequestDispatcher("formu_boletos.jsp").forward(request, response);


        }else{

           if(modo.equals("text"))
           {


                    // No hay error mostramos el jsp quiniela texto
            request.getRequestDispatcher("").forward(request, response); 


        }else{

                     // No hay error mostramos el jsp quiniela grafico
            request.getRequestDispatcher("").forward(request, response);

        }

    }
}
else
{

            // es la primera vez   Redirigimos petición a página JSP 
    request.getRequestDispatcher("formu_boletos.jsp").forward(request, response);
}











}









    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
