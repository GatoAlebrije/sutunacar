<%@include file="session.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Publicar noticia</title>
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
                            <h1 class="page-header">Publicar noticia</h1>
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
                        <div class="col-md-8 col-md-offset-1">
                            <form action="ServletNoticia" method="post"  enctype="multipart/form-data">
                                <div class="form-group">
                                    <input name="id" value="<%=id%>" hidden>
                                    <input name="text" value="<%=method%>" hidden>
                                    <label>Titulo</label>
                                    <input type="text" name="titulo" value="<%=titulo%>" class="form-control" placeholder="Titulo" autocomplete="off" autofocus required>
                                </div>
                                <div class="form-group">
                                    <label>Descripción</label>
                                    <textarea  name="descripcion" id="txtarea" class="form-control" rows="7" required><%=descripcion%></textarea>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Insertar foto</label> 
                                            <input type="file" name="foto" >
                                        </div>
                                    </div>
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
           $("#noticia").addClass("active");        
         
        </script>
    </body>
</html>
