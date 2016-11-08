<%@ include file="session.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="classes.Noticia"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Connection"%>
<%@page import="classes.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eventos</title>
        
        <link href="css/custom-navbar.css" rel="stylesheet" />
        <link href="css/admin.css" rel="stylesheet" />
        
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
                <!-- Area trabajo -->
                <div class="col-md-10 main">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Eventos <small> &nbsp; Publica y edita eventos</small></h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <a href="publicar-evento.jsp?method=agregar" class="btn btn-warning btn-lg" style="margin-left: 10px;"><i class="pull-left material-icons">add_circle</i> &nbsp; Publicar Evento</a>
                        </div>
                    </div>
                    <br>
                    <!-- Grupo de noticias -->
                    <div class="noticias row">
                        <%              
                            Conexion conexion = new Conexion();
                            Connection conn = conexion.Conexion();
                            Blob blob;
                            byte[] bdata;
                            String descripcion;
                            Evento evento = new Evento();

                            if (conn != null){
                                try {
                                    Statement s = conn.createStatement();
                                    String sql = "select * from evento order by id desc";
                                    
                                    
                                    try {
                                        ResultSet rs = s.executeQuery(sql);                                       
                                        while(rs.next()) {                                           
                                            evento.setId(rs.getInt(1));
                                            evento.setTitulo(rs.getString(2));
                                            blob = rs.getBlob(3);
                                            bdata = blob.getBytes(1, (int)blob.length());
                                            descripcion = new String(bdata);
                                            evento.setDescripcion(descripcion);                       
                                            evento.setFecha(rs.getString(4));
                                            evento.setHorario(rs.getString(5));
                    %>
                        
                        <div class="col-sm-6 col-md-3">
                          <div class="thumbnail">
                              
                              <img src="img/eventos/<%= rs.getString(7) %>" alt="Imagen">
                              
                            <div class="caption">
                                <h3 class="titulo"><%= evento.getTitulo() %></h3>
                              <p class="des"><%= evento.getDescripcion() %></p>
                              <p class="pull-left" style="color: #8c8c8c"> Dia de evento: <%= evento.getFecha() %> </p>
                              <p class="pull-left" style="color: #8c8c8c"> Horario: <%= evento.getHorario() %> </p>
                              <br>
                              <p class="pull-right">
                                  <a href="ServletEvento?text=editar&amp;id=<%= evento.getId()%>" class="btn btn-info btn-xs" role="button" data-toggle="tooltip" data-placement="top" title="Editar"><i class="material-icons">mode_edit</i></a> 
                                  <a href="ServletEvento?text=eliminar&amp;id=<%= evento.getId()%>" class="btn btn-danger btn-xs" data-toggle="confirmation" data-singleton="true" data-popout="true" data-btn-ok-label="Eliminar" data-btn-ok-class="btn-danger" data-title="Eliminar" data-placement="top" title="Eliminar"><i class="material-icons">delete</i></a>
                              </p>
                              <div class="clearfix"></div>
                            </div>
                          </div>
                         
                          
                        </div>
                 
                    <%
                        
                                        }
                                    } 
                                        finally { s.close(); }
                                }catch (SQLException e) {
                                        System.out.println("No se encontró noticia: " + e.getMessage());
                                }finally { conn.close(); }
                            }
                       
                    %>
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
        $("#evento").addClass("active");
         
         $(function () {
            $('[data-toggle="tooltip"]').tooltip();
         });
         
         $(function(){
            $(".titulo").each(function(){
              len=$(this).text().length;
              if(len>15)
              {
                $(this).text($(this).text().substr(0,15)+'...');
              }
            }); 
            
            $(".des").each(function(){
              len=$(this).text().length;
              if(len>40)
              {
                $(this).text($(this).text().substr(0,40)+'...');
              }
            });
        });
        
        $('[data-toggle=confirmation]').confirmation({
            rootSelector: '[data-toggle=confirmation]',
            // other options
            
        });
         
     </script>
    </body>
</html>
