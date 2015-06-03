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


          public static String valor_grafica(int apuesta){

            String resultado;

            switch(apuesta){

                    case 1:
                    
                   resultado= "<td bgcolor='red'><font color='#fff'>1</font></td><td>X</td><td>2</td>";
                    break;
                    case 2:
                   resultado= "<td>1</td><td>X</td><td bgcolor='red'><font color='#fff'>2</font></td>";
                     
                     
                    break;
                    case 3:
                  resultado= "<td>1</td><td bgcolor='red' ><font color='#fff'>X</font></td><td>2</td>";
                     
                     
                    break;
                    default:
                    
                    resultado= " Errorr ";
                    
                    break;
                    }
            return resultado;

          }




        }