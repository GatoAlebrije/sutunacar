<%@include file="session.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@page import="java.util.Calendar"%>
<%
    String[] mes = {"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Publicar evento</title>
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
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2" style="margin-top: 20px">
                    <%@include file="srcJsp/nav-admin.jsp" %>
                </div>
                <div class="col-md-10 main">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Publicar evento</h1>
                        </div>
                    </div>
                    <%
                        String method = request.getParameter("method");
                        String id;
                        String titulo;
                        String descripcion;
                        
                        if (method.equals("agregar")) {
                            id = "";
                            titulo = "";
                            descripcion = "";
                            
                        }
                        else {
                            id = request.getAttribute("id").toString();
                            titulo = request.getAttribute("titulo").toString();
                            descripcion = request.getAttribute("descripcion").toString();
                            
                            method = "editar";
                        }    
                    %>                    
                    <div class="row">
                        <div class="col-md-9 col-md-offset-1">
                            <form action="ServletEvento" method="post"  enctype="multipart/form-data">
                                <div class="form-group">
                                    <input name="id" value="<%=id%>" hidden>
                                    <input name="text" value="<%=method%>" hidden>
                                    <label>Titulo</label>
                                    <input type="text" name="titulo" value="<%=titulo%>" class="form-control" placeholder="Titulo" autocomplete="off" autofocus required>
                                </div>
                                <div class="form-group">
                                    <label>Descripción</label>
                                    <textarea class="form-control" name="descripcion"  rows="6" required><%=descripcion%></textarea>
                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>Fecha del evento</label>
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
                                                        for(int i=0; i < mes.length; i++) {
                                                            if (i == Calendar.getInstance().get(Calendar.MONTH))
                                                                out.print("<option value=\"" + mes[i] + "\" selected>" + mes[i] + "</option>");
                                                            else
                                                                out.print("<option value=\"" + mes[i] + "\">" + mes[i] + "</option>");
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
                                <hr />
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-2">
                                                      <label>Horario entrada</label>
                                                        <select name="hora" id="checkRow" class="form-control" >  
                                                            <%for(int i=7; i<=22; i++){   
                                                            %>
                                                                <option value="<%=i%>:00 hrs"><%=i%>:00 hrs</option>
                                                            <%}%>                                                    
                                                        </select>   
                                            </div>
                                            <div class="col-md-2">
                                                    <label>Horario salida</label>
                                                    <select name="hora2" id="checkRow" class="form-control" >  
                                                            <%for(int i=7; i<=22; i++){   
                                                            %>
                                                                <option value="<%=i%>:00 hrs"><%=i%>:00 hrs</option>
                                                            <%}%>                                                    
                                                    </select>   
                                            </div> 
                                        </div>
                                    </div>
                                </div>                    
                                <br>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Insertar foto</label>
                                            <input type="file" name="foto" required>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <button type="submit" class="pull-right btn btn-info btn-lg"><i class="pull-left material-icons" style="margin-top: -3px">done</i> &nbsp;Publicar</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                
                
            </div>
        </div>
        <script>
            $("#evento").addClass("active");                                              
        </script>
    </body>
</html>
