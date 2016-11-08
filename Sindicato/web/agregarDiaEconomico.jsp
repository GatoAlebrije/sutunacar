<%
    if (session.getAttribute("empleadoID") != null ) {
        response.sendRedirect("index.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar día económico</title>
        
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
        <%
            String[] mes = {"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};
        %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2" style="margin-top: 20px">
                    <%@include file="srcJsp/nav-admin.jsp" %>
                </div>
                <div class="col-md-10 main">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Agregar día económico</h1>
                        </div>
                    </div>
                    <%
                        String method = request.getParameter("method");
                        String id;
                        String user = "";
                        
                        String motivo;
                        if (method.equals("agregar")) {
                            id = request.getParameter("id");
                            motivo = "";
                        }
                        else {
                            id = request.getAttribute("economicoID").toString();
                            user = request.getAttribute("id").toString();
                            motivo = request.getAttribute("motivo").toString();
                            method = "editar";
                        }    
                    %>                   
                    <div class="row">
                        <div class="col-md-8 col-md-offset-1">
                            <form action="ServletEconomico" method="post">
                                <div class="form-group">
                                    <input name="id" value="<%=id%>" hidden>
                                    <input name="user" value="<%=user%>" hidden>
                                    <input name="text" value="<%=method%>" hidden>
                                    
                                </div>
                                
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>Fecha de inicio</label>
                                        <div class="row">                                          
                                                <div class="col-md-2">
                                                    <select name="dia" id="dia" class="form-control">
                                                        <% for(int i=1;i<32;i++) {
                                                            if (i == Calendar.getInstance().get(Calendar.DAY_OF_MONTH))
                                                                out.print("<option value=\"" + i + "\" selected>" + i + "</option>");
                                                            else
                                                                out.print("<option value=\"" + i + "\">" + i + "</option>");
                                                        }
                                                        %>
                                                       
                                                    </select>
                                                </div>
                                                <div class="col-md-3">
                                                    <select name="mes" id="mes" class="form-control">
                                                    <%
                                                        for(int i=1; i <= mes.length; i++) {
                                                            if (i == Calendar.getInstance().get(Calendar.MONTH))
                                                                out.print("<option value=\"" + i + "\" selected>" + mes[i-1] + "</option>");
                                                            else
                                                                out.print("<option value=\"" + i + "\">" + mes[i-1] + "</option>");
                                                        }
                                                    %>
                                                    </select>
                                                </div>
                                                <div class="col-md-2">
                                                    <%
                                                        int año = Calendar.getInstance().get(Calendar.YEAR);
                                                    %>
                                                    <select name="anio" id="anio" class="form-control">
                                                        <option value="<%= año %>"><%= año %></option>
                                                    </select>
                                                </div>
                                        </div>
                                    </div>  
                                    
                                                     
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                             <label>Fecha final</label>
                                             <div class="row">                                          
                                                     <div class="col-md-2">
                                                         <select name="dia2" id="dia" class="form-control">
                                                             <% for(int i=1;i<32;i++) {
                                                                 if (i == Calendar.getInstance().get(Calendar.DAY_OF_MONTH))
                                                                     out.print("<option value=\"" + i + "\" selected>" + i + "</option>");
                                                                 else
                                                                     out.print("<option value=\"" + i + "\">" + i + "</option>");
                                                             }
                                                             %>

                                                         </select>
                                                     </div>
                                                     <div class="col-md-3">
                                                         <select name="mes2" id="mes" class="form-control">
                                                         <%
                                                             for(int i=1; i <= mes.length; i++) {
                                                                 if (i == Calendar.getInstance().get(Calendar.MONTH))
                                                                     out.print("<option value=\"" + i + "\" selected>" + mes[i-1] + "</option>");
                                                                 else
                                                                     out.print("<option value=\"" + i + "\">" + mes[i-1] + "</option>");
                                                             }
                                                         %>
                                                         </select>
                                                     </div>
                                                     <div class="col-md-2">
                                                        <select name="anio2" id="anio" class="form-control">
                                                             <option value="<%= año %>"><%= año %></option>
                                                         </select>
                                                     </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Motivo</label>
                                    <textarea  name="motivo" id="txtarea" class="form-control" rows="7" required><%=motivo%></textarea>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">                                     
                                        <button type="submit" onclick="encode" class="pull-right btn btn-info btn-lg"><i class="pull-left material-icons" style="margin-top: -3px">done</i> &nbsp;Publicar</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
           $("#usuarios").addClass("active");        
         
        </script>
    </body>
</html>
