package classes;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ServletEconomico")

public class ServletEconomico extends HttpServlet {
    
    @Override
    protected void doPost (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String method = request.getParameter("text");
        Conexion conexion = new Conexion();
        Connection conn = conexion.Conexion();
        switch (method) {
            case "agregar":
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    DateFormat dateformat = new SimpleDateFormat("dd-MM-yyyy");
                    String date = request.getParameter("dia") + "-" + request.getParameter("mes") + "-" + request.getParameter("anio");
                    Date fecha = new java.sql.Date(dateformat.parse(date).getTime());
                    DateFormat dateformat2 = new SimpleDateFormat("dd-MM-yyyy");
                    String date2 = request.getParameter("dia2") + "-" + request.getParameter("mes2") + "-" + request.getParameter("anio2");
                    Date fecha2 = new java.sql.Date(dateformat2.parse(date2).getTime());
                    String motivo = request.getParameter("motivo"); 
                    try { 
                    
                    
                            String sql = "insert into economico (empleadoID, fecha_inicio, fecha_fin, motivo) values (?,?,?,?)";
                            PreparedStatement s = conn.prepareStatement(sql);
                            s.setInt(1, id);
                            s.setDate(2, fecha);
                            s.setDate(3, fecha2);
                            s.setString(4, motivo);

                            s.executeUpdate();
                            s.close();
                        } catch (SQLException e){
                            System.out.println("No se pudo completar la operación: " + e.getMessage());
                        }
                        finally { conn.close(); }
                    
                    response.sendRedirect("diasEconomicos.jsp?id=" + id);
                } catch (SQLException e) {
                    System.out.println("No se pudo completar la operación: " + e.getMessage());
                } catch (ParseException ex) {
                    Logger.getLogger(ServletEconomico.class.getName()).log(Level.SEVERE, null, ex);
                }
                break;
            case "editar":
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    DateFormat dateformat = new SimpleDateFormat("dd-MM-yyyy");
                    String date = request.getParameter("dia") + "-" + request.getParameter("mes") + "-" + request.getParameter("anio");
                    Date fecha = new java.sql.Date(dateformat.parse(date).getTime());
                    DateFormat dateformat2 = new SimpleDateFormat("dd-MM-yyyy");
                    String date2 = request.getParameter("dia2") + "-" + request.getParameter("mes2") + "-" + request.getParameter("anio2");
                    Date fecha2 = new java.sql.Date(dateformat2.parse(date2).getTime());
                    String motivo = request.getParameter("motivo"); 
                    try { 
                        String sql = "update economico set "
                                + "fecha_inicio = ?, "
                                + "fecha_fin = ?,"
                                + "motivo = ?"
                                + "where economicoID =" + id;
                        PreparedStatement s = conn.prepareStatement(sql);
                        
                        s.setDate(1, fecha);
                        s.setDate(2, fecha2);
                        s.setString(3, motivo);
                        s.executeUpdate();
                        s.close();
                        } catch (SQLException e){
                            System.out.println("No se pudo completar la operación: " + e.getMessage());
                        }
                        finally { conn.close(); }
                    
                    response.sendRedirect("diasEconomicos.jsp?id=" + request.getParameter("user"));
                } catch (SQLException e) {
                    System.out.println("No se pudo completar la operación: " + e.getMessage());
                } catch (ParseException ex) {
                    Logger.getLogger(ServletEconomico.class.getName()).log(Level.SEVERE, null, ex);
                }
                break;
        }
    }
    
    protected void doGet (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        String text = request.getParameter("text");
        Conexion conexion = new Conexion();
        Connection conn = conexion.Conexion();
       switch (text) {
            case "editar":
                try {
                    String sql = "select * from economico where economicoID = " 
                            + request.getParameter("economicoid");;
                    Statement s = conn.createStatement();
                    ResultSet rs = s.executeQuery(sql);
                    while(rs.next()) {             
                        request.setAttribute("economicoID", rs.getInt(1));
                        request.setAttribute("id", rs.getInt(2));
                        request.setAttribute("fecha_inicio", rs.getDate(3));
                        request.setAttribute("fecha_final", rs.getDate(4)); 
                        request.setAttribute("motivo", rs.getString(5)); 
                    }
                    request.getRequestDispatcher("/agregarDiaEconomico.jsp?method=editar").forward(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(ServletNoticia.class.getName()).log(Level.SEVERE, null, ex);
                }
                break;
             case "eliminar":
               try {
                    String sql = "delete from economico where economicoID = " 
                            + request.getParameter("id");
                    Statement s = conn.createStatement();
                    s.executeUpdate(sql);
                    response.sendRedirect("diasEconomicos.jsp?id=" + request.getParameter("empleadoID"));
                } catch (SQLException e) {
                    System.out.println("No se encontró dia: " + e.getMessage());
                } 
               break;         
        }
    }

}
