package classes;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class ControlAsamblea {
    public int getnCol() throws SQLException {
        Conexion conexion = new Conexion ();
        Connection conn = conexion.Conexion();
        int nCol = 0;
        
        if (conn != null) {
            try {
                Statement s = conn.createStatement();
                String sql = "select count(*) from asamblea";
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
    
    public ResultSet getAsamblea() throws SQLException {
        Conexion conexion = new Conexion();
        Connection conn = conexion.Conexion();
        ResultSet rs = null;
        
        
        if (conn != null ) {
            try {
                Statement s = conn.createStatement();  
                String sql = "select * from asamblea order by id desc";
                
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
            String sql = "select minutaID from pathminuta;";
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
    
    
    public String getMinuta(int id) throws SQLException {
        String path = null;
        try {
            Conexion conexion = new Conexion();
            Connection conn = conexion.Conexion();
            Statement s = conn.createStatement();
            String sql = "select minutaID, path from minuta where asambleaID = " + id;
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
    public String getPathMinutaByID(int id) throws SQLException {
        String path = null;
        try {
            Conexion conexion = new Conexion();
            Connection conn = conexion.Conexion();
            Statement s = conn.createStatement();
            String sql = "select path from pathminuta where minutaID = " + id;
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
    
    public Asamblea getAsambleaById (int id) throws SQLException {
        Asamblea asamblea = new Asamblea();
        Blob blob;
        byte[] bdata;
        String descripcion;
            try {
                Conexion conexion = new Conexion();
                Connection conn = conexion.Conexion();
                Statement s = conn.createStatement();
                String sql = "select * from asamblea where asambleaID = " + id;
                try {
                    ResultSet rs = s.executeQuery(sql);
                    if (rs.next()) {
                        asamblea.setId(rs.getInt(1));
                        asamblea.setTitulo(rs.getString(2));
                        blob = rs.getBlob(3);
                        bdata = blob.getBytes(1, (int)blob.length());
                        descripcion = new String(bdata);
                        asamblea.setDescripcion(descripcion); 
                        asamblea.setTipo(rs.getString(4));
                        asamblea.setFecha(rs.getDate(5));
                        asamblea.setHorarioEntrada(rs.getString(6));
                        asamblea.setHorarioSalida(rs.getString(7)); 
                        asamblea.setLugar(rs.getString(8));
                        asamblea.setObservaciones(rs.getString(9));
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
        return asamblea;
    }
     
    public void deleteAsamblea(int id) throws SQLException {
        Conexion conexion = new Conexion();
        Connection conn = conexion.Conexion();
        
        if (conn != null) {
            try {
                Statement s = conn.createStatement();                  
                s.executeUpdate("delete from asamblea where asambleaID = " + id);
                s.close();              
            } catch (SQLException e) {
                System.out.println("No se encontró asamblea: " + e.getMessage());
            }
            finally { conn.close(); }           
        }
    }
    public void deleteAsambleaPath(int id) throws SQLException {
        Conexion conexion = new Conexion();
        Connection conn = conexion.Conexion();
        
        if (conn != null) {
            try {
                String sql = "delete from pathminuta where minutaID = " + id;
                Statement s = conn.createStatement(); 
                
                s.executeUpdate(sql);
                s.close();              
            } catch (SQLException e) {
                System.out.println("No se encontró asamblea: " + e.getMessage());
            }
            finally { conn.close(); }           
        }
    }

}
