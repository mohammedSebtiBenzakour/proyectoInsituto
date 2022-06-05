/*
Fichero con la configuración de la conexion a la base de datos
 */
package controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author daw2
 */
public class Conexion {

    public static Connection conectarBD() throws SQLException {
        String sqlConeccion = "jdbc:mysql://localhost:3306/instituto?serverTimezone=UTC&usessl=false&allowPublicKeyRetrieval=true&enabledTLSProtocols=TLSv1.2";
        //  String sqlConeccion = "jdbc:mysql://node34219-biblioteca.es-1.axarnet.cloud/instituto?serverTimezone=UTC&usessl=false&allowPublicKeyRetrieval=true&enabledTLSProtocols=TLSv1.2";
        //  String sqlConeccion = "jdbc:mysql://mysql_db:3306/instituto?serverTimezone=UTC&usessl=false&allowPublicKeyRetrieval=true&enabledTLSProtocols=TLSv1.2";
        //   String sqlConeccion = System.getenv("dbConnectionUrl");

        String usuarioBD = "instituto";
        String passBD = "instituto";
//        String usuarioBD = "root";
//        String passBD = "root";
//        String usuarioBD = System.getenv("dbUserName");
//        String passBD = System.getenv("dbPassword");
        //  String usuarioBD = "root";
        //  String passBD = "CMSatd36375";
        //    DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        return DriverManager.getConnection(sqlConeccion, usuarioBD, passBD);
    }

    public static void desconectarBD(Connection con) {

        try {
            con.close();
        } catch (SQLException e) {
            e.getMessage();
        }
    }
}
