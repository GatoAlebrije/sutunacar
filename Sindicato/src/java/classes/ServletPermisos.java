package classes;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.joda.time.DateTime;
import org.joda.time.Days;



@WebServlet("/ServletPermisos")

public class ServletPermisos extends HttpServlet {
    
    @Override
    protected void doPost (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String text = request.getParameter("text");
        HttpSession session = request.getSession(true);
        Conexion conexion = new Conexion();
        Connection conn = conexion.Conexion();
        switch (text) {
            case "permiso":
                try {
                    
                    String id = session.getAttribute("empleadoID").toString();
                    String nombre = session.getAttribute("nombre").toString();
                    String area = session.getAttribute("area").toString();
                    String puesto = session.getAttribute("puesto").toString();
                    String email = session.getAttribute("email").toString();
                    DateFormat dateformat = new SimpleDateFormat("dd-MM-yyyy");
                    String date = request.getParameter("dia") + "-" + request.getParameter("mes") + "-" + request.getParameter("anio");
                    Date fecha = new java.sql.Date(dateformat.parse(date).getTime());
                    DateFormat dateformat2 = new SimpleDateFormat("dd-MM-yyyy");
                    String date2 = request.getParameter("dia2") + "-" + request.getParameter("mes2") + "-" + request.getParameter("anio2");
                    Date fecha2 = new java.sql.Date(dateformat2.parse(date2).getTime());
                    String motivo = request.getParameter("motivo"); 
                    String tipo = request.getParameter("tipo");
                    DateTime dt = new DateTime(fecha);
                    DateTime dt2 = new DateTime(fecha2);
                    int dias = Days.daysBetween(dt, dt2).getDays() + 1;
                    
                    try { 
                    
                    
                            String sql = "insert into permiso (empleadoID, tipo, fecha_inicio, fecha_fin, motivo, dias) values (?,?,?,?,?,?)";
                            PreparedStatement s = conn.prepareStatement(sql);
                            s.setString(1, id);
                            s.setString(2, tipo);
                            s.setDate(3, fecha);
                            s.setDate(4, fecha2);
                            s.setString(5, motivo);
                            s.setInt(6, dias);

                            s.executeUpdate();
                            s.close();
                        } catch (SQLException e){
                            System.out.println("No se pudo completar la operación: " + e.getMessage());
                        }
                        finally { conn.close(); }
                    
                    
                    
                    
                    
                    // Editando archivo excel
                    
                    // Reading and rewriting workbooks
            //InputStream inp = new FileInputStream("ejemplo.xls");
            InputStream inp = new FileInputStream(getServletContext().getInitParameter("permisos") + "/solicitud.xlsx");

            XSSFWorkbook wb = new XSSFWorkbook(inp);
            XSSFSheet sheet = wb.getSheetAt(0);
            Cell cell = null;
            //Retrieve the row and check for null
            
            //  ----------- FECHA ------------------------------
            XSSFRow sheetrow = sheet.getRow(7);
            if(sheetrow == null){
                sheetrow = sheet.createRow(7);
            }
            cell = sheetrow.getCell(6);
            if(cell == null){
                cell = sheetrow.createCell(6);
            }
            CreationHelper createHelper = wb.getCreationHelper();
            CellStyle cellStyle = wb.createCellStyle();
                cellStyle.setDataFormat(
                    createHelper.createDataFormat().getFormat("d/m/yy"));
            cell.setCellValue(Calendar.getInstance());
            cell.setCellStyle(cellStyle);
            
            // --------- Número de empleado ---------------------
            sheetrow = sheet.getRow(8);
            if(sheetrow == null){
                sheetrow = sheet.createRow(8);
            }
            cell = sheetrow.getCell(7);
            if(cell == null){
                cell = sheetrow.createCell(7);
            }
            cell.setCellValue(id);
            
            // ---------- Nombre de quien soicita ------------------
            sheetrow = sheet.getRow(9);
            if(sheetrow == null){
                sheetrow = sheet.createRow(9);
            }
            cell = sheetrow.getCell(3);
            if(cell == null){
                cell = sheetrow.createCell(3);
            }
            cell.setCellValue(nombre);
            
            // ---------- Dependencia -----------------------------
            sheetrow = sheet.getRow(10);
            if(sheetrow == null){
                sheetrow = sheet.createRow(10);
            }
            cell = sheetrow.getCell(2);
            if(cell == null){
                cell = sheetrow.createCell(2);
            }
            cell.setCellValue(area);
            
            // ---------- Puesto -----------------------------
            sheetrow = sheet.getRow(11);
            if(sheetrow == null){
                sheetrow = sheet.createRow(11);
            }
            cell = sheetrow.getCell(1);
            if(cell == null){
                cell = sheetrow.createCell(1);
            }
            cell.setCellValue(puesto);
            
            // ---------- Correo electrónico -----------------------------
            sheetrow = sheet.getRow(11);
            if(sheetrow == null){
                sheetrow = sheet.createRow(11);
            }
            cell = sheetrow.getCell(6);
            if(cell == null){
                cell = sheetrow.createCell(6);
            }
            cell.setCellValue(email);
            
            // ---------- Motivo del permiso  -----------------------------
            sheetrow = sheet.getRow(17);
            if(sheetrow == null){
                sheetrow = sheet.createRow(17);
            }
            cell = sheetrow.getCell(3);
            if(cell == null){
                cell = sheetrow.createCell(3);
            }
            cell.setCellValue(motivo);
            
            
            //  ----------- Fecha inicio ------------------------------
            sheetrow = sheet.getRow(22);
            if(sheetrow == null){
                sheetrow = sheet.createRow(22);
            }
            cell = sheetrow.getCell(2);
            if(cell == null){
                cell = sheetrow.createCell(2);
            }
            cell.setCellValue(fecha);
            cell.setCellStyle(cellStyle);
            
            //  ----------- Fecha fin ------------------------------
            sheetrow = sheet.getRow(22);
            if(sheetrow == null){
                sheetrow = sheet.createRow(22);
            }
            cell = sheetrow.getCell(6);
            if(cell == null){
                cell = sheetrow.createCell(6);
            }
            cell.setCellValue(fecha2);
            cell.setCellStyle(cellStyle);
            
            // ---------- Dias solicitado -----------------------------
            sheetrow = sheet.getRow(24);
            if(sheetrow == null){
                sheetrow = sheet.createRow(24);
            }
            cell = sheetrow.getCell(5);
            if(cell == null){
                cell = sheetrow.createCell(5);
            }
            cell.setCellValue(dias);
            
            
            // ---------- Causa o motivo de licencia -----------------------------
            sheetrow = sheet.getRow(37);
            if(sheetrow == null){
                sheetrow = sheet.createRow(37);
            }
            cell = sheetrow.getCell(3);
            if(cell == null){
                cell = sheetrow.createCell(3);
            }
            cell.setCellValue("");
            
            //  ----------- (Licencia) Fecha inicio ------------------------------
            sheetrow = sheet.getRow(41);
            if(sheetrow == null){
                sheetrow = sheet.createRow(41);
            }
            cell = sheetrow.getCell(2);
            if(cell == null){
                cell = sheetrow.createCell(2);
            }
            cell.setCellValue("");
            cell.setCellStyle(cellStyle);
            
            //  ----------- (Licencia) Fecha fin ------------------------------
            sheetrow = sheet.getRow(41);
            if(sheetrow == null){
                sheetrow = sheet.createRow(41);
            }
            cell = sheetrow.getCell(6);
            if(cell == null){
                cell = sheetrow.createCell(6);
            }
            cell.setCellValue("");
            cell.setCellStyle(cellStyle);
    
    
            
            
            
            // Write the output to a file
            FileOutputStream fileOut = new FileOutputStream(getServletContext().getInitParameter("permisos") + "/solicitud_" + id + ".xlsx");
            wb.write(fileOut);
            fileOut.close();
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    response.sendRedirect("descargarpermiso.jsp");
                } catch (SQLException e) {
                    System.out.println("No se pudo completar la operación: " + e.getMessage());
                } catch (ParseException ex) {
                    Logger.getLogger(ServletEconomico.class.getName()).log(Level.SEVERE, null, ex);
                }
                break;
                
            case "licencia":
                try {
                    
                    String id = session.getAttribute("empleadoID").toString();
                    String nombre = session.getAttribute("nombre").toString();
                    String area = session.getAttribute("area").toString();
                    String puesto = session.getAttribute("puesto").toString();
                    String email = session.getAttribute("email").toString();
                    DateFormat dateformat = new SimpleDateFormat("dd-MM-yyyy");
                    String date = request.getParameter("dia") + "-" + request.getParameter("mes") + "-" + request.getParameter("anio");
                    Date fecha = new java.sql.Date(dateformat.parse(date).getTime());
                    DateFormat dateformat2 = new SimpleDateFormat("dd-MM-yyyy");
                    String date2 = request.getParameter("dia2") + "-" + request.getParameter("mes2") + "-" + request.getParameter("anio2");
                    Date fecha2 = new java.sql.Date(dateformat2.parse(date2).getTime());
                    String motivo = request.getParameter("motivo"); 
                    String tipo = request.getParameter("tipo");
                    DateTime dt = new DateTime(fecha);
                    DateTime dt2 = new DateTime(fecha);
                    int dias = Days.daysBetween(dt, dt2).getDays() + 1;
                    
                    try { 
                    
                    
                            String sql = "insert into licencia (empleadoID, tipo, fecha_inicio, fecha_fin, motivo, dias) values (?,?,?,?,?,?)";
                            PreparedStatement s = conn.prepareStatement(sql);
                            s.setString(1, id);
                            s.setString(2, tipo);
                            s.setDate(3, fecha);
                            s.setDate(4, fecha2);
                            s.setString(5, motivo);
                            s.setInt(6, dias);

                            s.executeUpdate();
                            s.close();
                        } catch (SQLException e){
                            System.out.println("No se pudo completar la operación: " + e.getMessage());
                        }
                        finally { conn.close(); }
                    
                    
                    
                    
                    
                    // Editando archivo excel
                    
                    // Reading and rewriting workbooks
            //InputStream inp = new FileInputStream("ejemplo.xls");
            InputStream inp = new FileInputStream(getServletContext().getInitParameter("permisos") + "/solicitud.xlsx");

            XSSFWorkbook wb = new XSSFWorkbook(inp);
            XSSFSheet sheet = wb.getSheetAt(0);
            Cell cell = null;
            //Retrieve the row and check for null
            
            //  ----------- FECHA ------------------------------
            XSSFRow sheetrow = sheet.getRow(7);
            if(sheetrow == null){
                sheetrow = sheet.createRow(7);
            }
            cell = sheetrow.getCell(6);
            if(cell == null){
                cell = sheetrow.createCell(6);
            }
            CreationHelper createHelper = wb.getCreationHelper();
            CellStyle cellStyle = wb.createCellStyle();
                cellStyle.setDataFormat(
                    createHelper.createDataFormat().getFormat("d/m/yy"));
            cell.setCellValue(Calendar.getInstance());
            cell.setCellStyle(cellStyle);
            
            // --------- Número de empleado ---------------------
            sheetrow = sheet.getRow(8);
            if(sheetrow == null){
                sheetrow = sheet.createRow(8);
            }
            cell = sheetrow.getCell(7);
            if(cell == null){
                cell = sheetrow.createCell(7);
            }
            cell.setCellValue(id);
            
            // ---------- Nombre de quien soicita ------------------
            sheetrow = sheet.getRow(9);
            if(sheetrow == null){
                sheetrow = sheet.createRow(9);
            }
            cell = sheetrow.getCell(3);
            if(cell == null){
                cell = sheetrow.createCell(3);
            }
            cell.setCellValue(nombre);
            
            // ---------- Dependencia -----------------------------
            sheetrow = sheet.getRow(10);
            if(sheetrow == null){
                sheetrow = sheet.createRow(10);
            }
            cell = sheetrow.getCell(2);
            if(cell == null){
                cell = sheetrow.createCell(2);
            }
            cell.setCellValue(area);
            
            // ---------- Puesto -----------------------------
            sheetrow = sheet.getRow(11);
            if(sheetrow == null){
                sheetrow = sheet.createRow(11);
            }
            cell = sheetrow.getCell(1);
            if(cell == null){
                cell = sheetrow.createCell(1);
            }
            cell.setCellValue(puesto);
            
            // ---------- Correo electrónico -----------------------------
            sheetrow = sheet.getRow(11);
            if(sheetrow == null){
                sheetrow = sheet.createRow(11);
            }
            cell = sheetrow.getCell(6);
            if(cell == null){
                cell = sheetrow.createCell(6);
            }
            cell.setCellValue(email);
            
            // ---------- Motivo del permiso  -----------------------------
            sheetrow = sheet.getRow(17);
            if(sheetrow == null){
                sheetrow = sheet.createRow(17);
            }
            cell = sheetrow.getCell(3);
            if(cell == null){
                cell = sheetrow.createCell(3);
            }
            cell.setCellValue("");
            
            
            //  ----------- Fecha inicio ------------------------------
            sheetrow = sheet.getRow(22);
            if(sheetrow == null){
                sheetrow = sheet.createRow(22);
            }
            cell = sheetrow.getCell(2);
            if(cell == null){
                cell = sheetrow.createCell(2);
            }
            cell.setCellValue("");
            cell.setCellStyle(cellStyle);
            
            //  ----------- Fecha fin ------------------------------
            sheetrow = sheet.getRow(22);
            if(sheetrow == null){
                sheetrow = sheet.createRow(22);
            }
            cell = sheetrow.getCell(6);
            if(cell == null){
                cell = sheetrow.createCell(6);
            }
            cell.setCellValue("");
            cell.setCellStyle(cellStyle);
            
            // ---------- Dias solicitado -----------------------------
            sheetrow = sheet.getRow(24);
            if(sheetrow == null){
                sheetrow = sheet.createRow(24);
            }
            cell = sheetrow.getCell(5);
            if(cell == null){
                cell = sheetrow.createCell(5);
            }
            cell.setCellValue("");
            
            
            // ---------- Causa o motivo de licencia -----------------------------
            sheetrow = sheet.getRow(37);
            if(sheetrow == null){
                sheetrow = sheet.createRow(37);
            }
            cell = sheetrow.getCell(3);
            if(cell == null){
                cell = sheetrow.createCell(3);
            }
            cell.setCellValue(motivo);
            
            //  ----------- (Licencia) Fecha inicio ------------------------------
            sheetrow = sheet.getRow(41);
            if(sheetrow == null){
                sheetrow = sheet.createRow(41);
            }
            cell = sheetrow.getCell(2);
            if(cell == null){
                cell = sheetrow.createCell(2);
            }
            cell.setCellValue(fecha);
            cell.setCellStyle(cellStyle);
            
            //  ----------- (Licencia) Fecha fin ------------------------------
            sheetrow = sheet.getRow(41);
            if(sheetrow == null){
                sheetrow = sheet.createRow(41);
            }
            cell = sheetrow.getCell(6);
            if(cell == null){
                cell = sheetrow.createCell(6);
            }
            cell.setCellValue(fecha2);
            cell.setCellStyle(cellStyle);
            
            // Write the output to a file
            FileOutputStream fileOut = new FileOutputStream(getServletContext().getInitParameter("permisos") + "/solicitud_" + id + ".xlsx");
            wb.write(fileOut);
            fileOut.close();
                    
                    
                    response.sendRedirect("descargarpermiso.jsp");
                } catch (SQLException e) {
                    System.out.println("No se pudo completar la operación: " + e.getMessage());
                } catch (ParseException ex) {
                    Logger.getLogger(ServletEconomico.class.getName()).log(Level.SEVERE, null, ex);
                }
                break;
            case "editarPermiso":
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    String observaciones = request.getParameter("observaciones");
                    String confirmar = request.getParameter("confirmar");
                    try { 
                        String sql = "update permiso set "
                                + "observaciones = ?,"
                                + "confirmacion = ? "
                                + "where permisoID =" + id;
                        PreparedStatement s = conn.prepareStatement(sql);
                        
                        
                        s.setString(1, observaciones);
                        s.setString(2, confirmar);
                        s.executeUpdate();
                        s.close();
                        } catch (SQLException e){
                            System.out.println("No se pudo completar la operación: " + e.getMessage());
                        }
                        finally { conn.close(); }
                    
                    response.sendRedirect("ServletUsuario?num=" + request.getParameter("empleadoID"));
                } catch (SQLException e) {
                    System.out.println("No se pudo completar la operación: " + e.getMessage());
                }
                break;
            case "editarLicencia":
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    String observaciones = request.getParameter("observaciones");
                    String confirmar = request.getParameter("confirmar");
                    try { 
                        String sql = "update licencia set "
                                + "observaciones = ?,"
                                + "confirmacion = ? "
                                + "where licenciaID =" + id;
                        PreparedStatement s = conn.prepareStatement(sql);
                        
                        
                        s.setString(1, observaciones);
                        s.setString(2, confirmar);
                        s.executeUpdate();
                        s.close();
                        } catch (SQLException e){
                            System.out.println("No se pudo completar la operación: " + e.getMessage());
                        }
                        finally { conn.close(); }
                    
                    response.sendRedirect("ServletUsuario?num=" + request.getParameter("empleadoID"));
                } catch (SQLException e) {
                    System.out.println("No se pudo completar la operación: " + e.getMessage());
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
            case "editarPermiso":
                try {
                    String sql = "select * from permiso where permisoID = " 
                            + request.getParameter("id");
                    Statement s = conn.createStatement();
                    ResultSet rs = s.executeQuery(sql);
                    if(rs.next()) {             
                        request.setAttribute("permisoID", rs.getInt("permisoID"));
                        request.setAttribute("empleadoID", rs.getString("empleadoID"));
                        request.setAttribute("tipo", rs.getString("tipo")); 
                        request.setAttribute("fecha_inicio", rs.getDate("fecha_inicio"));
                        request.setAttribute("fecha_fin", rs.getDate("fecha_fin")); 
                        request.setAttribute("motivo", rs.getString("motivo")); 
                        request.setAttribute("dias", rs.getInt("dias")); 
                        request.setAttribute("observaciones", rs.getString("observaciones"));
                        request.setAttribute("fecha_elaboracion", rs.getString("fecha_elaboracion"));
                    }
                    s.close();
                    conn.close();
                    request.getRequestDispatcher("/permisos.jsp?method=permiso").forward(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(ServletNoticia.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                break;
             case "editarLicencia":
                try {
                    String sql = "select * from licencia where licenciaID = " 
                            + request.getParameter("id");;
                    Statement s = conn.createStatement();
                    ResultSet rs = s.executeQuery(sql);
                    while(rs.next()) {             
                        request.setAttribute("licenciaID", rs.getInt("licenciaID"));
                        request.setAttribute("empleadoID", rs.getString("empleadoID"));
                        request.setAttribute("tipo", rs.getString("tipo")); 
                        request.setAttribute("fecha_inicio", rs.getDate("fecha_inicio"));
                        request.setAttribute("fecha_fin", rs.getDate("fecha_fin")); 
                        request.setAttribute("motivo", rs.getString("motivo")); 
                        request.setAttribute("dias", rs.getInt("dias")); 
                        request.setAttribute("observaciones", rs.getString("observaciones"));
                        request.setAttribute("fecha_elaboracion", rs.getString("fecha_elaboracion")); 
                    }
                    s.close();
                    conn.close();
                    request.getRequestDispatcher("/permisos.jsp?method=licencia").forward(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(ServletNoticia.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                break;
             case "eliminarPermiso":
               try {
                    String sql = "delete from permiso where permisoID = " 
                            + request.getParameter("id");
                    Statement s = conn.createStatement();
                    s.executeUpdate(sql);
                    s.close();
                    conn.close();                    
                    response.sendRedirect("ServletUsuario?num=" + request.getParameter("empleado"));
                } catch (SQLException e) {
                    System.out.println("No se encontró permiso: " + e.getMessage());
                } 
               break;   
            case "eliminarLicencia":
               try {
                    String sql = "delete from licencia where licenciaID = " 
                            + request.getParameter("id");
                    Statement s = conn.createStatement();
                    s.executeUpdate(sql);
                    s.close();
                    conn.close();
                    response.sendRedirect("ServletUsuario?num=" + request.getParameter("empleado"));
                } catch (SQLException e) {
                    System.out.println("No se encontró permiso: " + e.getMessage());
                } 
               break;
        }
    }

}
