package controlador.dwes;
import java.util.ArrayList;


/**
 *
 * @author yo
 */


public class equipos {

public static String equipo_casa(int i){



    String[] equipo_local= {"R.SOCIEDAD","AT.MADRID","DEPORTIVO","VILLARREAL","ATHLETIC CLUB","LEVANTE","GRANADA","RAYO VALLECANO","RACING","TENERIFE","SPORTING","BETIS","PONFERRADINA","GIRONA"};

    return equipo_local[i];


}

public static String equipo_fuera(int i){


   String[] equipo_visitante= {"CORDOBA","GETAFE","ESPAÑOL","SEVILLA","ALMERIA","CELTA","EIBA","MALAGA","ZARAGOZA","OSASUNA","RECREATIVO","LEGANES","VALLADOLID","SABADELL"};


   return equipo_visitante[i];

}

public static String pleno(){

    String[] pleno_quince= {"BARCELONA - R.MADRID"};

    return pleno_quince[0];


}

public static String valor_texto(int apuesta){

  String resultado;

   switch(apuesta){

                    case 1:
                    resultado= "&nbsp;&nbsp;&nbsp;&nbsp;      [1]-[&nbsp;&nbsp;]-[&nbsp;&nbsp;] ";
                    break;
                    case 2:
                    resultado= "&nbsp;&nbsp;&nbsp;&nbsp;     [&nbsp;&nbsp;]-[2]-[&nbsp;&nbsp;] ";
                    break;
                    case 3:
                    resultado= "&nbsp;&nbsp;&nbsp;&nbsp;     [&nbsp;&nbsp;]-[&nbsp;&nbsp;]-[X] ";
                    break;
                    default:
                    resultado= " Errorr ";
                    break;


}

    return resultado;

}
}