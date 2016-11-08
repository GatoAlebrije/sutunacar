<%
    if (session.getAttribute("empleadoID") == null ) {
        response.sendRedirect("index.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Descargar permiso</title>
        
        <!-- Custom styles-->
        <link href="css/custom-navbar.css" rel="stylesheet" />
        
        <link href="css/custom.css" rel="stylesheet" />
        
        <link href="css/bootstrap.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLES-->
        <link href="css/font-awesome.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    
    </head>
    <body>
        <%@include file="srcJsp/navbar.jsp" %>
        <%
            String empleadoID = session.getAttribute("empleadoID").toString();
        %>
        
        <div class="container" style="margin-top: 80px; padding: 50px 140px;">
            <div class="alert alert-info" role="alert">
                <p style="font-size: 18px;"><i class="material-icons pull-left" >info</i> 
                    &nbsp;<strong>Tu solicitud ha sido enviada.</strong> 
                    <br />
                    <br />
                    Ya puedes proceder a descargar tu formato de permiso o licencia.
                    
                    Una vez descargado asegurate de que todos los datos esten
                    correctos y marcar de nuevo el motivo por el que lo solicitaste.
                    <br />
                </p>
                <div class="row">
                    <div class="col-lg-7 col-lg-offset-4">
                        <a href="permisos/solicitud_<%=empleadoID%>.xlsx" class="btn btn-primary btn-lg" style="margin-top: 40px;" download>
                            <i class="material-icons pull-left">cloud_download</i>
                            &nbsp;Descargar formato
                        </a>
                    </div>
                    
                </div>
                    
                
                <br>

            </div>
        </div>
        
        <!-- BOOTSTRAP SCRIPTS -->
        <script src="js/bootstrap.js"></script>  
    </body>
</html>
