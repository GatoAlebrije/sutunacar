package classes;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/RegistrarUsuario")
@MultipartConfig(maxFileSize = 16177215)

public class RegistrarUsuario extends HttpServlet {
    @Override
    
    protected void doPost (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String method = request.getParameter("text");
        Conexion conexion = new Conexion();
        Connection conn = conexion.Conexion();
        
        // Datos personales
        String nombre = request.getParameter("nombre");
        String apeMaterno = request.getParameter("apeMaterno");
        String apePaterno = request.getParameter("apePaterno");
        DateFormat dateformat = new SimpleDateFormat("dd-MM-yyyy");
        String date = request.getParameter("dia") + "-" + request.getParameter("mes") + "-" + request.getParameter("anio");
        
        String calle = request.getParameter("calle");
        String numext = request.getParameter("ext");
        String numint = request.getParameter("int");
        String cruzamiento = request.getParameter("cruzamiento");
        String colonia = request.getParameter("colonia");
        String postal = request.getParameter("postal");
        String ciudad = request.getParameter("ciudad");
        
        //String pais = request.getParameter("pais");
        //String estado = request.getParameter("estado");
        String estadocivil = request.getParameter("estadocivil");
        String email = request.getParameter("email");
        String telefono = request.getParameter("celular");
        String telcasa = request.getParameter("telcasa");
        String rfc = request.getParameter("rfc");
        String curp = request.getParameter("curp");
        String nss = request.getParameter("nss");
        String sangre = request.getParameter("sangre");
                    
        // Datos laborales
        String num = request.getParameter("num");
        String horaentrada = request.getParameter("horaEntrada");
        String horasalida = request.getParameter("horaSalida");
        String horaentrada2 = request.getParameter("horaEntrada2");
        String horasalida2 = request.getParameter("horaSalida2");
        String date2 = request.getParameter("diaUni") + "-" + request.getParameter("mesUni") + "-" + request.getParameter("anioUni");
        String date3 = request.getParameter("diaSin") + "-" + request.getParameter("mesSin") + "-" + request.getParameter("anioSin");
        int area = Integer.parseInt(request.getParameter("area"));
        int puesto = Integer.parseInt(request.getParameter("puesto"));
        int categoria = Integer.parseInt(request.getParameter("categoria"));
        String profesion = request.getParameter("profesion");
        String ocupacion = request.getParameter("ocupacion");
                    
        // Escolaridad
        String grado = request.getParameter("grado");
        String otros = request.getParameter("otros");
                    
        // Referencia familiar
        String refnombre = request.getParameter("refnombre");
        String refmaterno = request.getParameter("refmaterno");
        String refpaterno = request.getParameter("refpaterno");
        String reftelefono = request.getParameter("reftelefono");
        String reftelcasa = request.getParameter("reftelcasa");
        //String refpais = request.getParameter("refpais");
        //String refestado = request.getParameter("refestado");
        String refciudad = request.getParameter("refciudad");
        String refcalle = request.getParameter("refcalle");
        String refext = request.getParameter("refext");
        String refint = request.getParameter("refint");
        String refcruzamiento = request.getParameter("refcruzamiento");
        String refcolonia = request.getParameter("refcolonia");
        String refpostal = request.getParameter("refpostal");
        String parentesco = request.getParameter("parentesco");
        Part filePart = request.getPart("foto");
        
        switch (method) {
            case "agregar":
                try {
                    Date fecha = new java.sql.Date(dateformat.parse(date).getTime());
                    Date fechaUni = new java.sql.Date(dateformat.parse(date2).getTime());
                    Date fechaSin = new java.sql.Date(dateformat.parse(date3).getTime());
                    String path = "";
                    // Guardar foto 
                    if (filePart.getSize() != 0) {
                        InputStream foto = filePart.getInputStream();
                        path = "Usuario_" + num + ".jpg";
                        File uploads = new File(getServletContext().getInitParameter("upload.location") + "/usuarios");
                        File file = new File(uploads, path);
                        InputStream input = foto;
                        Files.copy(input, file.toPath());
                    }
                    
                    
                    String sql = "insert into empleado ("
                            + "empleadoID,"
                            + "areaID,"
                            + "puestoID,"
                            + "nombre,"
                            + "apeMaterno,"
                            + "apePaterno,"
                            + "fecha_nacimiento,"
                            + "civil,"
                            
                            + "email,"
                            + "telefono,"
                            + "tel_casa,"
                            + "path_imagen,"
                            + "hora_entrada,"
                            + "hora_salida,"
                            + "segunda_entrada,"
                            + "segunda_salida,"
                            + "ingreso_uni,"
                            + "ingreso_sindicato,"
                            + "grado,"
                            + "otros,"
                            + "calle,"
                            + "numext,"
                            + "numint,"
                            + "cruzamiento,"
                            + "colonia,"
                            + "postal,"
                            + "ciudad,"
                            + "categoriaID) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                    PreparedStatement s = conn.prepareStatement(sql);
                    s.setString(1, num);
                    s.setInt(2, area);
                    s.setInt(3, puesto);
                    s.setString(4, nombre);
                    s.setString(5, apeMaterno);
                    s.setString(6, apePaterno);
                    s.setDate(7, fecha);
                    s.setString(8, estadocivil);
                    s.setString(9, email);
                    s.setString(10, telefono);
                    s.setString(11, telcasa);
                    s.setString(12, path);
                    s.setString(13, horaentrada);
                    s.setString(14, horasalida);
                    s.setString(15, horaentrada2);
                    s.setString(16, horasalida2);
                    s.setDate(17, fechaUni);
                    s.setDate(18, fechaSin);
                    s.setString(19, grado);
                    s.setString(20, otros);
                    s.setString(21, calle);
                    s.setString(22, numext);
                    s.setString(23, numint);
                    s.setString(24, cruzamiento);
                    s.setString(25, colonia);
                    s.setString(26, postal);
                    s.setString(27, ciudad);
                    s.setInt(28, categoria);
                    s.executeUpdate();
                    s.close();
                    sql = "insert into datogeneral ("
                            + "empleadoID,"
                            + "sangre,"
                            + "profesion,"
                            + "ocupacion,"
                            + "rfc,"
                            + "curp,"
                            + "nss) values (?,?,?,?,?,?,?)";
                    s = conn.prepareStatement(sql);
                    s.setString(1, num);
                    s.setString(2, sangre);
                    s.setString(3, profesion);
                    s.setString(4, ocupacion);
                    s.setString(5, rfc);
                    s.setString(6, curp);
                    s.setString(7, nss);
                    s.executeUpdate();
                    s.close();
                    
                    sql = "insert into referencia ("
                            + "empleadoID,"
                            + "nombre,"
                            + "apeMaterno,"
                            + "apePaterno,"
                            + "telefono,"
                            + "tel_casa,"
                            + "parentesco,"
                            + "calle,"
                            + "numext,"
                            + "numint,"
                            + "cruzamiento,"
                            + "colonia,"
                            + "postal,"
                            + "ciudad) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                    s = conn.prepareStatement(sql);
                    s.setString(1, num);
                    s.setString(2, refnombre);
                    s.setString(3, refmaterno);
                    s.setString(4, refpaterno);
                    s.setString(5, reftelefono);
                    s.setString(6, reftelcasa);
                    s.setString(7, parentesco);
                    s.setString(8, refcalle);
                    s.setString(9, refext);
                    s.setString(10, refint);
                    s.setString(11, refcruzamiento);
                    s.setString(12, refcolonia);
                    s.setString(13, refpostal);
                    s.setString(14, refciudad);
                    s.executeUpdate();
                    s.close();
                    
                    Password pass = new Password();
                    String passw = pass.getSaltedHash(num);
                    
                    sql = "insert into usuariorol(empleadoID, pass) values (?,?)";
                    s = conn.prepareStatement(sql);
                    s.setString(1, num);
                    s.setString(2, passw);
                    s.executeUpdate();
                    s.close();
                    conn.close();
                    
                    
                    
                    response.sendRedirect("admin-usuarios.jsp");
                } catch (SQLException e) {
                    System.out.println("No se pudo completar la operación: " + e.getMessage());
                } catch (ParseException ex) {
                    Logger.getLogger(ServletAsamblea.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(RegistrarUsuario.class.getName()).log(Level.SEVERE, null, ex);
                }
                break;
            case "editar":
                try {
                    int generalID = Integer.parseInt(request.getParameter("generalID"));
                    int referenciaID = Integer.parseInt(request.getParameter("refID")); // recuperar por jsp
                    Date fecha = new java.sql.Date(dateformat.parse(date).getTime());
                    Date fechaUni = new java.sql.Date(dateformat.parse(date2).getTime());
                    Date fechaSin = new java.sql.Date(dateformat.parse(date3).getTime());
                    String sql = "";
                    if (filePart.getSize() != 0) {
                                InputStream foto = filePart.getInputStream();
                                String path = "Usuario_" + num + ".jpg";
                                File uploads = new File(getServletContext().getInitParameter("upload.location") + "/usuarios");
                                File file = new File(uploads, path);
                                InputStream input = foto;
                                Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);

                                sql = "update empleado set path_imagen = ?" 
                                        + "where empleadoID = " + num;
                                PreparedStatement s = conn.prepareStatement(sql);
                                s.setString(1, path);
                                s.executeUpdate();
                                s.close();
                                
                    }
                    sql = "update empleado set " 
                            + "areaID = ?," 
                            + "puestoID = ?,"
                            + "nombre = ?,"
                            + "apeMaterno = ?,"
                            + "apePaterno = ?,"
                            + "fecha_nacimiento = ?,"
                            + "civil = ?,"
                            + "email = ?,"
                            + "telefono = ?,"
                            + "tel_casa = ?,"
                            + "hora_entrada = ?,"
                            + "hora_salida = ?,"
                            + "segunda_entrada = ?,"
                            + "segunda_salida = ?,"
                            + "ingreso_uni = ?,"
                            + "ingreso_sindicato = ?,"
                            + "grado = ?,"
                            + "otros = ?,"
                            + "calle = ?,"
                            + "numext = ?,"
                            + "numint = ?,"
                            + "cruzamiento = ?,"
                            + "colonia = ?,"
                            + "postal = ?,"
                            + "ciudad = ?,"
                            + "categoriaID = ? where empleadoID = " + num;
                    PreparedStatement s = conn.prepareStatement(sql);
                    s.setInt(1, area);
                    s.setInt(2, puesto);
                    s.setString(3, nombre);
                    s.setString(4, apeMaterno);
                    s.setString(5, apePaterno);
                    s.setDate(6, fecha);
                    s.setString(7, estadocivil);
                    s.setString(8, email);
                    s.setString(9, telefono);
                    s.setString(10, telcasa);
                    s.setString(11, horaentrada);
                    s.setString(12, horasalida);
                    s.setString(13, horaentrada2);
                    s.setString(14, horasalida2);
                    s.setDate(15, fechaUni);
                    s.setDate(16, fechaSin);
                    s.setString(17, grado);
                    s.setString(18, otros);
                    s.setString(19, calle);
                    s.setString(20, numext);
                    s.setString(21, numint);
                    s.setString(22, cruzamiento);
                    s.setString(23, colonia);
                    s.setString(24, postal);
                    s.setString(25, ciudad);
                    s.setInt(26, categoria);
                    
                    
                    s.executeUpdate();
                    s.close();
                    
                    sql = "update datogeneral set "
                            + "sangre = ?,"
                            + "profesion = ?,"
                            + "ocupacion = ?,"
                            + "rfc = ?,"
                            + "curp = ?,"
                            + "nss = ? "
                            + "where generalID = " + generalID;
                    s = conn.prepareStatement(sql);
                    s.setString(1, sangre);
                    s.setString(2, profesion);
                    s.setString(3, ocupacion);
                    s.setString(4, rfc);
                    s.setString(5, curp);
                    s.setString(6, nss);
                    s.executeUpdate();
                    s.close();
                    
                    sql = "update referencia set "
                            + "nombre = ?,"
                            + "apeMaterno = ?,"
                            + "apePaterno = ?,"
                            + "telefono = ?,"
                            + "tel_casa = ?,"
                            + "parentesco = ?,"
                            + "calle = ?,"
                            + "numext = ?,"
                            + "numint = ?,"
                            + "cruzamiento = ?,"
                            + "colonia = ?,"
                            + "postal = ?,"
                            + "ciudad = ? "
                            + "where referenciaID = " + referenciaID;
                    s = conn.prepareStatement(sql);
                    s.setString(1, refnombre);
                    s.setString(2, refmaterno);
                    s.setString(3, refpaterno);
                    s.setString(4, reftelefono);
                    s.setString(5, reftelcasa);
                    s.setString(6, parentesco);
                    s.setString(7, refcalle);
                    s.setString(8, refext);
                    s.setString(9, refint);
                    s.setString(10, refcruzamiento);
                    s.setString(11, refcolonia);
                    s.setString(12, refpostal);
                    s.setString(13, refciudad);
                    s.executeUpdate();
                    
                    
                    s.close();
                    conn.close(); 
                } catch (SQLException e){
                            System.out.println("No se pudo completar la operación: " + e.getMessage());
                } catch (ParseException ex) {
                    Logger.getLogger(ServletAsamblea.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                response.sendRedirect("ServletUsuario?num=" + num); 
                break;
        }
    }
    
    protected void doGet (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        String text = request.getParameter("text");
        Conexion conexion = new Conexion();
        Connection conn = conexion.Conexion();
        String id = request.getParameter("id");
        switch (text) {
            case "editar":
                try {
                    String sql = "select * from empleado where empleadoID = " + id;
                    Statement s = conn.createStatement();
                    ResultSet rs = s.executeQuery(sql);
                    if (rs.next()) {
                        request.setAttribute("id", rs.getString("empleadoID"));
                        request.setAttribute("areaID", rs.getInt("areaID"));
                        request.setAttribute("puestoID", rs.getInt("puestoID"));
                        request.setAttribute("categoriaID", rs.getInt("categoriaID"));
                        request.setAttribute("estatusID", rs.getInt("estatusID"));
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
                        request.setAttribute("postal", rs.getInt("postal"));
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
                    }
                    s.close();    
                    sql = "select * from datogeneral where empleadoID = " + id;
                    s = conn.createStatement();
                    rs = s.executeQuery(sql);
                    if (rs.next()) {
                        request.setAttribute("generalID", rs.getInt("generalID"));
                        request.setAttribute("sangre", rs.getString("sangre"));
                        request.setAttribute("profesion", rs.getString("profesion"));
                        request.setAttribute("ocupacion", rs.getString("ocupacion"));
                        request.setAttribute("rfc", rs.getString("rfc"));
                        request.setAttribute("curp", rs.getString("curp"));
                        request.setAttribute("nss", rs.getString("nss"));
                    }
                    s.close();
                    sql = "select * from referencia where empleadoID = " + id;
                    s = conn.createStatement();
                    rs = s.executeQuery(sql);
                    if (rs.last()) {
                        request.setAttribute("refID", rs.getInt("referenciaID"));
                        request.setAttribute("refnombre", rs.getString("nombre"));
                        request.setAttribute("refmaterno", rs.getString("apeMaterno"));
                        request.setAttribute("refpaterno", rs.getString("apePaterno"));
                        request.setAttribute("reftel", rs.getString("telefono"));
                        request.setAttribute("refcasa", rs.getString("tel_casa"));
                        request.setAttribute("refcalle", rs.getString("calle"));
                        request.setAttribute("refext", rs.getString("numext"));
                        request.setAttribute("refint", rs.getString("numint"));
                        request.setAttribute("refcruzamiento", rs.getString("cruzamiento"));
                        request.setAttribute("refcolonia", rs.getString("colonia"));
                        request.setAttribute("refpostal", rs.getString("postal"));
                        request.setAttribute("refciudad", rs.getString("ciudad"));
                        //request.setAttribute("refpais", rs.getString("pais"));
                        //request.setAttribute("refestado", rs.getString("estado"));
                        request.setAttribute("parentesco", rs.getString("parentesco"));
                    }
                    s.close();
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ServletNoticia.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher("/registrar.jsp?method=editar").forward(request, response);
                break;
            case "agregarReferencia":
                try {
                    String sql = "insert into referencia ("
                            + "empleadoID,"
                            + "nombre,"
                            + "apeMaterno,"
                            + "apePaterno,"
                            + "telefono,"
                            + "tel_casa,"
                            //+ "pais,"
                            //+ "estado,"
                            + "parentesco,"
                            + "calle,"
                            + "numext,"
                            + "numint,"
                            + "cruzamiento,"
                            + "colonia,"
                            + "postal,"
                            + "ciudad) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                    PreparedStatement s = conn.prepareStatement(sql);
                    s.setString(1, request.getParameter("empleadoID"));
                    s.setString(2, request.getParameter("refnombre"));
                    s.setString(3, request.getParameter("refmaterno"));
                    s.setString(4, request.getParameter("refpaterno"));
                    s.setString(5, request.getParameter("reftelefono"));
                    s.setString(6, request.getParameter("reftelcasa"));
                    //s.setString(7, request.getParameter("refpais"));
                    //s.setString(8, request.getParameter("refestado"));
                    s.setString(7, request.getParameter("parentesco"));
                    s.setString(8, request.getParameter("refcalle"));
                    s.setString(9, request.getParameter("refext"));
                    s.setString(10, request.getParameter("refint"));
                    s.setString(11, request.getParameter("refcruzamiento"));
                    s.setString(12, request.getParameter("refcolonia"));
                    s.setString(13, request.getParameter("refpostal"));
                    s.setString(14, request.getParameter("refciudad"));
                    s.executeUpdate();
                    s.close();
                    conn.close();
                    response.sendRedirect("ServletUsuario?num=" + request.getParameter("empleadoID"));
                } catch (SQLException e){
                            System.out.println("No se pudo completar la operación: " + e.getMessage());
                }
                break;
            case "agregarBeneficiario":
                
                try {
                    String sql = "insert into beneficiario("
                            + "empleadoID,"
                            + "nombre,"
                            + "apeMaterno,"
                            + "apePaterno,"
                            + "porcentaje,"
                            + "parentesco,"
                            + "comentarios,"
                            + "telefono,"
                            + "tel_casa,"
                            + "calle,"
                            + "numext,"
                            + "numint,"
                            + "cruzamiento,"
                            + "postal,"
                            + "colonia,"
                            + "ciudad) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                            //+ "estado,"
                            //+ "pais) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                          
                    PreparedStatement s = conn.prepareStatement(sql);
                    s.setString(1, request.getParameter("empleadoID"));
                    s.setString(2, request.getParameter("refnombre"));
                    s.setString(3, request.getParameter("refmaterno"));
                    s.setString(4, request.getParameter("refpaterno"));
                    s.setString(5, request.getParameter("porcentaje"));
                    s.setString(6, request.getParameter("parentesco"));
                    s.setString(7, request.getParameter("comentarios"));
                    s.setString(8, request.getParameter("reftelefono"));
                    s.setString(9, request.getParameter("reftelcasa"));
                    s.setString(10, request.getParameter("refcalle"));
                    s.setString(11, request.getParameter("refext"));
                    s.setString(12, request.getParameter("refint"));
                    s.setString(13, request.getParameter("refcruzamiento"));
                    s.setString(14, request.getParameter("refpostal"));
                    s.setString(15, request.getParameter("refcolonia"));
                    s.setString(16, request.getParameter("refciudad"));
                    //s.setString(17, request.getParameter("refestado"));
                    //s.setString(18, request.getParameter("refpais"));
                    s.executeUpdate();
                    s.close();
                    conn.close();
                    response.sendRedirect("ServletUsuario?num=" + request.getParameter("empleadoID"));
                } catch (SQLException e){
                    System.out.println("No se pudo completar la operación: " + e.getMessage());
                }
                break;
            case "editarReferencia":
                int referenciaID = Integer.parseInt(request.getParameter("id"));
                try {
                    String sql = "update referencia set "
                            + "empleadoID = ?,"
                            + "nombre = ?,"
                            + "apeMaterno = ?,"
                            + "apePaterno = ?,"
                            + "telefono = ?,"
                            + "tel_casa = ?,"
                            //+ "pais = ?,"
                            //+ "estado = ?,"
                            + "parentesco = ?,"
                            + "calle = ?,"
                            + "numext = ?,"
                            + "numint = ?,"
                            + "cruzamiento = ?,"
                            + "colonia = ?,"
                            + "postal = ?,"
                            + "ciudad = ? where referenciaID = ?";
                    PreparedStatement s = conn.prepareStatement(sql);
                    s.setString(1, request.getParameter("empleadoID"));
                    s.setString(2, request.getParameter("refnombre"));
                    s.setString(3, request.getParameter("refmaterno"));
                    s.setString(4, request.getParameter("refpaterno"));
                    s.setString(5, request.getParameter("reftelefono"));
                    s.setString(6, request.getParameter("reftelcasa"));
                    //s.setString(7, request.getParameter("refpais"));
                    //s.setString(8, request.getParameter("refestado"));
                    s.setString(7, request.getParameter("parentesco"));
                    s.setString(8, request.getParameter("refcalle"));
                    s.setString(9, request.getParameter("refext"));
                    s.setString(10, request.getParameter("refint"));
                    s.setString(11, request.getParameter("refcruzamiento"));
                    s.setString(12, request.getParameter("refcolonia"));
                    s.setString(13, request.getParameter("refpostal"));
                    s.setString(14, request.getParameter("refciudad"));
                    s.setInt(15, referenciaID);
                    s.executeUpdate();
                    s.close();
                    conn.close();
                    response.sendRedirect("ServletUsuario?num=" + request.getParameter("empleadoID"));
                } catch (SQLException e) {
                    System.out.println("No se pudo completar la operación: " + e.getMessage());
                }
                break;
            case "editarBeneficiario":
                  
                int beneficiarioID = Integer.parseInt(request.getParameter("id"));
                try {
                    String sql = "update beneficiario set "
                            + "nombre = ?,"
                            + "apeMaterno = ?,"
                            + "apePaterno = ?,"
                            + "porcentaje = ?,"
                            + "parentesco = ?,"
                            + "comentarios = ?,"
                            + "telefono = ?,"
                            + "tel_casa = ?,"
                            + "calle = ?,"
                            + "numext = ?,"
                            + "numint = ?,"
                            + "cruzamiento = ?,"
                            + "postal = ?,"
                            + "ciudad = ?,"
                            //+ "estado = ?,"
                            //+ "pais = ?,"
                            + "colonia = ?"
                            + " where beneficiarioID = ?";
                          
                    PreparedStatement s = conn.prepareStatement(sql);
                    s.setString(1, request.getParameter("refnombre"));
                    s.setString(2, request.getParameter("refmaterno"));
                    s.setString(3, request.getParameter("refpaterno"));
                    s.setString(4, request.getParameter("porcentaje"));
                    s.setString(5, request.getParameter("parentesco"));
                    s.setString(6, request.getParameter("comentarios"));
                    s.setString(7, request.getParameter("reftelefono"));
                    s.setString(8, request.getParameter("reftelcasa"));
                    s.setString(9, request.getParameter("refcalle"));
                    s.setString(10, request.getParameter("refext"));
                    s.setString(11, request.getParameter("refint"));
                    s.setString(12, request.getParameter("refcruzamiento"));
                    s.setString(13, request.getParameter("refpostal"));
                    s.setString(14, request.getParameter("refciudad"));
                    //s.setString(15, request.getParameter("refestado"));
                    //s.setString(16, request.getParameter("refpais"));
                    s.setString(15, request.getParameter("refcolonia"));
                    s.setInt(16, beneficiarioID);
                    s.executeUpdate();
                    s.close();
                    conn.close();
                    response.sendRedirect("ServletUsuario?num=" + request.getParameter("empleadoID"));
                } catch (SQLException e){
                    System.out.println("No se pudo completar la operación: " + e.getMessage());
                }
                break;
            case "eliminarReferencia":
                referenciaID = Integer.parseInt(request.getParameter("id"));
                try {
                Statement s = conn.createStatement();                  
                s.executeUpdate("delete from referencia where referenciaID = " + referenciaID);
                s.close();
                conn.close();
                response.sendRedirect("ServletUsuario?num=" + request.getParameter("empleadoID"));
                } catch (SQLException e) {
                    System.out.println("No se encontró referencia: " + e.getMessage());
                }
                break;
            case "eliminarBeneficiario":
                beneficiarioID = Integer.parseInt(request.getParameter("id"));
                try {
                Statement s = conn.createStatement();                  
                s.executeUpdate("delete from beneficiario where beneficiarioID = " + beneficiarioID);
                s.close();
                conn.close();
                response.sendRedirect("ServletUsuario?num=" + request.getParameter("empleadoID"));
                } catch (SQLException e) {
                    System.out.println("No se encontró beneficiario: " + e.getMessage());
                }
                break;
            case "admin":
                String empleadoID = request.getParameter("id");
                String op = request.getParameter("op");
                String sql = "";
                Statement s;
                
                try {
                    s = conn.createStatement();
                    if(op.equals("agregar")) {
                        sql = "update usuariorol set rolID = 1 where empleadoID = " + empleadoID;
                        s.executeUpdate(sql);
                    }
                    else {
                        sql = "update usuariorol set rolID = 2 where empleadoID = " + empleadoID;
                        s.executeUpdate(sql);
                    }
                    s.close();
                    conn.close();
                } catch (SQLException e) {
                        e.printStackTrace();
                }
                response.sendRedirect("ServletUsuario?num=" + empleadoID);
                break;
                
            case "estatus":
                empleadoID = request.getParameter("id");
                op = request.getParameter("op");
                sql = "";
                
                
                try {
                    s = conn.createStatement();
                    if(op.equals("agregar")) {
                        sql = "update empleado set estatusID = 1 where empleadoID = " + empleadoID;
                        s.executeUpdate(sql);
                    }
                    else {
                        sql = "update empleado set estatusID = 2 where empleadoID = " + empleadoID;
                        s.executeUpdate(sql);
                    }
                    s.close();
                    conn.close();
                } catch (SQLException e) {
                        e.printStackTrace();
                }
                response.sendRedirect("ServletUsuario?num=" + empleadoID);
                break;
            case "jubilacion":
                empleadoID = request.getParameter("id");
                op = request.getParameter("op");
                sql = "";
                
                
                try {
                    s = conn.createStatement();
                    if(op.equals("agregar")) {
                        sql = "update empleado set jubilacion = 'true' where empleadoID = " + empleadoID;
                        s.executeUpdate(sql);
                    }
                    else {
                        sql = "update empleado set jubilacion = 'false' where empleadoID = " + empleadoID;
                        s.executeUpdate(sql);
                    }
                    s.close();
                    conn.close();
                } catch (SQLException e) {
                        e.printStackTrace();
                }
                response.sendRedirect("ServletUsuario?num=" + empleadoID);
                break;
                      
        }
       
    }

}
