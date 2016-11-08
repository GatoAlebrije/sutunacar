<%@page import="java.util.Locale"%>
<%@page import="org.joda.time.DateTime"%>
<%@ include file="session.jsp"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Connection"%>
<%@page import="classes.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle Asamblea</title>
        <!-- Custom styles-->
        <link href="css/custom-navbar.css" rel="stylesheet" />
        <link href="css/admin.css" rel="stylesheet" />
        <link href="css/custom.css" rel="stylesheet" />
        
        <link href="css/bootstrap.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLES-->
        <link href="css/font-awesome.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        
    
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    </head>
    <body>
        <%@include file="srcJsp/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2" style="margin-top: 20px">
                    <%@include file="srcJsp/nav-admin.jsp" %>
                </div>
                <div class="col-md-10 main">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Detalles de asamblea</h1>
                        </div>
                    </div>
                    
                    <div class="row" style="padding: 0px 20px 20px;">
                        <div class="col-lg-12">
                            <a href="ServletAsamblea?text=editar&amp;id=<%= request.getAttribute("id")%>" class="btn btn-info btn-lg " role="button" data-toggle="tooltip" data-placement="top" title="Editar"><i class="material-icons pull-left">mode_edit</i>&nbsp;Editar</a> 
                            <a href="FormatoMinuta.jsp?id=<%= request.getAttribute("id")%>&amp;method=formatoMinuta" class="btn btn-info btn-lg " role="button" data-toggle="tooltip" data-placement="top" title="Formato"><i class="material-icons pull-left">mode_edit</i>&nbsp;Agregar formato</a> 
                            <a href="ServletAsamblea?text=eliminar&amp;id=<%= request.getAttribute("id")%>" class="btn btn-danger btn-lg" data-toggle="confirmation" data-singleton="true" data-popout="true" data-btn-ok-label="Eliminar" data-btn-ok-class="btn-danger" data-title="Eliminar" data-placement="top" title="Eliminar"><i class="material-icons pull-left">delete</i>Eliminar Asamblea</a>
                        </div>
                    </div>
                    <h2 style="text-align: center;"><%=request.getAttribute("titulo")%></h2>
                    <div class="row" style="padding: 40px 60px;">
                        
                        <p style=" text-align: justify;">
                            <%
                                String des = request.getAttribute("descripcion").toString();
                                des = des.replaceAll("\n","<br />");
                             %>
                             <%=des%>
                          
                        </p>
                        <br>
                        <div class='col-md-3' >
                            <p style=" color: #666666;"><i class="material-icons pull-left">event</i>&nbsp;Fecha del evento: <%= request.getAttribute("fecha") %> </p>
                        </div>
                        <div class='col-md-3'>
                            <p style=" color: #666666;"><i class="material-icons pull-left">access_time</i>&nbsp;Horario: <%= request.getAttribute("hora_entrada") %> - <%=request.getAttribute("hora_salida")%> </p>
                        </div>
                        <div class='col-md-3'>
                            <p style="color: #666666;"><i class="material-icons pull-left">place</i>&nbsp;Lugar: <%= request.getAttribute("lugar") %> </p>
                        </div>
                    </div>
                    
                    <hr/>
                    
                  
                    <%              
                            Conexion conexion = new Conexion();
                            Connection conn = conexion.Conexion();
                    %>
                    
                   
                    <!-- Formatos -->
                    <div class="col-md-12 ">
                        <br />
                    <h2 style="text-align: center;">Minutas</h2>
                    <hr />
                    <table id="tablaMinuta" class="table table-striped">
                     <thead>
                        <tr>
                            <th>Titulo</th>
                            <th>Tipo</th>
                            <th>Número de Acta</th>
                            <th>Fecha</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    <%  try {                 
                        Statement s = conn.createStatement();
                        DateTime d;
                        String fecha;
                        String path = config.getInitParameter("formatos");
                        String sql = "select formatoID, path, titulo, numActa, fecha,tipo from pathformato where asambleaID = " + request.getAttribute("id");
                        ResultSet rs = s.executeQuery(sql);
                        while(rs.next()){
                            d = new DateTime (rs.getDate("fecha"));
                            fecha = d.getDayOfMonth() + "/" + d.monthOfYear().getAsText(new Locale("es", "ES")) + "/" + d.getYear();
                            
                     %>
                     
                        <tr>
                           <td><a href="minutas/<%=rs.getString("path")%>"><%=rs.getString("titulo")%></a></td>
                           <td><%=rs.getString("tipo")%></td>
                           <td><%=rs.getString("numActa")%></td>
                           <td><%=fecha%></td>
                           <td>
                               <a href="ServletAsamblea?text=editarFormato&amp;formatoID=<%=rs.getInt("formatoID")%>" class="btn btn-info btn-xs" role="button" data-toggle="tooltip" data-placement="top" title="Editar"><i class="material-icons">mode_edit</i></a> 
                           </td>
                           <td><a href="ServletAsamblea?text=eliminarFormato&amp;id=<%= rs.getInt("formatoID")%>&amp;path=<%=rs.getString("path")%>&amp;asamblea=<%=request.getAttribute("id")%>" class="btn btn-danger btn-xs" data-toggle="confirmation" data-singleton="true" data-popout="true" data-btn-ok-label="Eliminar" data-btn-ok-class="btn-danger" data-title="Eliminar" data-placement="top" title="Eliminar"><i class="material-icons pull-left">delete</i></a></td>
                       </tr>
                       
                     
                     
                     <%
                            }
                            s.close();
                            conn.close();
                            }catch (SQLException e) {
                               System.out.println("No se encontró noticia: " + e.getMessage());
                        }                   
                    %>   
                    </tbody>
                    </table>
                    </div>
                    
                    <!-- ./row -->
                    </div>  
                </div>
            </div>
        </div>
        <!-- BOOTSTRAP SCRIPTS -->
        <script src="js/bootstrap.js"></script>
        <script src="js/bootstrap-confirmation.js"></script>
        <!-- METISMENU SCRIPTS -->
        <script src="js/jquery.metisMenu.js"></script>                 
        <script>
            $("#asamblea").addClass("active");   
            
            $(function () {
            $('[data-toggle="tooltip"]').tooltip();
            });
            
            $('[data-toggle=confirmation]').confirmation({
            rootSelector: '[data-toggle=confirmation]',
            // other options
            
            });
        </script>
    </body>
</html>
