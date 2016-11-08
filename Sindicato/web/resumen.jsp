<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="classes.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="session.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resumen</title>
        
        <link href="css/custom-navbar.css" rel="stylesheet" />
        <link href="css/admin.css" rel="stylesheet" />
        
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
                    <div class="col-lg-12">
                <%
                Conexion conexion = new Conexion();
                Connection conn = conexion.Conexion();
                Statement s = null;
                ResultSet rs;
                String sql = "";
                String method = request.getParameter("resumen");
                if(method.equals("activos")) {
                    sql = "select * from empleado where estatusID = 1";
                } else if(method.equals("jubilados")) {
                    sql = "select * from empleado where jubilacion = 'true'";
                }
                
                %>
                    <h1 class="page-header">Socios activos</h1>
                    <!-- Tabla usuario -->
<table id="tabla" class="table table-striped">
    <thead>
        <tr>
            
            
            <th>#</th>
            <th>Nombre</th>
            <th>Estatus</th>
            <th>Puesto</th>
            <th>Area</th>
            <th>Email</th>
            <th>Teléfono</th> 
            
                </tr>
            </thead>
            <tbody>
                <%
                        s = conn.createStatement();
                        rs = s.executeQuery(sql); 
                        while(rs.next()) {
                %>
                <tr>
                    <td><a href="ServletUsuario?num=<%=rs.getString(1)%>"> <%=rs.getString(1)%></a></td>
                    <td><%=rs.getString("nombre")%>&nbsp;<%=rs.getString("apeMaterno")%>&nbsp;<%=rs.getString("apePaterno")%></td>
                    <!--Imprimir estatus-->
                    <%
                        sql = "select estatus from estatus where estatusID = " + rs.getString("estatusID");
                        Statement s0 = conn.createStatement();
                        ResultSet rs0 = s0.executeQuery(sql);
                        if (rs0.next()) {
                    %>
                        <td><%=rs0.getString(1)%></td>
                    <%
                        }
                        s0.close();

                    %>

                    <!--Imprimir puesto-->
                    <%
                        sql = "select puesto from puesto where puestoID = " + rs.getString("puestoID");
                        Statement s2 = conn.createStatement();
                        ResultSet rs2 = s2.executeQuery(sql);
                        if (rs2.next()) {
                    %>
                        <td><%=rs2.getString(1)%></td>
                    <%
                        }
                        s2.close();

                    %>
                    <!--Imprimir area-->
                    <%
                        sql = "select nombre from area where areaID = " + rs.getString("areaID");
                        Statement s3 = conn.createStatement();
                        ResultSet rs3 = s3.executeQuery(sql);
                        if (rs3.next()) {
                    %>
                        <td><%=rs3.getString(1)%></td>
                    <%
                        }
                        s3.close();
                    %>
                    <!--email-->
                    <td><%=rs.getString("email")%></td>
                    <!--telefono-->
                    <%
                        if(rs.getString("telefono") != null) {
                    %>
                    <td><%=rs.getString("telefono")%></td>
                    <%
                        } else {
                    %>
                    <td><%=rs.getString("tel_casa")%></td>
                    <%
                        }
                    %>
                </tr>
                <%
                        }         
                %>      

            </tbody>                         
        </table>
        <%
                      s.close();
                      conn.close();
        %>
                  
                
                    </div>
                </div>
                
                
                
            </div>
        </div>
    </body>
</html>
