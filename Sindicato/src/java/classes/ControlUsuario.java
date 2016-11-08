package classes;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;


public class ControlUsuario {
    public Usuario getUsuarioById(int id) throws SQLException {
        Usuario usuario = null;
        Conexion conexion = new Conexion();
        Connection conn = conexion.Conexion();
        if (conn != null){
            try {
                Statement s = conn.createStatement();
                String sql = "select * from usuario where num_empleado = '" + id + "'";
                try {
                    ResultSet rs = s.executeQuery(sql);
                    if (rs.next()) {
                        usuario = new Usuario();
                        usuario.setId(rs.getString(1));
                        usuario.setNombre(rs.getString(2));
                        usuario.setEstatus(rs.getString(3));
                        usuario.setPuesto(rs.getString(4));
                        usuario.setArea(rs.getString(5));
                        usuario.setEmail(rs.getString(6));
                        usuario.setTel(rs.getString(7));
                    }
                }
                finally { s.close(); }
            }
            catch (SQLException e) {
                System.out.println("No se encontró usuario: " + e.getMessage());
            }
            finally { conn.close(); }
        }
        return usuario;
    }
    
    public ResultSet getTablaUsuario(){
        ResultSet result = null;
        Conexion conexion = new Conexion();
        Connection conn = conexion.Conexion();      
        
        try {
            Statement stmt = conn.createStatement();
            result = stmt.executeQuery("select * from usuario");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            try {
                conn.close();
            }catch (SQLException e){
                e.printStackTrace();
            } 
        } return result;               
    }            
}
