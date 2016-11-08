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
import javax.servlet.http.HttpSession;

@WebServlet("/ServletSession")

public class ServletSession extends HttpServlet {
    @Override
    protected void doPost (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {       
        try {
            HttpSession session = null;
            int area = 0;
            int puesto = 0;
            int categoria = 0;
            Conexion conexion = new Conexion();
            Connection conn = conexion.Conexion();
            Statement s = conn.createStatement();
            String id = request.getParameter("numero");
            String pass = request.getParameter("pass");
            int rolID = 0;
            Password pw = new Password();
           
            String sql = "select pass, rolID from usuariorol where empleadoID = " + id;
            ResultSet rs = s.executeQuery(sql);
            if(rs.next()) {
                String store = rs.getString("pass");
                boolean check = pw.check(pass, store);
                if(check == true){
                    session = request.getSession(true);
                    session.setAttribute("empleadoID", id);
                    rolID = rs.getInt("rolID");
                } else {
                    request.setAttribute("error", "true");
                    response.sendRedirect("login.jsp");
                }
            }
            else {
                request.setAttribute("error", "true");
                response.sendRedirect("login.jsp");
            }
            s.close();
            
            if (rolID != 0) {
                s = conn.createStatement();
                sql = "select rol from rol where rolID = " + rolID;
                rs = s.executeQuery(sql);
                if(rs.next()) {
                    session.setAttribute("rol", rs.getString("rol"));
                }
                s.close();
            }
            
            if (session != null) {
                s = conn.createStatement();
                sql = "select nombre,"
                        + "apeMaterno,"
                        + "apePaterno,"
                        + "areaID,"
                        + "puestoID,"
                        + "categoriaID, "
                        + "email from empleado where empleadoID = " + id;
                rs = s.executeQuery(sql);
                if(rs.next()) {
                    String nombre = rs.getString("nombre") + " "
                                    + rs.getString("apePaterno") + " "
                                    + rs.getString("apeMaterno");
                    session.setAttribute("nombre", nombre);
                    area = rs.getInt("areaID");
                    puesto = rs.getInt("puestoID");
                    session.setAttribute("email", rs.getString("email"));
                    categoria = rs.getInt("categoriaID");
                    
                }
                s.close();
            }
            if (area != 0) {
                s = conn.createStatement();
                sql = "select nombre from area where areaID = " + area;
                rs = s.executeQuery(sql);
                if(rs.next()) {
                    session.setAttribute("area", rs.getString("nombre"));
                }
                s.close();
            }
            if (puesto != 0) {
                s = conn.createStatement();
                sql = "select puesto from puesto where puestoID = " + puesto;
                rs = s.executeQuery(sql);
                if(rs.next()) {
                    session.setAttribute("puesto", rs.getString("puesto"));
                }
                s.close();
            }
            
            if (categoria != 0) {
                s = conn.createStatement();
                sql = "select categoria from categoria where categoriaID = " + categoria;
                rs = s.executeQuery(sql);
                if(rs.next()) {
                    session.setAttribute("categoria", rs.getString("categoria"));
                }
                s.close();
            }
            
            
            conn.close();
            response.sendRedirect("index.jsp");
        } catch(SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(ServletSession.class.getName()).log(Level.SEVERE, null, ex);
        }
        
            
    }
    
    

}
