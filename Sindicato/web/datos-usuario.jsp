
<%@page import="java.util.Locale"%>
<%@page import="org.joda.time.DateTime"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="classes.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mis datos</title>
        
        <link href="css/custom-navbar.css" rel="stylesheet" />
        <link href="css/admin.css" rel="stylesheet" />
        
        <link href="css/bootstrap.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLES-->
        <link href="css/font-awesome.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">       
      
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    
    </head>
    <body>
        <%
            String empleadoID = session.getAttribute("empleadoID").toString();
            String area = session.getAttribute("area").toString();
            String puesto = session.getAttribute("puesto").toString();
            String categoria = session.getAttribute("categoria").toString();
            
            String nombre = "";
            DateTime date;
            String fecha = "";
            String civil = "";
            //String pais = "";
            //String estado = "";
            String email = "";
            String telefono = ""; 
            String tel_casa = "";
            String path = "";
            String hora_entrada = "";
            String hora_salida = "";
            String segunda_entrada = "";
            String segunda_salida = "";
            String ingreso_uni = "";
            String ingreso_sin = "";
            String grado = "";
            String otro = "";
            String domicilio = "";
            String sangre = "";
            String profesion = "";
            String ocupacion = "";
            String rfc = "";
            String curp = "";
            String nss = "";
            
            
            Conexion conexion = new Conexion();
            Connection conn = conexion.Conexion();
           
            
            String sql = "select*from empleado inner join datogeneral on datogeneral.empleadoID where empleado.empleadoID = "
                    + "'" + empleadoID + "' and datogeneral.empleadoID = '" + empleadoID +"'";
            Statement s = conn.createStatement();
            ResultSet rs = s.executeQuery(sql);
            if (rs.next()) {
                nombre = rs.getString("nombre") + " "
                        + rs.getString("apePaterno") + " " 
                        + rs.getString("apeMaterno");
                date =  new DateTime(rs.getDate("fecha_nacimiento"));
                fecha = date.getDayOfMonth() + "/" + date.monthOfYear().getAsText(new Locale("es", "ES")) + "/" + date.getYear();
                civil = rs.getString("civil");
                //pais = rs.getString("pais");
                //estado = rs.getString("estado");
                email = rs.getString("email");
                telefono = rs.getString("telefono");
                tel_casa = rs.getString("tel_casa");
                path = rs.getString("path_imagen");
                hora_entrada = rs.getString("hora_entrada");
                hora_salida = rs.getString("hora_salida");
                segunda_entrada = rs.getString("segunda_entrada");
                segunda_salida = rs.getString("segunda_salida");
                date = new DateTime(rs.getDate("ingreso_uni"));
                ingreso_uni = date.getDayOfMonth()+ "/" + date.monthOfYear().getAsText(new Locale("es", "ES")) + "/" + date.getYear();
                date = new DateTime(rs.getDate("ingreso_sindicato"));
                ingreso_sin = date.getDayOfMonth() + "/" + date.monthOfYear().getAsText(new Locale("es", "ES")) + "/" + date.getYear();
                grado = rs.getString("grado");
                otro = rs.getString("otros");
                domicilio = rs.getString("calle") + " "
                        + rs.getString("numext") + " "
                        + rs.getString("numint") + " "
                        + rs.getString("cruzamiento") + " "
                        + rs.getString("colonia") + " "
                        + rs.getString("postal") + " "
                        + rs.getString("ciudad");
                sangre = rs.getString("sangre");
                profesion = rs.getString("profesion");
                ocupacion = rs.getString("ocupacion");
                rfc = rs.getString("rfc");
                curp = rs.getString("curp");
                nss = rs.getString("nss");
               
                
            }
        %>
        
        <%@include file="srcJsp/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row">
                
                <!-- Area trabajo -->
                <div class="col-md-10 main col-md-offset-2">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Mis Datos</h1>
                        </div>
                    </div>
                    <div class="btn-group pull-right" role="group">
                        <button type="button" class="btn btn-default  dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="pull-left material-icons">settings</i>
                            <i class="pull-left material-icons">expand_more</i>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a href="CambiarPass.jsp">Cambiar contraseña</a></li>
                        </ul>
                    </div>
                    <div class=row>
                        <div class="col-md-3 col-md-offset-4">
                            <img src="img/usuarios/<%= path %>" class="img-circle" style="border: 1px solid #ccc;" width="200" alt="Imagen">
                        </div>
                    </div>
                        
                    
                    
                    <br />
                    <div class="row">
                        <div class="col-md-5">
                            
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                  <h3 class="panel-title">Datos generales</h3>
                                </div>
                                <div class="panel-body">
                                    <p><strong>Nombre: </strong> <%=nombre%></p>
                                    <p><strong>Fecha de nacimiento:  </strong> <%=fecha%></p>
                                    <p><strong>Estado civil:  </strong> <%=civil%></p>
                                    <%
                                    if(telefono == null) { telefono = "Ninguno"; }
                                    %>
                                    <p><strong>Teléfono:  </strong> <%=telefono%></p>
                                    <%
                                    if(tel_casa == null) { tel_casa = "Ninguno"; }
                                    %>
                                    <p><strong>Teléfono de casa:  </strong> <%=tel_casa%></p>
                                    <p><strong>Email:  </strong> <%=email%></p>
                                    <p><strong>Domicilio:  </strong> <%=domicilio%></p>
                                    <p><strong>CURP: </strong> <%=curp%></p>
                                    <p><strong>Número de seguro social:  </strong> <%=nss%></p>
                                    <p><strong>Tipo de sangre:  </strong> <%=sangre%></p>
                                    <p><strong>RFC:  </strong> <%=rfc%></p>
                                    <p><strong>Grado máximo de estudios:  </strong> <%=grado%></p>
                                    <%
                                    if(otro == null) { otro = "Ninguno"; }
                                    %>
                                    <p><strong>Otros estudios:  </strong> <%=otro%></p>
                                
                                
                                
                                </div>
                              </div>
                        </div>
                        <div class="col-md-5">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                  <h3 class="panel-title">Datos laborales</h3>
                                </div>
                                <div class="panel-body">
                                    <p><strong>Area: </strong> <%=area%></p>
                                    <p><strong>Puesto:  </strong> <%=puesto%></p>
                                    <p><strong>Categoria:  </strong> <%=categoria%></p>
                                    <p><strong>Profesión  </strong> <%=profesion%></p>
                                    <p><strong>Ocupación  </strong> <%=ocupacion%></p>
                                    <p><strong>Primer horario:  </strong> <%=hora_entrada%> - <%=hora_salida%> </p>
                                    <%
                                    if(segunda_entrada == null) { 
                                        segunda_entrada = "Ninguno"; 
                                        
                                    } else {
                                        segunda_entrada = segunda_entrada + " - " + segunda_salida;
                                    }
                                    %>
                                    <p><strong>Segundo horario:  </strong> <%=segunda_entrada%></p>
                                    <p><strong>Fecha de ingreso a la universidad:  </strong> <%=ingreso_uni%></p>
                                    <p><strong>Fecha de ingreso al sindicato:  </strong> <%=ingreso_sin%></p>
                                </div>
                              </div>
                        </div>        
                                
                    </div>
                </div>
                
            </div>
        </div>
                
        <!-- BOOTSTRAP SCRIPTS -->
        <script src="js/bootstrap.js"></script>
        <script src="js/bootstrap-confirmation.js"></script>
    </body>
</html>
