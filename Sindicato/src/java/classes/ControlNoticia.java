package classes;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class ControlNoticia {
    public int getnCol() throws SQLException {
        Conexion conexion = new Conexion ();
        Connection conn = conexion.Conexion();
        int nCol = 0;
        
        if (conn != null) {
            try {
                Statement s = conn.createStatement();
                String sql = "select count(*) from noticia";
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
    
    public ResultSet getNoticias() throws SQLException {
        Conexion conexion = new Conexion();
        Connection conn = conexion.Conexion();
        ResultSet rs = null;
        
        
        if (conn != null ) {
            try {
                Statement s = conn.createStatement();  
                String sql = "select * from noticia order by id desc";
                
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
            String sql = "select id from noticia;";
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
            String sql = "select path from noticia where id = " + id;
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
    
    public Noticia getNoticiaById (int id) throws SQLException {
        Noticia noticia = null;
        Blob blob;
        byte[] bdata;
        String descripcion;
            try {
                Conexion conexion = new Conexion();
                Connection conn = conexion.Conexion();
                Statement s = conn.createStatement();
                String sql = "select * from noticia where id =" + id;
                try {
                    ResultSet rs = s.executeQuery(sql);
                    if (rs.next()) {
                        noticia = new Noticia();
                        noticia.setId(rs.getInt(1));
                        noticia.setTitulo(rs.getString(2));
                        blob = rs.getBlob(3);
                        bdata = blob.getBytes(1, (int)blob.length());
                        descripcion = new String(bdata);
                        noticia.setDescripcion(descripcion);                       
                        noticia.setFecha(rs.getString(4));
                        noticia.setPath(rs.getString(5));
                        
                    }
                }
                finally { 
                    s.close(); 
                    conn.close();
                }
            }
            catch (SQLException e) {
                System.out.println("No se encontró noticia: " + e.getMessage());
            }
        return noticia;
    }
    
    public void addNoticia (Noticia noticia) throws SQLException {
        Conexion conexion = new Conexion();
        Connection conn = conexion.Conexion();
        
        if (conn != null) {
            try { 
                String sql = "insert into noticia (titulo, descripcion, foto) values (?,?,?)";
                PreparedStatement s = conn.prepareStatement(sql);
                s.setString(1, noticia.getTitulo());
                s.setString(2, noticia.getDescripcion());
                s.setBlob(3, noticia.getFoto());
                
                s.executeUpdate(sql);
                s.close();
            } catch (SQLException e){
                System.out.println("No se pudo completar la operación: " + e.getMessage());
            }
            finally { conn.close(); }
        }
    }
    
    public void updateNoticia(int id, String titulo, String descripcion) throws SQLException {
        Conexion conexion = new Conexion();
        Connection conn = conexion.Conexion();
        
        if (conn != null) {
            try {
                Statement s = conn.createStatement();
                String sql = "update noticia set titulo =" + titulo + "', descripcion = '" + descripcion + "' where id = " + id;
                s.executeUpdate(sql);
                s.close();
            } catch (SQLException e) {
                System.out.println("No se encontró noticia: " + e.getMessage());
            }
            finally { conn.close(); }           
        }
    }
    
    public void deleteNoticia(int id) throws SQLException {
        Conexion conexion = new Conexion();
        Connection conn = conexion.Conexion();
        
        if (conn != null) {
            try {
                Statement s = conn.createStatement();                  
                s.executeUpdate("delete from noticia where id = " + id);
                s.close();              
            } catch (SQLException e) {
                System.out.println("No se encontró noticia: " + e.getMessage());
            }
            finally { conn.close(); }           
        }
    }

}
