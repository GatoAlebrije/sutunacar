<%@include file="session.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="classes.Conexion"%>
<%@page import="org.joda.time.DateTime"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Permisos</title>
        
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
                            <h1 class="page-header">Confirmar Permisos y Licencias</h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-8">
                            <form action="ServletPermisos" method="post">
                            <%
                                String method = request.getParameter("method");
                                if (method.equals("permiso")) {
                            %>
                            
                            <input type="text" name="id" value="<%=request.getAttribute("permisoID")%>" hidden>
                            <input type="text" name="text" value="editarPermiso" hidden>
                            
                            <%
                                }
                                else if(method.equals("licencia")) {
                            %>
                            <input type="text" name="id" value="<%=request.getAttribute("licenciaID")%>" hidden>
                            
                            <input type="text" name="text" value="editarLicencia" hidden>
                            <%
                                }
                            %>
                            <input type="text" name="empleadoID" value="<%=request.getAttribute("empleadoID")%>">
                            <p><%=request.getAttribute("fecha_elaboracion")%></p>
                            <p><%=request.getAttribute("tipo")%></p>
                            <p><%=request.getAttribute("fecha_inicio")%></p>
                            <p><%=request.getAttribute("fecha_fin")%></p>
                            <p><%=request.getAttribute("motivo")%></p>
                            <p><%=request.getAttribute("dias")%></p>
                            <label>Tipo</label>
                            <select name="confirmar" class="form-control">
                                <option value="Confirmado" selected>Confirmado</option>
                                <option value="Pendiente">Pendiente</option>
                                                
                            </select>
                            <div class="form-group">
                                <label>Observaciones</label>
                                <input type="text" name="observaciones" value="<%= request.getAttribute("observaciones") %>"  class="form-control">
                            </div>
                            <input type="submit" value="Continuar">
                            </form>
                        </div>
                    <br>
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
