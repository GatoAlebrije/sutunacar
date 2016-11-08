
<%@page import="java.util.Locale"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.joda.time.DateTime"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="classes.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eventos</title>
        
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/custom-navbar.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLES-->
        <link href="css/font-awesome.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        
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
        .seccion-evento{
            width: 900px;
            margin: auto;
            border: 1px solid #ccc;
            padding: 20px 50px;
            margin-bottom: 80px;
            
            -moz-box-shadow: 2px 2px 8px rgba(0, 0, 0, .2);
            -webkit-box-shadow: 2px 2px 8px rgba(0, 0, 0, .2);
            box-shadow: 2px 2px 8px rgba(0, 0, 0, .2);
        }
        
        
        .seccion-evento p{
            font-family: "Raleway";
            text-align: justify;
            text-indent: 50px;
            padding: 10px 20px;
            letter-spacing: 2px;
            line-height: 1.6;
            
        }
        .seccion-evento img{            
            width: 650px;
            height: 450px;
            margin-left: 10%;
            margin-bottom: 15px;
        }
        .fecha-evento span{
           font-family: "Cairo";
           font-size: 20px;
           margin-left: 50px;
        }
        .fecha-evento img{
            width: 25px;
            height: 25px;
        }
        .fecha{
            font-family: "Cairo";
            color: #5e5e5e;
        }
        </style>
    </head>
    <body>
        <%@include file="srcJsp/navbar.jsp" %>
        
        <!--------------------------SECCION EVENTO---------------------->
        <br style="margin-top: 60px;">
        <ol class="breadcrumb ruta">
            <li><a href="eventos.jsp">Eventos</a></li>
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
                String sql = "select * from evento where id = " +  id;
                s = conn.createStatement();
                        
                ResultSet rs = s.executeQuery(sql);
                if(rs.next()) {
        %>
        <div class="seccion-evento">
            
            <div class="titulo">
                <h1><%= rs.getString("titulo") %></h1>
                <div class="fecha-evento">
                    <br />
                    <br />
                    <span title="Fecha del evento">
                        <i class="material-icons">today</i>
                        &nbsp;<%= rs.getString("fecha")%> 
                    </span>
                    <span title="Hora del evento">
                        <i class="material-icons" >watch_later</i>
                        &nbsp; <%= rs.getString("horario")%>
                    </span>
                    <hr />
                </div>
            </div>
             
            <p>
                <%
                   String des = rs.getString("descripcion");
                   des = des.replaceAll("\n","<br />");
                %>
                <%=des%> 
            </p>
            <%
                d = new DateTime(rs.getDate("fecha_publicacion"));
                
                fecha = d.getDayOfMonth() + "/" + d.monthOfYear().getAsText(new Locale("es", "ES")) + "/" + d.getYear();
               
            %>
            <p class="fecha">Fecha de publicaci&oacute;n: <%=fecha%></p>
            <img src="img/eventos/<%=rs.getString("path")%>" alt="Imagen">
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
        
    </body>
</html>
