package classes;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class NoticiasDAO {
    public NoticiasDAO() {}
    
    Conexion conexion = new Conexion();
    Connection conn =  conexion.Conexion();
    Statement s;
    private int numRecord;
    
    public List<Noticia> consultaNoticia (int n, int numRecord) {
        String sql = "select SQL_CALC_FOUND_ROWS * from noticia limit "
                + n + ", " + numRecord;
        List<Noticia> list = new ArrayList<Noticia>();
        Noticia noticia = null;
        try {
            s = conn.createStatement();
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                noticia = new Noticia();
                noticia.setId(rs.getInt("noticiaID"));
                noticia.setTitulo("titulo");
                noticia.setDescripcion("descripcion");
                noticia.setFecha(rs.getDate("fecha").toString());
                noticia.setPath(rs.getString("path"));
                list.add(noticia);
            }
            rs.close();
            rs = s.executeQuery("SELECT FOUND_ROWS()");
            if (rs.next())
                    this.numRecord = rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                s.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return list;
    }
    public int getNumRecord() {
        return numRecord;
    }
    

}
