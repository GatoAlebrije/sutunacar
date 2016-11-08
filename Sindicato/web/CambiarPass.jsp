
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cambiando contraseña</title>
        
        <!--Custom css-->
        <link href="css/custom-navbar.css" rel="stylesheet" />
        <link href="css/admin.css" rel="stylesheet" />
        
        <link href="css/bootstrap.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLES-->
        
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/jquery.validate.min.js"></script>
    </head>
    <body>
        <%@include file="srcJsp/navbar.jsp" %>
        
        <div class="container-fluid" style="margin-top: 30px;">
            <div class="row">
                <div class="col-md-9 col-md-offset-3 main ">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Cambiando contraseña</h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-8 col-md-offset-1">
                            <form action="ServletPassword" id="changePasswordForm" name="changePasswordForm" method="post">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Antigua contraseña</label>
                                            <input type="password" class="form-control" name="oldPass" required>
                                            <%
                                                if(request.getParameter("error") != null){
                                                    
                                                
                                            %>
                                            <p style="color: red;">Contraseña incorrecta</p>
                                            <%}%>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Nueva contraseña</label>
                                            <input type="password" id="password" class="form-control" name="password" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Confirmar contraseña</label>
                                            <input type="password" id="confirmpassword" class="form-control" name="confirmpassword" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <input type="submit"  class="btn btn-primary btn-lg pull-right" value="Aceptar">
                            
                                </div>
                                </form>
                        </div>
                    </div>
                   
                </div>
            </div>
        </div>
    <!-- BOOTSTRAP SCRIPTS -->
    <script src="js/bootstrap.js"></script>
    <script src="js/bootstrap-confirmation.js"></script>  
    <script>
        $(document).ready(function() {

            $("#changePasswordForm").validate({
                rules: {
                    password: {
                        //required: true,
                        minlength: 6
                    },
                    confirmpassword: {
                        equalTo: "#password"
                    }
                },
                messages: {
                    password: {
                        required: "Contraseña es requerida"
                        // minlength: 5 // <- this must be a string!
                    },
                    confirmpassword: {
                        required: "Contraseña requerida"
                        // minlength: 5 // <- this must be a string!
                    }
                }
                
            });

        });

    </script>
    </body>
</html>
