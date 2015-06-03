package controlador.dwes;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Random;

/**
 *
 * @author yo
 */
public class Jornada implements Serializable {
    public final int NPARTIDOS=15;
    final int PLENO_IDX=14;
    String[] equipo_local = {"R.SOCIEDAD", "AT.MADRID", "DEPORTIVO", "VILLARREAL", 
            "ATHLETIC CLUB", "LEVANTE", "GRANADA", "RAYO VALLECANO", "RACING",
            "BARCELONA", 
            "TENERIFE", "SPORTING", "BETIS", "PONFERRADINA", "GIRONA"};
    String[] equipo_visitante = {"CORDOBA", "GETAFE", "ESPAÑOL", "SEVILLA", 
        "ALMERIA", "CELTA", "EIBA", "MALAGA", "ZARAGOZA", "OSASUNA", "RECREATIVO", 
        "LEGANES", "VALLADOLID", "SABADELL", "R. MADRID"};
    
    String resultados[];
    
    Random rnd;
    
    public Jornada() {
        resultados=new String[NPARTIDOS];
        
        rnd = new Random();
    }
    
    public String equipo_casa(int i) {
        return equipo_local[i];
    }

    public String equipo_fuera(int i) {
        return equipo_visitante[i];

    }

    public String pleno() {
        return equipo_local[PLENO_IDX]+"-"+equipo_visitante[PLENO_IDX];

    }

    public void GeneraApuestas() {
        for(int i=0; i<NPARTIDOS; i++) {
            this.resultados[i]=GeneraResultadoApuesta();
        }
    }
    
    public String GeneraResultadoApuesta() {
        int val=rnd.nextInt(3);
        switch (val) {
            case 0: return "1";
            case 1: return "X";
            case 2: return "2";
        }
        // Aquí nunca debería llegar
        return "¿?";
    }
    
    public String ResultadoJornada(int n) {
        return this.resultados[n];
    }
            
    
    public static String valor_texto(int apuesta) {

        String resultado;
        ArrayList<String> valor = new ArrayList<String>();
   
        switch (apuesta) {

            case 1:
                resultado = "&nbsp;&nbsp;&nbsp;&nbsp;      [1]-[&nbsp;&nbsp;]-[&nbsp;&nbsp;] ";
                valor.add("1");
                break;
            case 2:
                resultado = "&nbsp;&nbsp;&nbsp;&nbsp;     [&nbsp;&nbsp;]-[2]-[&nbsp;&nbsp;] ";
                valor.add("2");
                break;
            case 3:
                resultado = "&nbsp;&nbsp;&nbsp;&nbsp;     [&nbsp;&nbsp;]-[&nbsp;&nbsp;]-[X] ";
                valor.add("X");
                break;
            default:
                resultado = " Errorr ";
                break;
        }

        return resultado;

    }

    public static String valor_grafica(int apuesta) {

        String resultado;

        switch (apuesta) {

            case 1:

                resultado = "<td bgcolor='red'><font color='#fff'>1</font></td><td>X</td><td>2</td>";
                break;
            case 2:
                resultado = "<td>1</td><td>X</td><td bgcolor='red'><font color='#fff'>2</font></td>";

                break;
            case 3:
                resultado = "<td>1</td><td bgcolor='red' ><font color='#fff'>X</font></td><td>2</td>";

                break;
            default:

                resultado = " Errorr ";

                break;
        }
        return resultado;

    }

}
