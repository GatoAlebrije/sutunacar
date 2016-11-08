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
        <title>Noticias</title>
        
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/custom-navbar.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLES-->
        <link href="css/font-awesome.css" rel="stylesheet" />
        
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
        
        .foto{
            width: 30px;
            height: 30px;
            margin-top: 9px;
            border-radius: 15px;
            background: url("foto.jpg") no-repeat;
            
            
        }
        /*-------------------SECCION NOTICIA-------------------------*/
        .ruta{
            font-family: "Assistant";
            font-size: 20px;
            color: #9e9e9e;
            text-align: left;
            margin: auto;
            margin-bottom: 6px;
            width: 900px;
            
        }
        .seccion-noticia{
            width: 900px;
            margin: auto;
            border: 1px solid #ccc;
            padding: 20px 50px;
            margin-bottom: 80px;
            
            -moz-box-shadow: 2px 2px 8px rgba(0, 0, 0, .2);
            -webkit-box-shadow: 2px 2px 8px rgba(0, 0, 0, .2);
            box-shadow: 2px 2px 8px rgba(0, 0, 0, .2);
        }
        
        .seccion-noticia p{
            font-family: "Raleway";
            text-align: justify;
            text-indent: 50px;
            padding: 10px 20px;
            letter-spacing: 2px;
            line-height: 1.6;
            
        }
        .seccion-noticia img{            
            width: 650px;
            height: 450px;
            margin-left: 10%;
            margin-bottom: 15px;
        }
        .fecha{
            font-family: "Cairo";
            color: #5e5e5e;
        }
        </style>
    </head>
    <body>
        <%@include file="srcJsp/navbar.jsp" %>
        
        <!--------------------------SECCION NOTICIA---------------------->
       
        <br style="margin-top: 60px;">
        <ol class="breadcrumb ruta">
            <li><a href="index.jsp">Noticias</a></li>
            <li class="active">Detalles</li>
        </ol>
         <%
            String id = request.getParameter("id");
            Conexion conexion = new Conexion();
            Connection conn = conexion.Conexion();
            Statement s;
            DateTime d;
            String fecha;
                    
            try {
                String sql = "select * from noticia where id = " +  id;
                s = conn.createStatement();
                        
                ResultSet rs = s.executeQuery(sql);
                if(rs.next()) {
        %>
        <div class="seccion-noticia">
            
            <h1><%= rs.getString("titulo") %></h1>
            <br>
            <p id="des">
                <%
                    String des = rs.getString("descripcion");
                    des = des.replaceAll("\n","<br />");
                %>
                <%=des%>    
            </p>
            <%
                d = new DateTime(rs.getDate("fecha"));
                
                fecha = d.getDayOfMonth() + "/" + d.monthOfYear().getAsText(new Locale("es", "ES")) + "/" + d.getYear();
               
            %>
            <p class="fecha">Fecha de publicaci&oacute;n: <%=fecha%></p>
            <img src="img/noticias/<%=rs.getString("path")%>" alt="Imagen">
        </div>
        <%
                }
                s.close();
                conn.close();
            } catch(SQLException e) {
                 e.printStackTrace();
            }
        %>
        <!-- BOOTSTRAP SCRIPTS -->
        <script src="js/bootstrap.js"></script>
        <!-- METISMENU SCRIPTS -->
        <script src="js/jquery.metisMenu.js"></script>
        <script>
            var des = $("#des").html();
            des.replace("\n", "<br />");
        </script>
    </body>
</html>
