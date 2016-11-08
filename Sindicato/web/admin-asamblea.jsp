<%@ include file="session.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Asambleas</title>
        
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
                            <h1 class="page-header">Asambleas<small> &nbsp; Publica y edita asambleas</small></h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <a href="publicar-asamblea.jsp?method=agregar" class="btn btn-info btn-lg" style="margin-left: 10px;"><i class="pull-left material-icons">add_circle</i> &nbsp; Publicar Asamblea</a>
                        </div>
                    </div>
                    <hr />
                    <!--***** Importing table *****-->
                    <%@include file="srcJsp/tableAsamblea.jsp" %>
                </div>
            </div>
        </div>
                
     <script src="js/bootstrap.js"></script>
     <script src="js/bootstrap-confirmation.js"></script>
     <!-- METISMENU SCRIPTS -->
     <script src="js/jquery.metisMenu.js"></script> 
     <script src="js/tableScript.js"></script>
     <script src="js/simplePagination.js"></script>

     <script>
         $("#asamblea").addClass("active");
         
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
