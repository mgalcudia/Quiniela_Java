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
public class formulario extends HttpServlet {

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
        
        String boton_Enviar=request.getParameter("btnenviarboleto");//valor del boton de enviar
        
        if (boton_Enviar!=null) 
        { 

                        // Han enviado los datos
            // Comprobamos si hay errores
            String boletos = request.getParameter("num_boletos");
            boolean hayError=false;
            
            try 
            {
                int num_boletos=Integer.parseInt(boletos);// convertios a int para la comparacion
                if (num_boletos<1 || num_boletos>5) 
                {
                    hayError=true;
                    request.setAttribute("error_num_boletos", "El número de boletos debe estar entre 1 y 5");
                } 
            } catch(NumberFormatException ex) 
            {
                hayError=true;
                request.setAttribute("error_num_boletos", "Introduzca un número comprendido entre 1 y 5");
            }
            
            if (hayError) 
            {
                // Enviamos petición de nuevo al formulario
               // dispatcher = request.getRequestDispatcher("formu_apuesta.jsp");//"form_numboletos.jsp"

                // Enviamos petición de nuevo al formulario y Redirigimos petición a página JSP 
                request.getRequestDispatcher("formu_apuesta.jsp").forward(request, response);                    
            }
            else 
            {
                // No hay error
              //  dispatcher = request.getRequestDispatcher(urlFormApuesta);//"form_apuestas.jsp"

                // Redirigimos petición a página JSP -> form_servlet.jsp
                request.getRequestDispatcher("formu_boletos.jsp").forward(request, response); 
            }

           
        }
        else 
        {

 //////////////////////////////////////////////////
            // es la primera vez
            //dispatcher = request.getRequestDispatcher("formu_apuesta.jsp");//"form_numboletos.jsp"
            
            // Redirigimos petición a página JSP 
            request.getRequestDispatcher("formu_apuesta.jsp").forward(request, response);


        }

    }




















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
