<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="classes.Conexion"%>
<%@page import="org.joda.time.DateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Días Económicos</title>
        
        <link href="css/custom-navbar.css" rel="stylesheet" />
        <link href="css/admin.css" rel="stylesheet" />
        
        <link href="css/bootstrap.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLES-->
        <link href="css/font-awesome.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">       
      
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    </head>
    <body>
        <%@include file="srcJsp/navbar.jsp"%>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2" style="margin-top: 20px;">
                    <%@include file="srcJsp/nav-admin.jsp" %>
                </div>
                <!-- Área trabajo -->
                <div class="col-md-10 main">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Días económicos</h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <a href="agregarDiaEconomico.jsp?method=agregar&id=<%=request.getParameter("id")%>" class="btn btn-info btn-lg" style="margin-left: 10px;"><i class="material-icons pull-left">add_circle</i>&nbsp;Agregar día económico</a>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <%
                            String id = request.getParameter("id");
                            Conexion conexion = new Conexion();
                            Connection conn = conexion.Conexion();
                            //DiaEconomico de = new DiaEconomico();
                            Statement s = conn.createStatement();
                            
                            try {
                                
                                String sql = "select * from economico where empleadoID = " + id + " order by economicoID desc" ;
                                ResultSet rs = s.executeQuery(sql);
                                while(rs.next()) {
                        %>
                        <div class="col-md-4">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"><%= new DateTime(rs.getDate(3)).getYear() %></h3>
                                    </div>
                                    <div class="panel-body">
                                        <p><strong>Periodo: </strong> &nbsp;<%=rs.getDate(3)%> - <%=rs.getDate(4)%></p>
                                        <p><strong>Motivo: </strong> &nbsp;<%=rs.getString(5)%></p>
                                        <p class="pull-right">
                                            <a href="ServletEconomico?text=editar&amp;economicoid=<%= rs.getInt(1) %>&amp;id=<%= id%>" class="btn btn-info btn-xs" role="button" data-toggle="tooltip" data-placement="top" title="Editar"><i class="material-icons">mode_edit</i></a> 
                                            <a href="ServletEconomico?text=eliminar&amp;id=<%= rs.getInt(1) %>&AMP;empleadoID=<%= id%>" class="btn btn-danger btn-xs" data-toggle="confirmation" data-singleton="true" data-popout="true" data-btn-ok-label="Eliminar" data-btn-ok-class="btn-danger" data-title="Eliminar" data-placement="top" title="Eliminar"><i class="material-icons">delete</i></a>
                                        </p>
                                    </div>
                                </div>
                        </div>
                        <%
                                }
                                s.close();  
                            } catch (SQLException e) {
                                System.out.println("No se encontraron días económicos " + e.getMessage());
                            } finally { conn.close(); }
                            
                            
                        %>
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
           $("#usuarios").addClass("active");

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
