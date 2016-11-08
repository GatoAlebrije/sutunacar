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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/ServletNoticia")
@MultipartConfig(maxFileSize = 16177215)


public class ServletNoticia extends HttpServlet {
    @Override
    
    protected void doPost (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String method = request.getParameter("text");
        Conexion conexion = new Conexion();
        Connection conn = conexion.Conexion();
        switch (method) {
            case "agregar":
                try {
                    ControlNoticia c = new ControlNoticia();
                    String titulo = request.getParameter("titulo");
                    String descripcion = request.getParameter("descripcion"); 
                    Part filePart = request.getPart("foto");                  
                    InputStream foto = filePart.getInputStream();                   
                    if (conn != null) {
                        try { 
                    
                            String path = "Noticia_" + c.getLastId() + ".jpg";
                            File uploads = new File(getServletContext().getInitParameter("upload.location") + "/noticias");
                            File file = new File(uploads, path);
                            InputStream input = foto;
                            Files.copy(input, file.toPath());
                    
                            String sql = "insert into noticia (titulo, descripcion, path) values (?,?,?)";
                            PreparedStatement s = conn.prepareStatement(sql);
                            s.setString(1, titulo);
                            s.setString(2, descripcion);
                            s.setString(3, path);

                            s.executeUpdate();
                            s.close();
                        } catch (SQLException e){
                            System.out.println("No se pudo completar la operación: " + e.getMessage());
                        }
                        finally { conn.close(); }
                    } 
                    response.sendRedirect("admin-noticia.jsp");
                } catch (SQLException e) {
                    System.out.println("No se pudo completar la operación: " + e.getMessage());
                }
                break;
            case "editar":
                try {                 
                    String id = request.getParameter("id");
                    String titulo = request.getParameter("titulo");
                    String descripcion = request.getParameter("descripcion");
                    Part filePart = request.getPart("foto");
                                      
                                     
                    if (conn != null) {
                        try { 
                            String sql = "";        
                            if (filePart.getSize() != 0) {
                                InputStream foto = filePart.getInputStream();
                                String path = "Noticia_" + id + ".jpg";
                                File uploads = new File(getServletContext().getInitParameter("upload.location") + "/noticias");
                                File file = new File(uploads, path);
                                InputStream input = foto;
                                Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);

                                sql = "update noticia set titulo = '" + titulo
                                        + "', descripcion = '" + descripcion
                                        + "', path = '" + path
                                        + "' where id = " + id;
                            }
                            else {
                                sql = "update noticia set titulo = '" + titulo
                                        + "', descripcion = '" + descripcion
                                        + "' where id = " + id;
                            }
                            
                            Statement s = conn.createStatement();
                            s.executeUpdate(sql);
                            s.close();
                            s.close();
                        } catch (SQLException e){
                            System.out.println("No se pudo completar la operación: " + e.getMessage());
                        }
                        finally { conn.close(); }
                    } 
                    response.sendRedirect("admin-noticia.jsp");
                } catch (SQLException e) {
                    System.out.println("No se pudo completar la operación: " + e.getMessage());
                }
                break;
                
        }
            
                    
        
    }
    protected void doGet (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        String text = request.getParameter("text");
        ControlNoticia cNoticia = new ControlNoticia();
        
        switch (text) {
            case "img":
                Conexion conexion = new Conexion();
                Connection conn = conexion.Conexion();
                try {
                    
                    int id = Integer.parseInt(request.getParameter("id"));
                    String sql = "select foto from noticia where id = " + id;
                    Statement s = conn.createStatement();
                    ResultSet rs = s.executeQuery(sql);
                    while(rs.next()){
                        byte array[] = rs.getBytes(1);
                        response.setContentType("image/jpeg");
                        response.setContentLength(array.length);
                        response.getOutputStream().write(array);
                    }    
                    s.close();
                    conn.close();     
                } catch(SQLException e) {
                    e.printStackTrace();
                } 
            
            
                
                
                break;
            case "editar":
                Noticia noticia = new Noticia();
                try {
                    noticia = cNoticia.getNoticiaById(Integer.parseInt(request.getParameter("id")));
                    
                    request.setAttribute("id", noticia.getId());
                    request.setAttribute("titulo", noticia.getTitulo());
                    request.setAttribute("descripcion", noticia.getDescripcion());
                    request.setAttribute("path", noticia.getPath());                  
                    request.getRequestDispatcher("/publicar-noticia.jsp?method=editar").forward(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(ServletNoticia.class.getName()).log(Level.SEVERE, null, ex);
                }
                break;
            case "eliminar":
                int id = Integer.parseInt(request.getParameter("id"));
                try {
                    
                    String filePath = getServletContext().getInitParameter("upload.location") + "/noticias/" + cNoticia.getPath(id);
                    File file = new File(filePath);
                    file.delete();
                    cNoticia.deleteNoticia(id);
                    response.sendRedirect("admin-noticia.jsp");
                    
                } catch (SQLException e) {
                    System.out.println("No se encontró noticia: " + e.getMessage());
                }   break;   
                
            case "noticia":
                int page = 1;
                int recordsPerPage = 5;
                
                if(request.getParameter("page") != null)
                        page = Integer.parseInt(request.getParameter("page"));
                NoticiasDAO dao = new NoticiasDAO();
                List<Noticia> list = dao.consultaNoticia((page-1)*recordsPerPage, recordsPerPage);
                int numRecord = dao.getNumRecord();
                int numPages = (int) Math.ceil(numRecord * 1.0 / recordsPerPage);
                request.setAttribute("noticiaList", list);
                request.setAttribute("numPages", numPages);
                request.setAttribute("currentpage", page);
                RequestDispatcher view = request.getRequestDispatcher("index.jsp");
                view.forward(request, response);
                break;
        }
    }

}
