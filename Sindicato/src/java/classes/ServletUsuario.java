package classes;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ServletUsuario")

public class ServletUsuario extends HttpServlet {
    @Override
    protected void doGet (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        String num = request.getParameter("num");
        Conexion conexion = new Conexion();
        Connection conn = conexion.Conexion();
        int areaID = 0;
        int campusID = 0;
        int puestoID = 0;
        int categoriaID = 0;
        int estatusID = 0;
        int rolID = 0;
        
        try {
            String sql = "select * from empleado where empleadoID = " + num;
            Statement s = conn.createStatement();
            ResultSet rs = s.executeQuery(sql);
            if(rs.next()) {
                        request.setAttribute("id", num);
                        areaID = rs.getInt("areaID");
                        puestoID = rs.getInt("puestoID");
                        categoriaID = rs.getInt("categoriaID");
                        estatusID = rs.getInt("estatusID");
                        request.setAttribute("nombre", rs.getString("nombre"));
                        request.setAttribute("apeMaterno", rs.getString("apeMaterno"));
                        request.setAttribute("apePaterno", rs.getString("apePaterno"));
                        request.setAttribute("fecha_nacimiento", rs.getDate("fecha_nacimiento"));
                        request.setAttribute("civil", rs.getString("civil"));
                        request.setAttribute("calle", rs.getString("calle"));
                        request.setAttribute("numext", rs.getString("numext"));
                        request.setAttribute("numint", rs.getString("numint"));
                        request.setAttribute("cruzamiento", rs.getString("cruzamiento"));
                        request.setAttribute("colonia", rs.getString("colonia"));
                        request.setAttribute("postal", rs.getString("postal"));
                        request.setAttribute("ciudad", rs.getString("ciudad"));
                        //request.setAttribute("pais", rs.getString("pais"));
                        //request.setAttribute("estado", rs.getString("estado"));
                        request.setAttribute("email", rs.getString("email"));
                        request.setAttribute("telefono", rs.getString("telefono"));
                        request.setAttribute("tel_casa", rs.getString("tel_casa"));
                        request.setAttribute("path_imagen", rs.getString("path_imagen"));
                        request.setAttribute("hora_entrada", rs.getString("hora_entrada"));
                        request.setAttribute("hora_salida", rs.getString("hora_salida"));
                        request.setAttribute("segunda_entrada", rs.getString("segunda_entrada"));
                        request.setAttribute("segunda_salida", rs.getString("segunda_salida"));
                        request.setAttribute("ingreso_uni", rs.getDate("ingreso_uni"));
                        request.setAttribute("ingreso_sindicato", rs.getDate("ingreso_sindicato"));
                        request.setAttribute("grado", rs.getString("grado"));
                        request.setAttribute("otros", rs.getString("otros"));
                        request.setAttribute("jubilacion", rs.getString("jubilacion"));
            }
            s.close();
            sql = "select * from datogeneral where empleadoID = " + num;
            s = conn.createStatement();
            rs = s.executeQuery(sql);
            if (rs.next()) {
                request.setAttribute("sangre", rs.getString("sangre"));
                request.setAttribute("profesion", rs.getString("profesion"));
                request.setAttribute("ocupacion", rs.getString("ocupacion"));
                request.setAttribute("rfc", rs.getString("rfc"));
                request.setAttribute("curp", rs.getString("curp"));
                request.setAttribute("nss", rs.getString("nss"));
            }
            s.close();
            sql = "select campusID, nombre, telefono from area where areaID = " + areaID;
            s = conn.createStatement();
            rs = s.executeQuery(sql);
            if (rs.next()) {
                campusID = rs.getInt(1);
                request.setAttribute("area", rs.getString(2));
                request.setAttribute("tel_area", rs.getString(3));
            }
            s.close();
            sql = "select nombre from campus where campusID = " + campusID;
            s = conn.createStatement();
            rs = s.executeQuery(sql);
            if (rs.next()){
                request.setAttribute("campus", rs.getString(1));
            }
            s.close();
            
            sql = "select estatus from estatus where estatusID = " + estatusID;
            s = conn.createStatement();
            rs = s.executeQuery(sql);
            if (rs.next()) {
                request.setAttribute("estatus", rs.getString(1));
            }
            s.close();
            
            sql = "select puesto from puesto where puestoID = " + puestoID;
            s = conn.createStatement();
            rs = s.executeQuery(sql);
            if (rs.next()) {
                request.setAttribute("puesto", rs.getString(1));
            }
            s.close();
            
            sql = "select categoria from categoria where categoriaID = " + categoriaID;
            s = conn.createStatement();
            rs = s.executeQuery(sql);
            if (rs.next()) {
                request.setAttribute("categoria", rs.getString(1));
            }
            s.close();
            
            sql = "select rolID from usuariorol where empleadoID = " + num;
            s = conn.createStatement();
            rs = s.executeQuery(sql);
            if (rs.next()) {
                rolID = rs.getInt(1);
            }
            s.close();
            
            sql = "select rol from rol where rolID = " + rolID;
            s = conn.createStatement();
            rs = s.executeQuery(sql);
            if (rs.next()) {
                request.setAttribute("rol", rs.getString(1));
            }
            s.close();
            
        }catch (SQLException e) {
                System.out.println("No se encontró usuario: " + e.getMessage());
        } 
            try {
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(ServletUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        
        request.getRequestDispatcher("/admin-datos-usuarios.jsp").forward(request, response);

    }
}
