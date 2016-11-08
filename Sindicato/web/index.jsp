  
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="classes.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sindicato Único de Trabajadores</title>
        <!--Custom css-->
        <link href="css/custom-navbar.css" rel="stylesheet" />
        
        
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet" />
        
        <!-- FONTAWESOME STYLES-->
        <link href="css/font-awesome.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        
        <!--Google icons-->
        
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        
        <!-- Custom styles for this template -->
       
        
        
        <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Raleway:400,300,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Assistant">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Droid+Serif">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Cairo">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Arvo">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <style>
        body{
            margin: 0;
            padding: 0;
        }
               
        
        /*-------------------------SECCION NOTICIA----------------------------*/
        .ruta{
            font-family: "Assistant";
            color: #9e9e9e;
            text-align: left;
            margin: auto;
            margin-bottom: 6px;
            width: 900px;
            
        }
        .titulo-pagina{
            width: 888px;
            height: 50px;
            background-color: rgb(20,30,36);
            margin:auto;
            
            padding-left: 10px;
            padding-bottom: 10px;
            font-size: 20px;
            text-align: left;
            color: white;
            font-family: "Cairo", serif;
            border: 1px solid #ccc;
            
        }
        .seccion-noticia{
            width: 1000px;
            overflow: auto;
            
            margin: auto;
            margin-bottom: 30px;
            background-color: white;
            
            /*-moz-box-shadow: 2px 2px 8px rgba(0, 0, 0, .2);
            -webkit-box-shadow: 2px 2px 8px rgba(0, 0, 0, .2);
            box-shadow: 2px 2px 8px rgba(0, 0, 0, .2);*/
            
                
        }
        /*.seccion-noticia a{
            background-color: #2b844d;
            color: white;
            padding: 14px 16px;
            text-decoration: none;
            border-radius: 5px;
            transition: 0.2s;
            
        }
        .seccion-noticia a:hover{
            background-color: #349e5c;
        }*/
        .noticia-relevante{
                       
            overflow: auto;          
            text-align: justify;  
            
        }        
        .noticia-relevante a{
            float: right;
            
            
        }        
        .noticia-relevante p{
            font-family: "Assistant";
            font-size: 18px;
        }
        .noticia-relevante h1{
            font-family: "Arvo";
        }
        
        .noticia{
            display: inline-block;             
            overflow: auto;
            text-align: justify;
        }        
        .noticia a{
            float: right;            
        }
        .noticia h3{                      
            font-family: "Cairo";            
        }
        .noticia p{
            font-family: "Assistant", serif;
            font-size: 16px;
            color: #333333;
        }       
        .footer{
            padding: 15px 46px;
            width: 100%;
            height: 80px;
            background-color: #05080a;
        }
        </style>
    </head>
    <body>
         
        <!-- import navbar -->
        <%@ include file="srcJsp/navbar.jsp" %>  
        
        
                
        <!-- SECCION NOTICA -->
                           
        <br style="margin-top: 60px;">
        
        
        <div class="seccion-noticia">
            <h3>Noticias</h3>
            <div class="panel panel-primary">
                <div class="panel-heading">
                  <h2 class="panel-title">Noticias más recientes</h2>
                </div>
                <div class="panel-body">
                    <%
                    int perPage = 3;
                    int limit = 0;
                    int pages = 1;
                        if(request.getParameter("page") != null)
                            pages = Integer.parseInt(request.getParameter("page"));
                    
                    Conexion conexion = new Conexion();
                    Connection conn = conexion.Conexion();
                    Statement s;
                    
                    try {
                        String sql = "select * from noticia order by fecha desc limit " + (pages-1)*perPage + ", " + perPage ;
                        s = conn.createStatement();
                        
                        ResultSet rs = s.executeQuery(sql);
                        while(rs.next()) {


                    %>
                    <div class="noticia">
                        <div class="panel panel-default">                       
                            <div class="panel-body">
                                <div class="row">
                                    <div class="page-header">
                                        <h1 style="margin-left: 20px;"><%= rs.getString("titulo")%></h1>
                                    </div>
                                    <div class="col-xs-4 col-md-5">
                                        <a href="detalle-noticia.jsp?id=<%=rs.getInt("id")%>" class="thumbnail">
                                          <img src="img/noticias/<%= rs.getString("path")%>" alt="">
                                        </a>
                                    </div>
                                    <div class="col-xs-7">
                                        <p class="descr">
                                            <%
                                                String des = rs.getString("descripcion");
                                                des = des.replaceAll("\n","<br />");
                                            %>
                                            <%=des%> 
                                        </p>
                                        <a href="detalle-noticia.jsp?id=<%=rs.getInt("id")%>" class="btn btn-primary">Leer más...</a>
                                    </div>                                    
                                </div>                            
                            </div>                                                        
                        </div> 
                    </div>
                    <%
                            limit++;
                            }
                        s.close();
                        conn.close();
                    } catch(SQLException e) {
                        e.printStackTrace();
                    }
                    %>
                </div>
            </div>
            <nav aria-label="...">
                <ul class="pager">
                    <li class="previous"><a href="index.jsp?page=<%= pages-1%>"><i class="fa fa-angle-left"></i> &nbsp; Anterior</a></li>
                    <li class="next"><a href="index.jsp?page=<%= pages+1%>">Siguiente &nbsp; <i class="fa fa-angle-right"></i></a></li>
                </ul>
              </nav>
        </div>
        
        <div class="footer container">
            <div class="row">
                <div class="col-xs-5">
                    <i class="fa fa-map-marker">&nbsp Dirección</i> 
                </div>
            </div>
        </div>
        
        <!-- BOOTSTRAP SCRIPTS -->
        
        <script src="js/bootstrap.js"></script>
        <!-- METISMENU SCRIPTS -->
        
        
        <script src="js/jquery.metisMenu.js"></script>
        <script>
            $(function(){
                $(".descr").each(function(){
                  len=$(this).text().length;
                  if(len>500)
                  {
                    $(this).text($(this).text().substr(0,500)+'...');
                  }
                });
            });
            
            var pages = <%=pages%>;
            if (pages === 1) {
                $(".previous").addClass("hidden");
            }
            var limit = <%= limit %>;
            var perPage = <%=perPage%>
            if (limit < perPage) 
                $(".next").addClass("hidden");
            
            
        </script>
    </body>
</html>
