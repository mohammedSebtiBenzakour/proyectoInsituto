/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladorEditarLibro;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author daw2
 */
public class ConexionDao {
     public static Connection conectarBD() throws SQLException {
        String sqlConeccion = "jdbc:mysql://localhost:3306/instituto?serverTimezone=UTC&usessl=false&allowPublicKeyRetrieval=true";
        String usuarioBD = "instituto";
        String passBD = "instituto";

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
