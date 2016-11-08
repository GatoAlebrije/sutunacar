package classes;
import java.sql.*;

import javax.servlet.http.HttpServlet;


public class Conexion extends HttpServlet{
    Connection connection = null;
    public Connection Conexion(){
            final String URL = "jdbc:mysql://localhost:3306/sindicato";
            final String user = "root";
            final String password = "12345";
            
            try {
                DriverManager.registerDriver(new com.mysql.jdbc.Driver());
                connection = DriverManager.getConnection(URL, user, password); 
               
            } catch (Exception e) {
                e.printStackTrace();
            }
         return connection;   
    }
    public ResultSet Consulta(String sql){
        ResultSet result = null;
        PreparedStatement consulta;
        try {
            consulta = connection.prepareStatement(sql);
            result = consulta.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
       return result; 
    }
}
