/*
 * Clase que utilizaremos como ayudante para mostrar información en una página
 * de JSP. 
 * Este es un ejemplo que no tiene porque ser la mejor forma de hacerlo, pero
 * que espero os ayude a entender como pueden interactuar las distintas piezas 
 * que tenemos
 */
package controlador.dwes;

/**
 *
 * @author Santi
 */
public class FormHelper {
    /**
     * Inicio etiqueta que contiene mensaje de error
     */
    final static String htmlErrorContainerBegin=
            "<span style=\"color:red; font-family:verdana; background:#ddd\">";
    
    /**
     * Fin de etiqueta del contenedor de error.
     */
    final static String htmlErrorContainerEnd=
            "</span>";
    
    /**
     * Devuelve el texto pasado como parámetro entre etiquetas contenedoras que
     * servirán para resaltar el error.
     * El método está pensado para que se le pase como parametro el valor 
     * introducido en la petición request con "setAttribute(name, value)"
     * 
     * @param objError  Texto a mostrar. Debe ser posible su conversión a String
     * @return Mensaje entre bloque HTML que resalta contenido
     */
    public static String ShowIfError(Object objError)
    {
        String msgError = (String) objError;
        if (msgError != null && ! msgError.equals("")) {
            // Mostramos texto de error
            return htmlErrorContainerBegin + msgError + htmlErrorContainerEnd;
        } else {
            // No se muestra el error
            return "";
        }
    }
}
