<%
    if (session.getAttribute("empleadoID") == null ) {
        
        response.sendRedirect("index.jsp");
    }
%>
<%@page import="java.util.Locale"%>
<%@page import="org.joda.time.DateTime"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="classes.Conexion"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Asambleas</title>
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/custom-navbar.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLES-->
        <link href="css/font-awesome.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Assistant">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Lato">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Lora">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Cairo">
        
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
        span {
            font-size: 20px;
            font-family: "open Sans";
        }
        </style>
    </head>
    <body>
        <%@include file="srcJsp/navbar.jsp" %>
        
        <!-- SECCION EVENTO -->
        
        <br style="margin-top: 60px;">
        
        <div class="seccion-noticia">
            <h3>Asambleas</h3>
            <div class="panel panel-primary">
                <div class="panel-heading">
                  <h2 class="panel-title">Asambleas más recientes</h2>
                </div>
                <div class="panel-body">
                    <%
                    int perPage = 2;
                    int limit = 0;
                    int pages = 1;
                        if(request.getParameter("page") != null)
                            pages = Integer.parseInt(request.getParameter("page"));
                    
                    Conexion conexion = new Conexion();
                    Connection conn = conexion.Conexion();
                    Statement s;
                    
                    try {
                        String sql = "select * from asamblea order by asambleaID desc limit " + (pages-1)*perPage + ", " + perPage ;
                        s = conn.createStatement();
                        
                        ResultSet rs = s.executeQuery(sql);
                        while(rs.next()) {


                    %>
                    
                    <div class="noticia">
                        <div class="panel panel-default">                       
                            <div class="panel-body">
                                <div class="row">
                                    <div class="page-header">
                                        <h1 style="margin-left: 20px;"><%= rs.getString("titulo")%> &nbsp; 
                                            
                                            
                                       
                                        </h1>
                                        <br />
                                        <span title="Tipo de asamblea" style="margin-left: 20px;">
                                            <i class="material-icons">stars</i>
                                            &nbsp;<%= rs.getString("tipo")%> 
                                        </span>
                                        &nbsp;
                                        &nbsp;
                                        <span title="Fecha de asamblea">
                                            <i class="material-icons">today</i>
                                            &nbsp;<%= rs.getString("fecha")%> 
                                        </span>
                                        &nbsp;
                                        &nbsp;
                                        <span title="Hora de asamblea">
                                            <i class="material-icons" >watch_later</i>
                                            &nbsp; <%= rs.getString("hora_entrada")%> - 
                                            <%= rs.getString("hora_salida")%>
                                        </span>
                                        &nbsp;
                                        &nbsp;
                                        <span title="Lugar de asamblea">
                                            <i class="material-icons " >location_on</i>
                                            &nbsp; <%= rs.getString("lugar")%>
                                        </span>
                                        
                                    </div>
                                    <br/>
                                    <div class="col-xs-12">
                                        <p class="descr">
                                            <%
                                                String des = rs.getString("descripcion");
                                                des = des.replaceAll("\n","<br />");
                                             %>
                                             <%=des%>
                                            
                                        </p>
                                        <a href="detalle-asamblea.jsp?id=<%= rs.getString("asambleaID")%>" class="btn btn-primary btn-lg">Leer más...</a>
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
                    <li class="previous"><a href="asambleas.jsp?page=<%=pages-1%>"><i class="fa fa-angle-left"></i> &nbsp; Anterior</a></li>
                    <li class="next"><a href="asambleas.jsp?page=<%=pages+1%>">Siguiente &nbsp; <i class="fa fa-angle-right"></i></a></li>
                </ul>
              </nav>
        </div>
                
        <!-- BOOTSTRAP SCRIPTS -->
        <script src="js/bootstrap.js"></script>
        <!-- METISMENU SCRIPTS -->
        <script src="js/jquery.metisMenu.js"></script>
        <script>
            $(function(){
                $(".descr").each(function(){
                  len=$(this).text().length;
                  if(len>900)
                  {
                    $(this).text($(this).text().substr(0,900)+'...');
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
