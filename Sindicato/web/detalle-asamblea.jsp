<%
    if (session.getAttribute("empleadoID") == null ) {
        
        response.sendRedirect("index.jsp");
    }
%>
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
            background-color: white;
            
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
           font-family: "Open Sans";
           font-size: 15px;
           margin-left: 10px;
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
        <!-- SECCION ASAMBLEA -->
        <br style="margin-top: 60px;">
       
        
        <ol class="breadcrumb ruta">
            <li><a href="asambleas.jsp">Asambleas</a></li>
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
                String sql = "select * from asamblea where asambleaID = " +  id;
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
                    
                    <span title="Tipo de asamblea">
                        <i class="material-icons">stars</i>
                        &nbsp;<%= rs.getString("tipo")%> 
                    </span>
                    <%
                        d = new DateTime(rs.getDate("fecha"));

                        fecha = d.getDayOfMonth() + "/" + d.monthOfYear().getAsText(new Locale("es", "ES")) + "/" + d.getYear();

                    %>
                    <span title="Fecha de asamblea">
                        <i class="material-icons">today</i>
                        &nbsp;<%= fecha%> 
                    </span>
                    <span title="Hora de asamblea">
                        <i class="material-icons" >watch_later</i>
                        &nbsp; <%= rs.getString("hora_entrada")%> -
                        <%= rs.getString("hora_entrada")%>
                    </span>
                    <span title="Lugar de asamblea">
                        <i class="material-icons">location_on</i>
                        &nbsp;<%= rs.getString("lugar")%> 
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
            <br />
            </div>
            <h2 style="text-align: center;">Minutas Escaneadas</h2>
            <div class="col-md-12 ">
            <hr />
                <table id="tablaMinuta" class="table table-striped">
                    <thead>
                        <tr>
                            <th>Titulo</th>
                            <th>Tipo</th>
                            <th>Número de Acta</th>
                            <th>Fecha</th>
                            
                        </tr>
                    </thead>
                    <tbody>
            <%
            s.close();
            s = conn.createStatement();
            sql = "select formatoID, path, titulo, numActa, fecha,tipo from pathformato where asambleaID = " + request.getParameter("id");
            rs = s.executeQuery(sql);                                       
            while(rs.next()) {   
                d = new DateTime (rs.getDate("fecha"));
                fecha = d.getDayOfMonth() + "/" + d.monthOfYear().getAsText(new Locale("es", "ES")) + "/" + d.getYear();
                            
            %>
            
                        <tr>
                           <td><a href="minutas/<%=rs.getString("path")%>"><%=rs.getString("titulo")%></a></td>
                           <td><%=rs.getString("tipo")%></td>
                           <td><%=rs.getString("numActa")%></td>
                           <td><%=fecha%></td>
                        </tr>
        
        <%
            }
                }
                s.close();
                conn.close();
            } catch(SQLException e) {
                 e.printStackTrace();
            }
        %>
                     </tbody>
                </table>
            </div>
        <br/>
        
        <!-- BOOTSTRAP SCRIPTS -->
        <script src="js/bootstrap.js"></script>
        
    </body>
</html>
