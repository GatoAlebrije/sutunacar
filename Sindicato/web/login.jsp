<%
    if (session.getAttribute("empleadoID") != null ) {
        response.sendRedirect("index.jsp");
    } 
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar sesión</title>
        
        <!-- BOOTSTRAP STYLES-->
        <link href="css/bootstrap.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLES-->
        <link href="css/font-awesome.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!-- GOOGLE FONTS-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
        
        
        
    </head>
    <body>
        <div class="container">
        <div class="row text-center " style="padding-top:100px;">
        <div class="col-md-12">
            <img src="img/logo-invoice.png" />
        </div>
        </div>
            <%
               String error = "";
               if(null != request.getAttribute("error")) {
                   error = request.getAttribute("error").toString();
               }
                
            %>
        <div class="row ">
            <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
                <div class="panel-body">
                    <form action="ServletSession" method="post" role="form">
                        <hr />
                        <h5>Ingresa tus datos para entrar</h5>
                        <br />
                        <div class="form-group input-group">
                            <span class="input-group-addon"><i class="fa fa-user" ></i></span>
                            <input type="text" name="numero" class="form-control" autocomplete="off" autofocus placeholder="Número de trabajador " />
                        </div>
                        <div class="form-group input-group">
                            <span class="input-group-addon"><i class="fa fa-lock"  ></i></span>
                            <input type="password" name="pass" class="form-control"  placeholder="Contraseña" />
                        </div>
                        <%
                            if (error.equals("true")) {
                        %>
                        <p style="color: red">Usuario o contrañesa incorrectos</p>
                        <%
                            }
                        %>
                        <!--
                        <div class="form-group">
                            <label class="checkbox-inline">
                                <input type="checkbox" /> Recordarme
                            </label>
                            <span class="pull-right">
                                <a href="index.jsp" >¿Olvidaste tu contraseña? </a> 
                            </span>
                        </div>
                        -->
                        <input type="submit" class="btn btn-primary" style="width: 100%" value="Iniciar sesión">
                        
                    </form>
                </div>
            </div>
        </div>
        </div>
    </body>
</html>
