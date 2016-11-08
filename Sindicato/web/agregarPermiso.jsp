<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="classes.Conexion"%>
<%@page import="org.joda.time.DateTime"%>
<%
    if (session.getAttribute("empleadoID") == null ) {
        
        response.sendRedirect("index.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Permiso</title>
        
        <!-- Custom styles-->
        <link href="css/custom-navbar.css" rel="stylesheet" />
        
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
        
        <div class="container-fluid" style="margin-top: 30px;">
            <div class="row">
                
                <%
                        String text = request.getParameter("text");
                %>
                <div class="col-md-9 col-md-offset-3 main ">
                    <div class="row">
                        <div class="col-lg-12">
                            <%
                            if(text.equals("permiso")){
                            %>
                            <h1 class="page-header">Agregando Permiso</h1>
                            
                            <%
                            }
                            else if(text.equals("licencia")) {
                            %>
                            <h1 class="page-header">Agregando Licencia</h1>
                            <%
                            }
                            %>
                        </div>
                    </div>
                     
                    <%
                        Conexion conexion = new Conexion();
                        Connection conn = conexion.Conexion();
                        DateTime date = new DateTime();
                        String sql = "select dias from permiso where empleadoID = " 
                            + request.getAttribute("id") 
                            + " and tipo = 'Economico' "
                            + "and confirmacion = 'Confirmado' "
                            + "and YEAR(fecha_elaboracion) = '" + date.getYear() + "'";
                            int dias = 0;
                            try {
                                Statement s = conn.createStatement();
                                ResultSet rs = s.executeQuery(sql);
                                while(rs.next()) {
                                    dias += rs.getInt("dias");
                                }
                                s.close();
                            } catch (SQLException e) {
                                System.out.println("No se encontró usuario: " + e.getMessage());
                            }
                                            
                                            
                    %>
                    <div class="alert alert-info" role="alert">
                        <p style="font-size: 18px;"><i class="material-icons pull-left" >info</i> 
                            &nbsp; Has usado <strong><%=dias%> días económicos</strong> 
                            confirmados este año <strong><%=date.getYear()%></strong>
                            <br />
                        </p>
                        <br>
                    </div>    
                        
                        
                        
                    <div class="row">
                        <div class="col-md-8 col-md-offset-1">
                            <form action="ServletPermisos" method="post">
                                <div class="form-group">
                                    
                                    <input name="text" value="<%=text%>" hidden>
                                    
                                </div>
                                
                                <!-- Opciones de permisos -->
                                <%
                                if(text.equals("permiso")) {
                                %>
                                 <div class="row">
                                    <div class="col-md-12">
                                        <label>Tipo</label>
                                        <div class="row">                                          
                                            <div class="col-md-6">
                                                <select name="tipo" class="form-control">
                                                    <option value="Sin goce de sueldo">Sin goce de sueldo</option>
                                                    <option value="Con goce de sueldo">Con goce de sueldo</option>
                                                    <option value="Economico">Económico</option>
                                                    <option value="Enfermedad de hijos">Enfermedad de hijos</option>
                                                
                                                
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>   
                                <br>    
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
                                                        int anio = Calendar.getInstance().get(Calendar.YEAR);
                                                    %>
                                                    <select name="anio" id="anio" class="form-control">
                                                        <%
                                                            for(int i = anio; i<=anio+5; i++)
                                                                {
                                                        %>
                                                        <option value="<%= i %>"><%= i %></option>
                                                        <%
                                                                }
                                                        %>
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
                                                             <%
                                                            for(int i = anio; i<=anio+5; i++)
                                                                {
                                                            %>
                                                            <option value="<%= i %>"><%= i %></option>
                                                            <%
                                                                    }
                                                            %>
                                                         </select>
                                                     </div>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-9">
                                        <div class="form-group">
                                            <label>Causa o motivo del permiso</label>
                                            <input type="text" name="motivo" class="form-control"  required>
                                        </div>
                                    </div>
                                </div>
                                
                                <br>
                                <%
                                    }
                                %>
                                
                                <%
                                if(text.equals("licencia")) {
                                %>
                                
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>Tipo</label>
                                        <div class="row">                                          
                                            <div class="col-md-6">
                                                <select name="tipo" class="form-control">
                                                    <option value="Muerte de familiar">Muerte de familiar</option>
                                                    <option value="Sindicales">Sindicales</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>   
                                <br>    
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
                                                        int anio = Calendar.getInstance().get(Calendar.YEAR);
                                                    %>
                                                    <select name="anio" id="anio" class="form-control">
                                                        <%
                                                            for(int i = anio; i<=anio+5; i++)
                                                                {
                                                        %>
                                                        <option value="<%= i %>"><%= i %></option>
                                                        <%
                                                                }
                                                        %>
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
                                                             <%
                                                            for(int i = anio; i<=anio+5; i++)
                                                                {
                                                            %>
                                                            <option value="<%= i %>"><%= i %></option>
                                                            <%
                                                                    }
                                                            %>
                                                         </select>
                                                     </div>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-9">
                                        <div class="form-group">
                                            <label>Causa o motivo del permiso</label>
                                            <input type="text"  name="motivo"  class="form-control"  required>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <%
                                }
                                %>
                                <div class="row">
                                    <div class="col-md-9">                                     
                                        <button type="submit" onclick="encode" class="pull-right btn btn-info btn-lg"><i class="pull-left material-icons" style="margin-top: -3px">done</i> &nbsp;Publicar</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <!-- BOOTSTRAP SCRIPTS -->
        <script src="js/bootstrap.js"></script>    
    </body>
</html>
