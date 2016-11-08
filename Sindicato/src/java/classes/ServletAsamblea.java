package classes;


/*import com.itextpdf.io.font.FontConstants;
import com.itextpdf.io.font.FontProgramFactory;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.pdf.PdfReader;
import com.itextpdf.kernel.pdf.extgstate.PdfExtGState;
import com.itextpdf.io.image.ImageData;
import com.itextpdf.kernel.color.Color;
import static com.itextpdf.kernel.color.Color.BLACK;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import static com.itextpdf.kernel.pdf.PdfName.Color;
import com.itextpdf.kernel.pdf.PdfResources;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.layout.Canvas;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.property.TextAlignment;
import com.itextpdf.layout.property.VerticalAlignment; */


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigInteger;
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
//import org.apache.poi.ss.usermodel.VerticalAlignment;
//import org.apache.poi.xwpf.usermodel.TextAlignment;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTShd;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTblWidth;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTcPr;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STTblWidth;

@WebServlet("/ServletAsamblea")
@MultipartConfig(maxFileSize = 16177215)

public class ServletAsamblea extends HttpServlet {
    @Override
    
    protected void doPost (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String method = request.getParameter("text");
        
        
        Conexion conexion = new Conexion();
        Connection conn = conexion.Conexion();
        switch (method) {
            case "agregar":
                try {
                    String titulo = request.getParameter("titulo");
                    String descripcion = request.getParameter("descripcion");
                    String tipo = request.getParameter("tipo");
                    DateFormat dateformat = new SimpleDateFormat("dd-MM-yyyy");
                    String date = request.getParameter("dia") + "-" + request.getParameter("mes") + "-" + request.getParameter("anio");
                    String hora_entrada = request.getParameter("hora");
                    String hora_salida = request.getParameter("hora2");
                    String lugar = request.getParameter("lugar");
                    String observaciones = request.getParameter("observaciones");
   
                    
                    Date fecha = new java.sql.Date(dateformat.parse(date).getTime());
                                     
                    
                    if (conn != null) {
                        try { 
                            
                            
                            String sql = "insert into asamblea (titulo, descripcion, tipo, fecha, hora_entrada, hora_salida, lugar, observaciones) values (?,?,?,?,?,?,?,?)";
                            PreparedStatement s = conn.prepareStatement(sql);
                            s.setString(1, titulo);
                            s.setString(2, descripcion);
                            s.setString(3, tipo);
                            s.setDate(4, fecha);
                            s.setString(5, hora_entrada);
                            s.setString(6, hora_salida);
                            s.setString(7, lugar);
                            s.setString(8, observaciones);
                            s.executeUpdate();
                            s.close();
                        } catch (SQLException e){
                            System.out.println("No se pudo completar la operación: " + e.getMessage());
                        }
                        finally { conn.close(); }
                    }                    
                        response.sendRedirect("admin-asamblea.jsp");
                } catch (SQLException e) {
                    System.out.println("No se pudo completar la operación: " + e.getMessage());
                } catch (ParseException ex) {
                    Logger.getLogger(ServletAsamblea.class.getName()).log(Level.SEVERE, null, ex);
                }
            break;
            case "agregarMinuta": 
                ControlAsamblea cAsamblea = new ControlAsamblea();
                try {
                    Part filePart = request.getPart("foto"); 
                    InputStream foto = filePart.getInputStream(); 
                    String path = "Asamblea_" + request.getParameter("id") + "_" + cAsamblea.getLastId() + ".jpg";
                    File uploads = new File(getServletContext().getInitParameter("upload.location") + "/asambleas");
                    File file = new File(uploads, path);
                    InputStream input = foto;
                    Files.copy(input, file.toPath());
                    
                    try {
                        String sql = "insert into pathminuta (asambleaID, path) values ("
                            + request.getParameter("id") + ",'"
                            + path + "')";
                    
                        Statement s = conn.createStatement();
                        s.executeUpdate(sql);
                        s.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(ServletAsamblea.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    response.sendRedirect("admin-asamblea.jsp");
                } catch (SQLException ex) { 
                    Logger.getLogger(ServletAsamblea.class.getName()).log(Level.SEVERE, null, ex);
                } 
                
                break;
            case "editar":
                try {                
                    String titulo = request.getParameter("titulo");
                    String descripcion = request.getParameter("descripcion");
                    String tipo = request.getParameter("tipo");

                    DateFormat dateformat = new SimpleDateFormat("dd-MM-yyyy");
                    String date = request.getParameter("dia")+ "-" + request.getParameter("mes") + "-" + request.getParameter("anio");
                    String hora_entrada = request.getParameter("hora");
                    String hora_salida = request.getParameter("hora2");
                    String lugar = request.getParameter("lugar");
                    String observaciones = request.getParameter("observaciones");
                    java.sql.Date fecha = new java.sql.Date(dateformat.parse(date).getTime());
                    int id = Integer.parseInt(request.getParameter("id"));                
                                       
                    
                        try {
                            String sql = "update asamblea set titulo = ?, "
                                    + "descripcion = ?, "
                                    + "tipo = ?, "
                                    + "fecha = ?, "
                                    + "hora_entrada = ?, "
                                    + "hora_salida = ?, "
                                    + "lugar = ?,"
                                    + "observaciones = ? "
                                    + "where asambleaID = ?";
                            PreparedStatement s = conn.prepareStatement(sql);
                            s.setString(1, titulo);
                            s.setString(2, descripcion);
                            s.setString(3, tipo);
                            s.setDate(4, fecha);
                            s.setString(5, hora_entrada);
                            s.setString(6, hora_salida);
                            s.setString(7, lugar);
                            s.setString(8, observaciones);
                            s.setInt(9, id);
                            s.executeUpdate();
                            s.close();
                            
                        } catch (SQLException e){
                            System.out.println("No se pudo completar la operación: " + e.getMessage());
                        }
                        finally { conn.close(); }
                    
                    response.sendRedirect("ServletAsamblea?text=detalles&id="+id);
                } catch (SQLException e) {
                    System.out.println("No se pudo completar la operación: " + e.getMessage());
                } catch (ParseException ex) {
                    Logger.getLogger(ServletAsamblea.class.getName()).log(Level.SEVERE, null, ex);
                }
                break;
            case "formatoMinuta":
                
                /*int numPersonal = Integer.parseInt(request.getParameter("numPersonal"));
                int numAcuerdo = Integer.parseInt(request.getParameter("numAcuerdo"));
                String des = " " + request.getParameter("direccion");
                String academia = request.getParameter("academia");
                String fecha = " " + request.getParameter("fecha");   
                String lugar = " " + request.getParameter("lugar");
                String objetivo = " " + request.getParameter("objetivo");
                String personal[] = new String[numPersonal];
                String asiste[] = new String[numPersonal];
                for (int i = 0; i < numPersonal; i++) {
                    personal[i] = request.getParameter("personal_" + i);
                    asiste[i] = request.getParameter("asiste_" + i);
                }
                
                String descripcion = request.getParameter("descripcion");
                String orden_responsable = request.getParameter("responsable");
                String convocante = " " + request.getParameter("convocante");
                String facilitador = " " +  request.getParameter("facilitador");
                String secretario = " " +  request.getParameter("secretario");
                String actividades =  request.getParameter("actividades");
              
                
                
                
                
                String []acuerdo = new String[numAcuerdo];
                String []Aresponsable = new String[numAcuerdo];
                for (int i = 0; i < numAcuerdo; i++) {
                    acuerdo[i] = request.getParameter("acuerdo_" + i);
                    Aresponsable[i] = request.getParameter("Aresponsable_" + i);
                }
                
                String dir = "C:/Users/LuisAlejandro/Dropbox/Sindicato/web/";
                
                // Creando minuta
                InputStream inp = new FileInputStream(dir + "minutas/minutaeditar.docx");
                XWPFDocument doc = new XWPFDocument(inp);
                
                try {
                    int row = 17;
                    MinutaPOI poi = new MinutaPOI();
                    row = row + personal.length * 2 + acuerdo.length;
                    XWPFTable table = doc.createTable(row,8);
                    
                    CTTblWidth width = table.getCTTbl().addNewTblPr().addNewTblW();
                    width.setType(STTblWidth.DXA);
                    width.setW(BigInteger.valueOf(9072));
                    
                    
                    //  Agregando Coordinacion/Direccion
                    poi.mergeCellsHorizontal(table,0,0,7);
                    CTTcPr tcpr = table.getRow(0).getCell(0).getCTTc().addNewTcPr();
                    CTShd ctshd = tcpr.addNewShd();
                    ctshd.setFill("d9d9d9");
                    XWPFParagraph para = table.getRow(0).getCell(0).getParagraphs().get(0);
                    XWPFRun rh = para.createRun();
                    rh.setText(" Coordinación/Dirección: ");
                    rh.setFontFamily("Batang");
                    rh.setBold(true);
                    para = table.getRow(0).getCell(0).getParagraphs().get(0);
                    rh = para.createRun();
                    rh.setText(des);
                    rh.setFontFamily("Batang");
                    rh.setBold(true);
                    
                    //  Agregando Academia
                    poi.mergeCellsHorizontal(table,1,0,7);
                    para = table.getRow(1).getCell(0).getParagraphs().get(0);
                    rh = para.createRun();
                    rh.setText(academia);
                    rh.setFontSize(11);
                    rh.setFontFamily("Batang");
                    
                    //  Agregando fecha
                    poi.mergeCellsHorizontal(table,2,0,2); 
                    para = table.getRow(2).getCell(0).getParagraphs().get(0);
                    rh = para.createRun();
                    rh.setText(fecha);
                    rh.setFontSize(11);
                    rh.setFontFamily("Batang");
                    
                    //  Agregando lugar
                    poi.mergeCellsHorizontal(table,2,3,7);
                    para = table.getRow(2).getCell(3).getParagraphs().get(0);
                    rh = para.createRun();
                    rh.setText(lugar);
                    rh.setFontFamily("Batang");

                    // Agregando objetivo
                    poi.mergeCellsHorizontal(table,3,0,7);
                    para = table.getRow(3).getCell(0).getParagraphs().get(0);
                    rh = para.createRun();
                    rh.setText(" Objetivo de la reunión");
                    rh.setFontFamily("Batang");
                    rh.setBold(true);
                    poi.mergeCellsHorizontal(table,4,0,7);
                    para = table.getRow(4).getCell(0).getParagraphs().get(0);
                    rh = para.createRun();
                    rh.setText(objetivo);
                    rh.setFontSize(11);
                    rh.setFontFamily("Batang");

                    // Personal convocado
                    poi.mergeCellsHorizontal(table,5,0,5);
                    tcpr = table.getRow(5).getCell(0).getCTTc().addNewTcPr();
                    ctshd = tcpr.addNewShd();
                    ctshd.setFill("d9d9d9");
                    para = table.getRow(5).getCell(0).getParagraphs().get(0);
                    rh = para.createRun();
                    rh.setText(" Personal convocado ");
                    rh.setFontFamily("Batang");
                    rh.setBold(true);

                    // Asiste
                    poi.mergeCellsHorizontal(table,5,6,7);
                    tcpr = table.getRow(5).getCell(6).getCTTc().addNewTcPr();
                    ctshd = tcpr.addNewShd();
                    ctshd.setFill("d9d9d9");
                    para = table.getRow(5).getCell(6).getParagraphs().get(0);
                    rh = para.createRun();
                    rh.setText(" Asiste Si/No ");
                    rh.setFontFamily("Batang");
                    rh.setBold(true);
                    
                    /* 
                        Insertar personal y asistencia
                    */
                
                    /*
                    int nextRow = 6;
                    for (int i = 0; i < personal.length; i++) {
                        poi.mergeCellsHorizontal(table,nextRow,0,5);  // Nombre personal
                        para = table.getRow(nextRow).getCell(0).getParagraphs().get(0);
                        rh = para.createRun();
                        rh.setText(" " + personal[i]);
                        rh.setFontSize(11);
                        rh.setFontFamily("Batang");

                        poi.mergeCellsHorizontal(table, nextRow, 6, 7);  // Asistencia
                        para = table.getRow(nextRow).getCell(6).getParagraphs().get(0);
                        rh = para.createRun();
                        rh.setText(" " + asiste[i]);
                        rh.setFontSize(11);
                        rh.setFontFamily("Batang");
                        nextRow++;
                    }
                    /* 
                        ./Insertar personal y asistencia
                    */
                    
                    // Orden del día
                /*
                    tcpr = table.getRow(nextRow).getCell(0).getCTTc().addNewTcPr();
                    ctshd = tcpr.addNewShd();
                    ctshd.setFill("d9d9d9");
                    para = table.getRow(nextRow).getCell(0).getParagraphs().get(0);
                    rh = para.createRun();
                    rh.setText(" Orden del día ");
                    rh.setFontFamily("Batang");
                    rh.setBold(true);
                    poi.mergeCellsHorizontal(table, nextRow, 0, 7);  
                    nextRow++;
                    
                    // Titulo Descripción
                    tcpr = table.getRow(nextRow).getCell(0).getCTTc().addNewTcPr();
                    ctshd = tcpr.addNewShd();
                    ctshd.setFill("d9d9d9");
                    para = table.getRow(nextRow).getCell(0).getParagraphs().get(0);
                    rh = para.createRun();
                    rh.setText(" Descripción ");
                    rh.setFontFamily("Batang");
                    rh.setBold(true);
                    poi.mergeCellsHorizontal(table, nextRow, 0, 4);

                    // Titulo Responsable
                    tcpr = table.getRow(nextRow).getCell(5).getCTTc().addNewTcPr();
                    ctshd = tcpr.addNewShd();
                    ctshd.setFill("d9d9d9");
                    para = table.getRow(nextRow).getCell(5).getParagraphs().get(0);
                    rh = para.createRun();
                    rh.setText(" Responsable ");
                    rh.setFontFamily("Batang");
                    rh.setBold(true);
                    poi.mergeCellsHorizontal(table,nextRow,5,7);  // Responsable
                    nextRow++;
                    
                    // Descripcion
                    poi.mergeCellsHorizontal(table,nextRow,0,4);  
                    para = table.getRow(nextRow).getCell(0).getParagraphs().get(0);
                    rh = para.createRun();
                    rh.setText(descripcion);
                    rh.setFontSize(11);
                    rh.setFontFamily("Batang");
                    poi.mergeCellsHorizontal(table, nextRow, 6, 7);
                    
                    //  Responsable
                    para = table.getRow(nextRow).getCell(5).getParagraphs().get(0);
                    rh = para.createRun();
                    rh.setText(orden_responsable);
                    rh.setFontSize(11);
                    rh.setFontFamily("Batang");
                    poi.mergeCellsHorizontal(table, nextRow, 5, 7);  
                    nextRow++; 
                    
                    // Convocante
                    para = table.getRow(nextRow).getCell(0).getParagraphs().get(0);
                    rh = para.createRun();
                    rh.setText(" Convocante: ");
                    rh.setFontFamily("Batang");
                    rh.setBold(true);
                    poi.mergeCellsHorizontal(table, nextRow, 0, 1);  // Convocante
                    poi.mergeCellsHorizontal(table, nextRow, 2, 7);  // Convocante
                    para = table.getRow(nextRow).getCell(2).getParagraphs().get(0);
                    rh = para.createRun();
                    rh.setText(convocante);
                    rh.setFontSize(11);
                    rh.setFontFamily("Batang");
                    nextRow++;
                    
                    // Facilitador
                    para = table.getRow(nextRow).getCell(0).getParagraphs().get(0);
                    rh = para.createRun();
                    rh.setText(" Facilitador: ");
                    rh.setFontFamily("Batang");
                    rh.setBold(true);
                    poi.mergeCellsHorizontal(table, nextRow,0,1);  // Facilitador
                    poi.mergeCellsHorizontal(table, nextRow,2,7);  // Facilitador
                    para = table.getRow( nextRow).getCell(2).getParagraphs().get(0);
                    rh = para.createRun();
                    rh.setText(facilitador);
                    rh.setFontSize(11);
                    rh.setFontFamily("Batang");
                    nextRow++;
                    
                    // Secretario
                    para = table.getRow(nextRow).getCell(0).getParagraphs().get(0);
                    rh = para.createRun();
                    rh.setText(" Secretario: ");
                    rh.setFontFamily("Batang");
                    rh.setBold(true);
                    poi.mergeCellsHorizontal(table, nextRow,0,1);  // Secretario
                    poi.mergeCellsHorizontal(table, nextRow,2,7);  // Secretario
                    para = table.getRow(nextRow).getCell(2).getParagraphs().get(0);
                    rh = para.createRun();
                    rh.setText(secretario);
                    rh.setFontSize(11);
                    rh.setFontFamily("Batang");
                    nextRow++;
                    
                    
                    // Titulo Actividades desarrolladas
                    poi.mergeCellsHorizontal(table, nextRow,0,7);  
                    tcpr = table.getRow(nextRow).getCell(0).getCTTc().addNewTcPr();
                    ctshd = tcpr.addNewShd();
                    ctshd.setFill("d9d9d9");
                    para = table.getRow(nextRow).getCell(0).getParagraphs().get(0);
                    rh = para.createRun();
                    rh.setText(" Actividades desarrolladas ");
                    rh.setFontFamily("Batang");
                    rh.setBold(true);
                    nextRow++;
                    
                    // Actividades desarrolladas
                    poi.mergeCellsHorizontal(table, nextRow,0,7);  
                    para = table.getRow(nextRow).getCell(0).getParagraphs().get(0);
                    rh = para.createRun();
                    rh.setText(actividades.toString());
                    rh.setFontSize(11);
                    rh.setFontFamily("Batang");
                    nextRow++;
                    
                    // Titulo acuerdo y compromisos
                    tcpr = table.getRow(nextRow).getCell(0).getCTTc().addNewTcPr();
                    ctshd = tcpr.addNewShd();
                    ctshd.setFill("d9d9d9");
                    para = table.getRow(nextRow).getCell(0).getParagraphs().get(0);
                    rh = para.createRun();
                    rh.setText(" Acuerdos/Compromisos ");
                    rh.setFontFamily("Batang");
                    rh.setBold(true);
                    poi.mergeCellsHorizontal(table,nextRow,0,4); 
                    
                    // Titulo Responsables
                    tcpr = table.getRow(nextRow).getCell(5).getCTTc().addNewTcPr();
                    ctshd = tcpr.addNewShd();
                    ctshd.setFill("d9d9d9");
                    para = table.getRow(nextRow).getCell(5).getParagraphs().get(0);
                    rh = para.createRun();
                    rh.setText(" Responsable ");
                    rh.setFontFamily("Batang");
                    rh.setBold(true);
                    poi.mergeCellsHorizontal(table,nextRow,5,7);
                    nextRow++;
                    
                    /*
                        Insertar acuerdos y compromisos
                    */
                    
                /*
                    for(int i = 0; i < acuerdo.length; i++) {
                        poi.mergeCellsHorizontal(table, nextRow,0,4);  // Acuerdo o compromiso
                        para = table.getRow(nextRow).getCell(0).getParagraphs().get(0);
                        rh = para.createRun();
                        rh.setText(acuerdo[i]);
                        rh.setFontSize(11);
                        rh.setFontFamily("Batang");

                        poi.mergeCellsHorizontal(table, nextRow,5,7);  // Responsable
                        para = table.getRow( nextRow).getCell(5).getParagraphs().get(0);
                        rh = para.createRun();
                        rh.setText(Aresponsable[i]);
                        rh.setFontSize(11);
                        rh.setFontFamily("Batang");
                        nextRow++;
                    }
                    /*
                        ./Insertar acuerdos y compromisos
                    */
                    
                /*
                    // Registro de conformidad
                    tcpr = table.getRow(nextRow).getCell(0).getCTTc().addNewTcPr();
                    ctshd = tcpr.addNewShd();
                    ctshd.setFill("d9d9d9");
                    para = table.getRow(nextRow).getCell(0).getParagraphs().get(0);
                    rh = para.createRun();
                    rh.setText(" Registro de conformidad ");
                    rh.setFontFamily("Batang");
                    rh.setBold(true);
                    poi.mergeCellsHorizontal(table,nextRow,0,7);  // Registro de conformidad
                    nextRow++;

                    // Nombre
                    tcpr = table.getRow(nextRow).getCell(0).getCTTc().addNewTcPr();
                    ctshd = tcpr.addNewShd();
                    ctshd.setFill("d9d9d9");
                    para = table.getRow(nextRow).getCell(0).getParagraphs().get(0);
                    rh = para.createRun();
                    rh.setText(" Nombre");
                    rh.setFontFamily("Batang");
                    rh.setBold(true);

                    // Firma
                    tcpr = table.getRow(nextRow).getCell(4).getCTTc().addNewTcPr();
                    ctshd = tcpr.addNewShd();
                    ctshd.setFill("d9d9d9");
                    para = table.getRow(nextRow).getCell(4).getParagraphs().get(0);
                    rh = para.createRun();
                    rh.setText("Firma");
                    rh.setFontFamily("Batang");
                    rh.setBold(true);

                    // Observaciones
                    tcpr = table.getRow(nextRow).getCell(6).getCTTc().addNewTcPr();
                    ctshd = tcpr.addNewShd();
                    ctshd.setFill("d9d9d9");
                    para = table.getRow(nextRow).getCell(6).getParagraphs().get(0);
                    rh = para.createRun();
                    rh.setText(" Observaciones");
                    rh.setFontFamily("Batang");
                    rh.setBold(true);

                    poi.mergeCellsHorizontal(table, nextRow,0,3);  // Nombre
                    poi.mergeCellsHorizontal(table, nextRow,4,5);  // Firma
                    poi.mergeCellsHorizontal(table, nextRow,6,7);  // Observaciones
                    
                    /*
                        Código para insertar nombres de registro de conformidad
                    */
                /*
                    nextRow++;
                    for (String personal1 : personal) {
                        poi.mergeCellsHorizontal(table, nextRow,0,3);  // Nombre
                        para = table.getRow(nextRow).getCell(0).getParagraphs().get(0);
                        rh = para.createRun();
                        rh.setText(personal1);
                        rh.setFontSize(11);
                        rh.setFontFamily("Batang");
                        poi.mergeCellsHorizontal(table, nextRow,4,5);  // Firma
                        poi.mergeCellsHorizontal(table, nextRow,6,7);  // Observaciones
                        nextRow++;
                    }

                    /*
                        ./Código para insertar nombres de registro de conformidad
                    */
                /*
                    OutputStream out = new FileOutputStream(dir + "/minutas/minuta_" + asambleaID + des + academia + ".docx");
                    try {
                        doc.write(out);
                    } finally {
                        out.close();
                    }
                } finally {
                    doc.close();
                }
                */
                String asambleaID = request.getParameter("id");
                Part filePart = request.getPart("archivo");
                String numActa = request.getParameter("numActa");
                String tipo = request.getParameter("tipo");
                DateFormat dateformat = new SimpleDateFormat("dd-MM-yyyy");
               
                String date = request.getParameter("dia") + "-" + request.getParameter("mes") + "-" + request.getParameter("anio");
                
                String nombre = filePart.getSubmittedFileName();
                if (filePart.getSize() != 0) {
                        InputStream pdf = filePart.getInputStream();
                        
                        String path = "Minuta_" + numActa + nombre;
                        File uploads = new File(getServletContext().getInitParameter("formatos"));
                        File file = new File(uploads, path);
                        InputStream input = pdf;
                        Files.copy(input, file.toPath());
                        
                        /*
                        PdfReader pdfreader = new PdfReader(uploads + "\\" + path);
                        PdfDocument pdfDoc = new PdfDocument(pdfreader, new PdfWriter(uploads + "\\"  + "watermark_" + path));
                        
                        PdfCanvas under = new PdfCanvas(pdfDoc.getFirstPage().newContentStreamBefore(), new PdfResources(), pdfDoc);
                        PdfFont font = PdfFontFactory.createFont(FontProgramFactory.createFont(FontConstants.HELVETICA));
                        Paragraph p = new Paragraph("This watermark is added UNDER the existing content").setFont(font).setFontSize(15);
                        new Canvas(under, pdfDoc, pdfDoc.getDefaultPageSize()).showTextAligned(p, 297, 550, 1, TextAlignment.CENTER, VerticalAlignment.TOP, 0);
                        PdfCanvas over = new PdfCanvas(pdfDoc.getFirstPage());
                        Color a = BLACK;
                        over.setFillColor(a);
                        
                        p = new Paragraph("This watermark is added ON TOP OF the existing content").setFont(font).setFontSize(15);
                        new Canvas(over, pdfDoc, pdfDoc.getDefaultPageSize()).showTextAligned(p, 297, 500, 1, TextAlignment.CENTER, VerticalAlignment.TOP, 0);
                        p = new Paragraph("This TRANSPARENT watermark is added ON TOP OF the existing content").setFont(font).setFontSize(15);
                        over.saveState();
                        PdfExtGState gs1 = new PdfExtGState();
                        gs1.setFillOpacity(0.5f);
                        over.setExtGState(gs1);
                        new Canvas(over, pdfDoc, pdfDoc.getDefaultPageSize()).showTextAligned(p, 297, 450, 1, TextAlignment.CENTER, VerticalAlignment.TOP, 0);
                        over.restoreState();
                        pdfDoc.close();
                        */
                        
                        
                    }
                try {
                    Date fecha = new java.sql.Date(dateformat.parse(date).getTime());
                    String sql = "insert into pathformato (asambleaID, path, titulo, numActa, fecha, tipo) "
                            + "values (?,?,?,?,?,?)";
                    PreparedStatement s = conn.prepareStatement(sql);
                    int id = Integer.parseInt(asambleaID);
                    s.setInt(1, id);
                    s.setString(2, "Minuta_" + numActa + nombre);
                    s.setString(3,nombre);
                    s.setString(4,numActa);
                    s.setDate(5,fecha);
                    s.setString(6,tipo);
                    s.executeUpdate();
                    s.close();
                    conn.close();
                    response.sendRedirect("ServletAsamblea?text=detalles&id=" + id);
                } catch (SQLException ex) {
                    Logger.getLogger(ServletAsamblea.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ParseException ex) {
                    Logger.getLogger(ServletAsamblea.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                break;
                /*
            case "editarFormato":
                String formatoID = request.getParameter("formatoID");
                asambleaID = request.getParameter("id");
                filePart = request.getPart("archivo");
                numActa = request.getParameter("numActa");
                tipo = request.getParameter("tipo");
                dateformat = new SimpleDateFormat("dd-MM-yyyy");
               
                date = request.getParameter("dia") + "-" + request.getParameter("mes") + "-" + request.getParameter("anio");
                
                
                if (filePart.getSize() != 0) {
                        nombre = filePart.getSubmittedFileName();
                        InputStream pdf = filePart.getInputStream();
                        String path = "Minuta_" + numActa + nombre;
                        File uploads = new File(getServletContext().getInitParameter("formatos"));
                        File file = new File(uploads, path);
                        InputStream input = pdf;
                        Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
                        
                        
                        PdfDocument pdfDoc = new PdfDocument(new PdfReader(path), new PdfWriter("watermark_" + path));
                        PdfCanvas under = new PdfCanvas(pdfDoc.getFirstPage().newContentStreamBefore(), new PdfResources(), pdfDoc);
                        PdfFont font = PdfFontFactory.createFont(FontProgramFactory.createFont(FontConstants.HELVETICA));
                        Paragraph p = new Paragraph("This watermark is added UNDER the existing content")
                                .setFont(font).setFontSize(15);
                        new Canvas(under, pdfDoc, pdfDoc.getDefaultPageSize()).showTextAligned(p, 297, 550, 1, TextAlignment.CENTER, VerticalAlignment.TOP, 0);
                        PdfCanvas over = new PdfCanvas(pdfDoc.getFirstPage());
                        Color a = BLACK;
                        over.setFillColor(a);
                        
                        p = new Paragraph("This watermark is added ON TOP OF the existing content")
                                .setFont(font).setFontSize(15);
                        new Canvas(over, pdfDoc, pdfDoc.getDefaultPageSize())
                                .showTextAligned(p, 297, 500, 1, TextAlignment.CENTER, VerticalAlignment.TOP, 0);
                        p = new Paragraph("This TRANSPARENT watermark is added ON TOP OF the existing content")
                                .setFont(font).setFontSize(15);
                        over.saveState();
                        PdfExtGState gs1 = new PdfExtGState();
                        gs1.setFillOpacity(0.5f);
                        over.setExtGState(gs1);
                        new Canvas(over, pdfDoc, pdfDoc.getDefaultPageSize())
                                .showTextAligned(p, 297, 450, 1, TextAlignment.CENTER, VerticalAlignment.TOP, 0);
                        over.restoreState();
                        pdfDoc.close();
                       
                        
                       
                        
                        try {
                            String sql = "update pathformato set path = ?, titulo = ? where formatoID = " + formatoID;
                            PreparedStatement s = conn.prepareStatement(sql);
                            s.setString(1, "Minuta_" + numActa + nombre);
                            s.setString(2, nombre);
                            s.executeUpdate();
                            s.close();
                            
                        } catch (SQLException ex) {
                            Logger.getLogger(ServletAsamblea.class.getName()).log(Level.SEVERE, null, ex);
                        }
                }
                
                try {
                    Date fecha = new java.sql.Date(dateformat.parse(date).getTime());
                    String sql = "update pathformato set numActa = ?,"
                            + " fecha = ?,"
                            + "tipo = ? where formatoID = " + formatoID;
                    PreparedStatement s = conn.prepareStatement(sql);
                    
                    s.setString(1,numActa);
                    s.setDate(2,fecha);
                    s.setString(3,tipo);
                    s.executeUpdate();
                    s.close();
                    conn.close();
                    response.sendRedirect("ServletAsamblea?text=detalles&id=" + asambleaID);
                } catch (SQLException ex) {
                    Logger.getLogger(ServletAsamblea.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ParseException ex) {
                    Logger.getLogger(ServletAsamblea.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                break;
                        */
        }                    
    }
    
    protected void doGet (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        String text = request.getParameter("text");
        ControlAsamblea cAsamblea = new ControlAsamblea();
        
        switch (text) {
            case "detalles":
                
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    Asamblea asamblea = cAsamblea.getAsambleaById(id);

                    request.setAttribute("id", asamblea.getId());
                    request.setAttribute("titulo", asamblea.getTitulo());
                    request.setAttribute("descripcion", asamblea.getDescripcion());
                    request.setAttribute("tipo", asamblea.getTipo());
                    request.setAttribute("fecha", asamblea.getFecha());
                    request.setAttribute("hora_entrada", asamblea.getHoraEntrada());
                    request.setAttribute("hora_salida", asamblea.getHoraSalida());
                    request.setAttribute("lugar", asamblea.getLugar());
                    request.setAttribute("observaciones", asamblea.getObservaciones());
                } catch (SQLException e) {
                        System.out.println("No se encontró asamblea: " + e.getMessage());
                }

                request.getRequestDispatcher("/admin-detalle-asamblea.jsp").forward(request, response);
            break;
            case "editar":
                Asamblea asamblea = new Asamblea();
                try {
                    
                            
                    asamblea = cAsamblea.getAsambleaById(Integer.parseInt(request.getParameter("id")));
                    
                    request.setAttribute("id", asamblea.getId());
                    request.setAttribute("titulo", asamblea.getTitulo());
                    request.setAttribute("descripcion", asamblea.getDescripcion());
                    request.setAttribute("tipo", asamblea.getTipo());
                    request.setAttribute("fecha", asamblea.getFecha());
                    request.setAttribute("hora_entrada", asamblea.getHoraEntrada());
                    request.setAttribute("hora_salida", asamblea.getHoraSalida());
                    request.setAttribute("lugar", asamblea.getLugar());
                    request.setAttribute("observaciones", asamblea.getObservaciones());
                    request.getRequestDispatcher("/publicar-asamblea.jsp?method=editar").forward(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(ServletNoticia.class.getName()).log(Level.SEVERE, null, ex);
                }
                break;
            case "eliminar":
                int id = Integer.parseInt(request.getParameter("id"));
                try {             
                    String dir = getServletContext().getInitParameter("dir");
                    int col = 0;
                    int colf = 0;
                    String[] paths;
                    String[] pathf;
                    int[] minutaID;
                    int[] formatoID;
                    Conexion conexion = new Conexion();
                    Connection conn = conexion.Conexion();
                    Statement s = conn.createStatement();
                    String sql = "select minutaID, path from pathminuta where asambleaID = " + id;
                    
                    try {
                        String count = "select count(*) from pathminuta where asambleaID = " + id;
                        ResultSet rs = s.executeQuery(count);
                        if (rs.next()) {
                            col = rs.getInt(1);    
                        }
                        rs.close();
                        paths = new String[col];
                        minutaID = new int[col];
                        int j = 0;
                        rs = s.executeQuery(sql);
                        // adquirir minutaID y path
                        while(rs.next()) {
                            minutaID[j] = rs.getInt(1);
                            paths[j] = rs.getString(2);
                            j++;
                        }
                        rs.close();
                        
                        sql = "select formatoID, path from pathformato where asambleaID = " + id;
                        count = "select count(*) from pathformato where asambleaID = " + id;
                        rs = s.executeQuery(count);
                        if (rs.next()) {
                            colf = rs.getInt(1);    
                        }
                        rs.close();
                        pathf = new String[colf];
                        formatoID = new int[colf];
                        j = 0;
                        rs = s.executeQuery(sql);
                        // adquirir minutaID y path
                        while(rs.next()) {
                            formatoID[j] = rs.getInt(1);
                            pathf[j] = rs.getString(2);
                            j++;
                        }
                        
                       
                        // Eliminar asamblea
                        for(int i = 0; i < col ; i++) {
                            String filePath = getServletContext().getInitParameter("upload.location") + "/asambleas/" + paths[i];
                            File file = new File(filePath);
                            file.delete();
                            
                            
                            
                            sql = "delete from pathminuta where minutaID = " + minutaID[i];
                            s.executeUpdate(sql);
                        }
                        for(int i = 0; i < colf ; i++) {
                            String filePath = dir + "/minutas/" + pathf[i];
                            File file = new File(filePath);
                            file.delete();
                            
                            sql = "delete from pathformato where formatoID = " + formatoID[i];
                            s.executeUpdate(sql);
                            
                            
                        }
                        
                        
                        
                    }
                    finally { 
                        s.close(); 
                        conn.close();
                    }
                    cAsamblea.deleteAsamblea(id);
                    response.sendRedirect("admin-asamblea.jsp");
                    
                } catch (SQLException e) {
                    System.out.println("No se encontró evento: " + e.getMessage());
                }   break;
            case "eliminarPath":
                int pathID = Integer.parseInt(request.getParameter("pathID"));
                try {
                    String filePath = getServletContext().getInitParameter("upload.location") + "/asambleas/" + cAsamblea.getPathMinutaByID(pathID);
                    File file = new File(filePath);
                    file.delete();
                    cAsamblea.deleteAsambleaPath(pathID);
                    response.sendRedirect("admin-asamblea.jsp");
                    
                } catch (SQLException e) {
                    System.out.println("No se encontró path: " + e.getMessage());
                }   break;
            
            case "editarFormato":
                String formatoID = request.getParameter("formatoID");
                try {
                    String sql = "select * from pathformato where formatoID = " + formatoID;
                    Conexion conexion = new Conexion();
                    Connection conn = conexion.Conexion();
                    Statement s = conn.createStatement();
                    ResultSet rs = s.executeQuery(sql);
                    while(rs.next()) {
                        request.setAttribute("formatoID", rs.getInt("formatoID"));
                        request.setAttribute("id", rs.getInt("asambleaID"));
                        request.setAttribute("titulo", rs.getString("titulo"));
                        request.setAttribute("numActa", rs.getString("numActa"));
                        request.setAttribute("fecha", rs.getString("fecha"));
                        request.setAttribute("tipo", rs.getString("tipo"));
                        
                    }
                    s.close();
                    conn.close();
                    request.getRequestDispatcher("/FormatoMinuta.jsp?method=editarFormato").forward(request, response);

                } catch(SQLException e) {
                    System.out.println("No se encontró formato: " + e.getMessage());
                }
                
                
                
                break;
                
            case "eliminarFormato":
                String dir = getServletContext().getInitParameter("dir");
                pathID = Integer.parseInt(request.getParameter("id"));
                String asambleaid = request.getParameter("asamblea");
                String path = request.getParameter("path");
                try {
                    String filePath = dir + "/minutas/" + path;
                    File file = new File(filePath);
                    file.delete();
                    
                    Conexion conexion = new Conexion();
                    Connection conn = conexion.Conexion();
                    Statement s = conn.createStatement();
                    try {
                        String sql = "delete from pathformato where formatoID = " + pathID;
                        s.executeUpdate(sql);
                        s.close();
                        conn.close();
                    } catch (SQLException e) {
                        System.out.println("No se encontró minuta: " + e.getMessage());
                    } 
                    
                    
                    response.sendRedirect("ServletAsamblea?text=detalles&id=" + asambleaid);
                    
                } catch (SQLException e) {
                    System.out.println("No se encontró path: " + e.getMessage());
                }   break;
        }            
    }
}
