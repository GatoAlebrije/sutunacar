
<%@ include file="session.jsp"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="classes.Conexion"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrador</title>
        
        <!--Custom css-->
        <link href="css/custom-navbar.css" rel="stylesheet" />
        <link href="css/admin.css" rel="stylesheet" />
        
        <link href="css/bootstrap.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLES-->
        <link href="css/font-awesome.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        
       
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Lato">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Baloo"> <!--NAV-->
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Chathura">
        
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Metrophobic"> <!--Tabla-->
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Cairo">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=NTR">
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
                            <h1 class="page-header">Resumen</h1>
                        </div>
                    </div>
                    <%
                    Conexion conexion = new Conexion();
                    Connection conn = conexion.Conexion();
                    Statement s = conn.createStatement();
                    int activos = 0;
                    int jubilados = 0;
                    String sql = "select count(*) from empleado where estatusID = 1";
                    ResultSet rs = s.executeQuery(sql);
                    if(rs.next()) {
                        activos = rs.getInt(1);
                    }
                    s.close();
                    s = conn.createStatement();
                    sql = "select count(*) from empleado where jubilacion = 'true'";
                    rs = s.executeQuery(sql);
                    if(rs.next()) {
                        jubilados = rs.getInt(1);
                    }
                    s.close();
                    %>
                    
                    
                    <!-- Paneles resumen -->
                    <div class="row">
                        <div class="col-lg-3 col-md-6">
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="icon-panel material-icons">person</i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <h2><%=activos%></h2>
                                            <p>Total socios activos</p>
                                        </div>
                                    </div>
                                </div>
                                <a href="resumen.jsp?resumen=activos">
                                    <div class="panel-footer">
                                        <span class="pull-left">Ver Detalles</span>
                                        <i class="pull-right material-icons">info</i>
                                        <div class="clearfix"></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        
                        <div class="col-lg-3 col-md-6">
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="icon-panel material-icons">person</i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <h2><%=jubilados%></h2>
                                            <p>Socios jubilados</p>
                                        </div>
                                    </div>
                                </div>
                                <a href="resumen.jsp?resumen=jubilados">
                                    <div class="panel-footer">
                                        <span class="pull-left">Ver Detalles</span>
                                        <i class="pull-right material-icons">info</i>
                                        <div class="clearfix"></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <!--                 
                        <div class="col-lg-3 col-md-6">
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="icon-panel material-icons">insert_chart</i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <h2>26</h2>
                                            <p>New Comments!</p>
                                        </div>
                                    </div>
                                </div>
                                <a href="#">
                                    <div class="panel-footer">
                                        <span class="pull-left">Ver Detalles</span>
                                        <i class="pull-right material-icons">info</i>
                                        <div class="clearfix"></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="icon-panel material-icons">nature_people</i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <h2>26</h2>
                                            <p>New Comments!</p>
                                        </div>
                                    </div>
                                </div>
                                <a href="#">
                                    <div class="panel-footer">
                                        <span class="pull-left">Ver Detalles</span>
                                        <i class="pull-right material-icons">info</i>
                                        <div class="clearfix"></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        -->                    
                                            
                    </div>
                    <hr>
                    
                    <!--***** Importing table *****-->
                    <%@include file="srcJsp/table.jsp" %>
                </div>
            </div>
        </div>
        
      
     <!-- BOOTSTRAP SCRIPTS -->
     <script src="js/bootstrap.js"></script>
     <!-- METISMENU SCRIPTS -->
     <script src="js/jquery.metisMenu.js"></script>     
     <script src="js/tableScript.js"></script>
     <script src="js/simplePagination.js"></script>
     
     <script>
        $("#dashboard").addClass("active");
        $('#tabla tr:contains("Inactivo")').addClass("danger");
        
        $(function() {
            $("#tabla").simplePagination({
                
		previousButtonClass: "btn btn-default",
		nextButtonClass: "btn btn-default"
            });
	});   
    
        $("#btn-refresh").on("click", function() {
            $( "#tabla" ).load( "admin.jsp #tabla" );
         });
         
        
    </script> 
    
    </body>
</html>
