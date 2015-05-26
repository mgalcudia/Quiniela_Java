package controlador.dwes;
import java.util.ArrayList;


/**
 *
 * @author yo
 */


public class equipos {
/*
  private String[] equipo_local;
  private String[] equipo_visitante;
  private String[] pleno_quince;

  public equipos(String[] equipo_local, String[] equipo_visitante,String[] pleno_quince)
  {
    this.equipo_local = equipo_local;
    this.equipo_visitante = equipo_visitante;
    this.pleno_quince = pleno_quince;

}
*/
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

/*

public static String equipo_casa(int i){



    String[] equipo_local= {"R.SOCIEDAD","AT.MADRID","DEPORTIVO","VILLARREAL","ATHLETIC CLUB","LEVANTE","GRANADA","RAYO VALLECANO","RACING","TENERIFE","SPORTING","BETIS","PONFERRADINA","GIRONA"};

    return equipo_local[i];


}

public static String equipo_fuera(int i){


   String[] equipo_visitante= {"CORDOBA","GETAFE","ESPAÑOL","SEVILLA","ALMERIA","CELTA","EIBA","MALAGA","ZARAGOZA","OSASUNA","RECREATIVO","LEGANES","VALLADOLID","SABADELL"};


   return  equipo_visitante[i];

}

public static String pleno(){

    String[] pleno_quince= {"BARCELONA - R.MADRID"};

    return pleno_quince[0];


}
*/

    

}