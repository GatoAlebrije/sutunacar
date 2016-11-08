<%@page import="classes.Conexion"%>
<%@ include file="session.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrar Usuarios</title>
        
        <!--Custom css-->
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
                <div class="col-md-10 main">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Miembros </h1>
                        </div>
                    </div>
                    
                    <!-- Opciones de administración de usuarios -->
                    <div class="row">
                        <div class="col-md-12">
                            <a href="registrar.jsp?method=agregar" class="btn btn-danger btn-lg">
                                <i class="pull-left material-icons">person_add</i>&nbsp; Agregar
                            </a>
                        </div>
                    </div>
                    <hr>
                    
                    <!--***** Importing table *****-->
                    <%
                    Conexion conexion = new Conexion();
                    Connection conn = conexion.Conexion();
                    Statement s = null;
                    String sql = "";
                    ResultSet rs = null;
                    %>
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
           $("#usuarios").addClass("active");
           $('#tabla tr:contains("Inactivo")').addClass("danger");
            
        $(function() {
            $("#tabla").simplePagination({               
                perPage: 6,
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
