package classes;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class ControlEvento {
    public int getnCol() throws SQLException {
        Conexion conexion = new Conexion ();
        Connection conn = conexion.Conexion();
        int nCol = 0;
        
        if (conn != null) {
            try {
                Statement s = conn.createStatement();
                String sql = "select count(*) from evento";
                try{
                    ResultSet rs = s.executeQuery(sql);
                    if (rs.next()) {
                        nCol = rs.getInt(1);
                    }
                }
                finally { s.close(); }              
            } catch(SQLException e) {
                System.out.println("No se encontró número: " + e.getMessage());
            }
            finally { conn.close(); }
        }
        return nCol;       
    } 
    
    public ResultSet getEventos() throws SQLException {
        Conexion conexion = new Conexion();
        Connection conn = conexion.Conexion();
        ResultSet rs = null;
        
        
        if (conn != null ) {
            try {
                Statement s = conn.createStatement();  
                String sql = "select * from evento order by id desc";
                
                try {
                    rs = s.executeQuery(sql);
                    
                }
                finally { s.close(); }
    
            } catch (SQLException e) {
                e.printStackTrace();
            }
            finally { conn.close();}
        }
        return rs;           
    }
    
    public int getLastId() throws SQLException {
        int id = 0;
        try {
            Conexion conexion = new Conexion();
            Connection conn = conexion.Conexion();
            Statement s = conn.createStatement();
            String sql = "select id from evento;";
            try {
                ResultSet rs = s.executeQuery(sql);
                if (rs.last()) {
                    if (rs.getInt(1) == 0) { id = 0; }
                    else { id = rs.getInt(1) + 1; }     
                }
            }
            finally {
                s.close();
                conn.close();
            }           
        } catch (SQLException e){
            e.printStackTrace();
        }
        return id;
    }
    
    
    public String getPath(int id) throws SQLException {
        String path = null;
        try {
            Conexion conexion = new Conexion();
            Connection conn = conexion.Conexion();
            Statement s = conn.createStatement();
            String sql = "select path from evento where id = " + id;
            try {
                ResultSet rs = s.executeQuery(sql);
                if (rs.next()) {
                    path = rs.getString(1); 
                }
            }
            finally {
                s.close();
                conn.close();
            }           
        } catch (SQLException e){
            e.printStackTrace();
        }
        return path;
    }
    
    public Evento getEventoById (int id) throws SQLException {
        Evento evento = new Evento();
        Blob blob;
        byte[] bdata;
        String descripcion;
            try {
                Conexion conexion = new Conexion();
                Connection conn = conexion.Conexion();
                Statement s = conn.createStatement();
                String sql = "select * from evento where id =" + id;
                try {
                    ResultSet rs = s.executeQuery(sql);
                    if (rs.next()) {
                        evento.setId(rs.getInt(1));
                        evento.setTitulo(rs.getString(2));
                        blob = rs.getBlob(3);
                        bdata = blob.getBytes(1, (int)blob.length());
                        descripcion = new String(bdata);
                        evento.setDescripcion(descripcion);                       
                        evento.setFecha(rs.getString(4));
                        evento.setHorario(rs.getString(5));
                        evento.setfechaPublicacion(rs.getString(6));
                        
                        
                    }
                }
                finally { 
                    s.close(); 
                    conn.close();
                }
            }
            catch (SQLException e) {
                System.out.println("No se encontró evento: " + e.getMessage());
            }
        return evento;
    }
    
    public void addEvento (Evento evento) throws SQLException {
        Conexion conexion = new Conexion();
        Connection conn = conexion.Conexion();
        
        if (conn != null) {
            try { 
                String sql = "insert into evento (titulo, descripcion, fecha, horario, foto) values (?,?,?,?,?)";
                PreparedStatement s = conn.prepareStatement(sql);
                s.setString(1, evento.getTitulo());
                s.setString(2, evento.getDescripcion());
                s.setString(3, evento.getFecha());
                s.setString(4, evento.getHorario());
                s.setBlob(5, evento.getFoto());
                
                s.executeUpdate(sql);
                s.close();
            } catch (SQLException e){
                System.out.println("No se pudo completar la operación: " + e.getMessage());
            }
            finally { conn.close(); }
        }
    }
    
    public void updateEvento(int id, String titulo, String descripcion) throws SQLException {
        Conexion conexion = new Conexion();
        Connection conn = conexion.Conexion();
        
        if (conn != null) {
            try {
                Statement s = conn.createStatement();
                String sql = "update evento set titulo =" + titulo + "', descripcion = '" + descripcion + "' where id = " + id;
                s.executeUpdate(sql);
                s.close();
            } catch (SQLException e) {
                System.out.println("No se encontró evento: " + e.getMessage());
            }
            finally { conn.close(); }           
        }
    }
    
    public void deleteEvento(int id) throws SQLException {
        Conexion conexion = new Conexion();
        Connection conn = conexion.Conexion();
        
        if (conn != null) {
            try {
                Statement s = conn.createStatement();                  
                s.executeUpdate("delete from evento where id = " + id);
                s.close();              
            } catch (SQLException e) {
                System.out.println("No se encontró evento: " + e.getMessage());
            }
            finally { conn.close(); }           
        }
    }

}
