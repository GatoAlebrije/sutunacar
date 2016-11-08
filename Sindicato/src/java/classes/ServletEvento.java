package classes;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/ServletEvento")
@MultipartConfig(maxFileSize = 16177215)

public class ServletEvento extends HttpServlet {
    @Override
    
    protected void doPost (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String method = request.getParameter("text");
        Conexion conexion = new Conexion();
        Connection conn = conexion.Conexion();
        switch (method) {
            case "agregar":
                try {
                    ControlEvento cEvento = new ControlEvento();
                    String titulo = request.getParameter("titulo");
                    String descripcion = request.getParameter("descripcion");
                    String fecha = request.getParameter("dia") + "/" + request.getParameter("mes") + "/" + request.getParameter("anio");
                    String horario = request.getParameter("hora") + " - " + request.getParameter("hora2");
                    Part filePart = request.getPart("foto");                  
                    InputStream foto = filePart.getInputStream(); 
                    if (conn != null) {
                        try { 
                            String path = "Evento_" + cEvento.getLastId() + ".jpg";
                            File uploads = new File(getServletContext().getInitParameter("upload.location") + "/eventos");
                            File file = new File(uploads, path);
                            InputStream input = foto;
                            Files.copy(input, file.toPath());
                            String sql = "insert into evento (titulo, descripcion, fecha, horario, path) values (?,?,?,?,?)";
                            PreparedStatement s = conn.prepareStatement(sql);
                            s.setString(1, titulo);
                            s.setString(2, descripcion);
                            s.setString(3, fecha);
                            s.setString(4, horario);
                            s.setString(5, path);
                            s.executeUpdate();
                            s.close();
                        } catch (SQLException e){
                            System.out.println("No se pudo completar la operación: " + e.getMessage());
                        }
                        finally { conn.close(); }
                    }                    
                        response.sendRedirect("admin-evento.jsp");
                } catch (SQLException e) {
                    System.out.println("No se pudo completar la operación: " + e.getMessage());
                }
            break;
            case "editar":
                try {                 
                    String id = request.getParameter("id");
                    String titulo = request.getParameter("titulo");
                    String descripcion = request.getParameter("descripcion"); 
                    String fecha = request.getParameter("dia") + "/" + request.getParameter("mes") + "/" + request.getParameter("anio");
                    String horario = request.getParameter("hora") + " - " + request.getParameter("hora2");
                    Part filePart = request.getPart("foto");                  
                    InputStream foto = filePart.getInputStream();                   
                    if (conn != null) {
                        try { 
                            String path = "Evento_" + id + ".jpg";
                            File uploads = new File(getServletContext().getInitParameter("upload.location") + "/eventos");
                            File file = new File(uploads, path);
                            InputStream input = foto;
                            Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);

                            String sql = "update evento set titulo = '" + titulo
                                    + "', descripcion = '" + descripcion
                                    + "', fecha = '" + fecha
                                    + "', horario = '" + horario
                                    + "', path = '" + path
                                    + "' where id = " + id;
                            Statement s = conn.createStatement();
                            s.executeUpdate(sql);
                            s.close();
                        } catch (SQLException e){
                            System.out.println("No se pudo completar la operación: " + e.getMessage());
                        }
                        finally { conn.close(); }
                    } 
                    response.sendRedirect("admin-evento.jsp");
                } catch (SQLException e) {
                    System.out.println("No se pudo completar la operación: " + e.getMessage());
                }
                break;
        }
                

        
    }
    protected void doGet (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        String text = request.getParameter("text");
        ControlEvento cEvento = new ControlEvento();
        
        switch (text) {
            case "img":
                try {
                    Conexion conexion = new Conexion();
                    Connection conn = conexion.Conexion();
                    int id = Integer.parseInt(request.getParameter("id"));
                    String sql = "select foto from evento where id = " + id;
                    Statement statement = conn.createStatement();
                    ResultSet rs = statement.executeQuery(sql);
                    while(rs.next()){
                        byte array[] = rs.getBytes(1);
                        response.setContentType("image/jpeg");
                        response.setContentLength(array.length);
                        response.getOutputStream().write(array);
                    }    
                } catch(SQLException e) {
                    e.printStackTrace();
                }
                
                
                break;
            case "editar":
                Evento evento = new Evento();
                try {
                    evento = cEvento.getEventoById(Integer.parseInt(request.getParameter("id")));
                    
                    request.setAttribute("id", evento.getId());
                    request.setAttribute("titulo", evento.getTitulo());
                    request.setAttribute("descripcion", evento.getDescripcion());
                    request.setAttribute("path", evento.getPath());                  
                    request.getRequestDispatcher("/publicar-evento.jsp?method=editar").forward(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(ServletNoticia.class.getName()).log(Level.SEVERE, null, ex);
                }
                break;
            case "eliminar":
                int id = Integer.parseInt(request.getParameter("id"));
                try {
                    String filePath = getServletContext().getInitParameter("upload.location") + "/eventos/" + cEvento.getPath(id);
                    File file = new File(filePath);
                    file.delete();
                    cEvento.deleteEvento(id);
                    response.sendRedirect("admin-evento.jsp");
                    
                } catch (SQLException e) {
                    System.out.println("No se encontró evento: " + e.getMessage());
                }   break;          
        }            
    }

}
