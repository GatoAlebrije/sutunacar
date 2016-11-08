
<%@page import="java.util.Locale"%>
<%@page import="org.joda.time.DateTime"%>
<%@ include file="session.jsp"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="classes.Conexion"%>
<%
    String empleadoID = request.getAttribute("id").toString();
    String nombre = request.getAttribute("nombre").toString() + " " + request.getAttribute("apePaterno").toString() + " " + request.getAttribute("apeMaterno").toString();
    DateTime date = new DateTime(request.getAttribute("fecha_nacimiento"));
    String fecha = date.getDayOfMonth() + "/" +  date.monthOfYear().getAsText(new Locale("es", "ES")) + "/" + date.getYear();
    String civil = request.getAttribute("civil").toString();
    //String pais = request.getAttribute("pais").toString();
    //String estado = request.getAttribute("estado").toString();
    String email = request.getAttribute("email").toString();
    String telefono = request.getAttribute("telefono").toString(); 
    String tel_casa = request.getAttribute("tel_casa").toString();
    String path = "";
    String hora_entrada = request.getAttribute("hora_entrada").toString();
    String hora_salida = request.getAttribute("hora_salida").toString();
    String segunda_entrada = "";
    String segunda_salida = "";
    if(request.getAttribute("segunda_entrada") != null) {
        segunda_entrada = request.getAttribute("segunda_entrada").toString();
        segunda_salida = request.getAttribute("segunda_salida").toString();
    }  
    date = new DateTime(request.getAttribute("ingreso_uni"));
    String ingreso_uni = date.getDayOfMonth() + "/" +  date.monthOfYear().getAsText(new Locale("es", "ES")) + "/" + date.getYear();
    date = new DateTime(request.getAttribute("ingreso_sindicato"));
    String ingreso_sin = date.getDayOfMonth() + "/" +  date.monthOfYear().getAsText(new Locale("es", "ES")) + "/" + date.getYear();
    String grado = request.getAttribute("grado").toString();
    String otro = request.getAttribute("otros").toString();
    String domicilio = request.getAttribute("calle") + " " 
                    + request.getAttribute("numext")+ " "
                    + request.getAttribute("numint") + " "
                    + request.getAttribute("cruzamiento") + " "
                    + request.getAttribute("colonia") + " " 
                    + request.getAttribute("postal") + " "
                    + request.getAttribute("ciudad");
    String sangre = request.getAttribute("sangre").toString();
    String profesion = request.getAttribute("profesion").toString();
    String ocupacion = request.getAttribute("ocupacion").toString();
    String rfc = request.getAttribute("rfc").toString();
    String curp = request.getAttribute("curp").toString();
    String nss = request.getAttribute("nss").toString();
    String estatus = request.getAttribute("estatus").toString();
    String puesto = request.getAttribute("puesto").toString();
    String categoria = request.getAttribute("categoria").toString();
    String area = request.getAttribute("area") + " " + request.getAttribute("campus");
    String telArea = request.getAttribute("tel_area").toString();
    
    String jubilacion = request.getAttribute("jubilacion").toString();
     
    
    String rol = request.getAttribute("rol").toString();
%>




<%
    Conexion conexion = new Conexion();
    Connection conn = conexion.Conexion();
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos usuario</title>
        
        <!--Custom css-->
        <link href="css/custom-navbar.css" rel="stylesheet" />
        <link href="css/admin.css" rel="stylesheet" />
        
        <link href="css/bootstrap.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLES-->
        
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
                            <h3 class="page-header">Detalles de miembro
                                <%
                                if(rol.equals("Admin")){
                                %>
                                <i class="material-icons">grade</i>
                                <%
                                }
                                %>
                            </h3>
                        </div>
                    </div>
                    <!-- Datos del usuario -->
                    
                    <div class="container" style="width: auto;margin-top: 20px;">
                        <ul class="nav nav-pills nav-justified">
                            <li class="active">
                                <a data-toggle="tab" href="#datosgenerales">Datos generales</a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#referencias">Referencias</a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#beneficiario">Beneficiarios</a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#permisos">Permisos</a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#licencias">Licencias</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div id="datosgenerales" class="tab-pane active">
                                <br />
                                <div class="row">
                                    <!-- Dropdown -->
                                    <div class="btn-group pull-right" role="group">
                                        <button type="button" class="btn btn-default  dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="pull-left material-icons">settings</i>
                                            <i class="pull-left material-icons">expand_more</i>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li><a href="RegistrarUsuario?text=editar&id=<%=request.getAttribute("id")%>">Editar datos</a></li>
                                            <%if (rol.equals("Admin")) {%>
                                            <li><a href="RegistrarUsuario?text=admin&amp;op=quitar&amp;id=<%=request.getAttribute("id")%>">Quitar permisos de administrador</a></li>
                                            <%} else {%>
                                            <li><a href="RegistrarUsuario?text=admin&amp;op=agregar&amp;id=<%=request.getAttribute("id")%>">Hacer Administrador</a></li>
                                            <%}%>
                                            <li role="separator" class="divider"></li>
                                            <%if (jubilacion.equals("true")) {%>
                                            <li><a href="RegistrarUsuario?text=jubilacion&amp;op=quitar&amp;id=<%=request.getAttribute("id")%>">Quitar Jubliación</a></li>
                                            <%} else {%>
                                            <li><a href="RegistrarUsuario?text=jubilacion&amp;op=agregar&amp;id=<%=request.getAttribute("id")%>">Agregar Jubilación</a></li>
                                            <%}%>
                                            
                                            <%if (estatus.equals("Activo")) {%>
                                            <li><a href="RegistrarUsuario?text=estatus&amp;op=quitar&amp;id=<%=request.getAttribute("id")%>">Marcar como Inactivo</a></li>
                                            <%} else {%>
                                            <li><a href="RegistrarUsuario?text=estatus&amp;op=agregar&amp;id=<%=request.getAttribute("id")%>">Marcar como Activo</a></li>
                                            <%}%>
                                            
                                            
                                        </ul>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4 col-md-offset-4">
                                            <img src="img/usuarios/<%= request.getAttribute("path_imagen") %>" class="img-thumbnail" width="211" height="220">
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
                                                    <p><strong>Estatus: </strong> <%=estatus%></p>
                                                    <p><strong>Area: </strong> <%=area%></p>
                                                    <p><strong>Telefono del área: </strong><%=telArea%></p>
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
                            <div id="referencias" class="tab-pane fade" >
                                <br />
                                <a href="agregarReferencia.jsp?text=agregarReferencia&AMP;id=<%= request.getAttribute("id") %>" class="btn btn-default btn-lg"><i class="material-icons pull-left">add_circle</i>&nbsp;Agregar referencia</a>
                                <br />
                                <br />
                                <table id="tablareferencia" class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Teléfono</th>
                                            <th>Teléfono de casa</th>
                                            <th>Domicilio</th>
                                            <th>Parentesco</th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            String sql = "select * from referencia where empleadoID = " + request.getAttribute("id");
                                            
                                            try {
                                                Statement s = conn.createStatement();
                                                ResultSet rs = s.executeQuery(sql);
                                                while(rs.next()) {
                                        %>
                                        <tr>
                                            <td><%=rs.getString("nombre")%>&nbsp;<%=rs.getString("apePaterno")%>&nbsp;<%= rs.getString("apeMaterno") %></td>
                                            <td><%= rs.getString("telefono") %></td>
                                            <td><%= rs.getString("tel_casa") %></td>
                                            <td>
                                                <%= rs.getString("calle") %>&nbsp;
                                                <%= rs.getString("numext") %>&nbsp;
                                                <%= rs.getString("numint") %>&nbsp;
                                                <%= rs.getString("cruzamiento") %>&nbsp;
                                                <%= rs.getString("postal") %>&nbsp;
                                                <%= rs.getString("ciudad") %>
                                                
                                            </td>
                                            <td><%= rs.getString("parentesco") %></td>
                                            <td><a href="agregarReferencia.jsp?text=editarReferencia&amp;id=<%= rs.getInt("referenciaID") %>" class="btn btn-info btn-xs " role="button" data-toggle="tooltip" data-placement="top" title="Editar"><i class="material-icons pull-left">mode_edit</i></a></td>
                                            <td><a href="RegistrarUsuario?text=eliminarReferencia&amp;id=<%= rs.getInt("referenciaID")%>&AMP;empleadoID=<%=request.getAttribute("id")%>" class="btn btn-danger btn-xs" data-toggle="confirmation" data-singleton="true" data-popout="true" data-btn-ok-label="Eliminar" data-btn-ok-class="btn-danger" data-title="Eliminar" data-placement="top" title="Eliminar"><i class="material-icons pull-left">delete</i></a></td>
                                                
                        
                                        </tr>
                                                
                                        <%
                                                }
                                                s.close();
                                            } catch (SQLException e) {
                                                System.out.println("No se encontró usuario: " + e.getMessage());
                                            }
                                            
                                            
                                        %>
                                    </tbody>
                                </table>
                            </div>
                            <div id="beneficiario" class="tab-pane fade">
                                <br />
                                <a href="agregarReferencia.jsp?text=agregarBeneficiario&AMP;id=<%= request.getAttribute("id") %>" class="btn btn-default btn-lg"><i class="material-icons pull-left">add_circle</i>&nbsp;Agregar Beneficiario</a>
                                <br />
                                <br />                                <table id="tablareferencia" class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Teléfono</th>
                                            <th>Teléfono de casa</th>
                                            <th>Domicilio</th>
                                            <th>Porcentaje</th>
                                            <th>Parentesco</th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            sql = "select * from beneficiario where empleadoID = " + request.getAttribute("id");
                                            
                                            try {
                                                Statement s = conn.createStatement();
                                                ResultSet rs = s.executeQuery(sql);
                                                while(rs.next()) {
                                        %>
                                        <tr>
                                            <td><%=rs.getString("nombre")%>&nbsp;<%=rs.getString("apePaterno")%>&nbsp;<%= rs.getString("apeMaterno") %></td>
                                            <td><%= rs.getString("telefono") %></td>
                                            <td><%= rs.getString("tel_casa") %></td>
                                            <td>
                                                <%= rs.getString("calle") %>&nbsp;
                                                <%= rs.getString("numext") %>&nbsp;
                                                <%= rs.getString("numint") %>&nbsp;
                                                <%= rs.getString("cruzamiento") %>&nbsp;
                                                <%= rs.getString("postal") %>&nbsp;
                                                <%= rs.getString("ciudad") %>
                                                
                                            </td>
                                            <td><%= rs.getString("porcentaje") %></td>
                                            <td><%= rs.getString("parentesco") %></td>
                                            <td><a href="agregarReferencia.jsp?text=editarBeneficiario&amp;id=<%= rs.getInt("beneficiarioID") %>" class="btn btn-info btn-xs " role="button" data-toggle="tooltip" data-placement="top" title="Editar"><i class="material-icons pull-left">mode_edit</i></a></td>
                                            <td><a href="RegistrarUsuario?text=eliminarBeneficiario&amp;id=<%= rs.getInt("beneficiarioID")%>&AMP;empleadoID=<%=request.getAttribute("id")%>" class="btn btn-danger btn-xs" data-toggle="confirmation" data-singleton="true" data-popout="true" data-btn-ok-label="Eliminar" data-btn-ok-class="btn-danger" data-title="Eliminar" data-placement="top" title="Eliminar"><i class="material-icons pull-left">delete</i></a></td>
                                                
                        
                                        </tr>
                                                
                                        <%
                                                }
                                                s.close();
                                            } catch (SQLException e) {
                                                System.out.println("No se encontró usuario: " + e.getMessage());
                                            }
                                            
                                           
                                        %>
                                    </tbody>
                                </table>
                            </div>
                            <div id="permisos" class="tab-pane fade" >
                                <br />
                                <%
                                            date = new DateTime();
                                            sql = "select dias from permiso where empleadoID = " 
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
                                        &nbsp; Este empleado ha usado <strong><%=dias%> días económicos</strong> 
                                        confirmados este año <strong><%=date.getYear()%></strong>
                                        <br />
                                    </p>
                                    <br>
                                </div>
                                
                                <table id="tablapermisos" class="table table-striped">
                                    <thead>
                                        
                                        <tr>
                                            <th>Tipo</th>
                                            <th>Inicio</th>
                                            <th>Final</th>
                                            <th>Motivo</th>
                                            <th>Confirmación</th>
                                            <th>Observaciones</th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            sql = "select * from permiso where empleadoID = " + request.getAttribute("id") + " order by permisoID desc";
                                            
                                            try {
                                                Statement s = conn.createStatement();
                                                ResultSet rs = s.executeQuery(sql);
                                                while(rs.next()) {
                                                    
                                                
                                        %>
                                        <tr>
                                            <td><%= rs.getString("tipo") %></td>
                                            <td><%= rs.getString("fecha_inicio") %></td>
                                            <td><%= rs.getString("fecha_fin") %></td>
                                            <td><%= rs.getString("motivo") %></td>
                                            <td><%= rs.getString("confirmacion")%></td>
                                            <td><%= rs.getString("observaciones") %></td>
                                            <td><a href="ServletPermisos?text=editarPermiso&amp;id=<%= rs.getInt("permisoID") %>" class="btn btn-info btn-xs " role="button" data-toggle="tooltip" data-placement="top" title="Editar"><i class="material-icons pull-left">mode_edit</i></a></td>
                                            <td><a href="ServletPermisos?text=eliminarPermiso&amp;id=<%= rs.getInt("permisoID")%>&amp;empleado=<%=request.getAttribute("id")%>" class="btn btn-danger btn-xs" data-toggle="confirmation" data-singleton="true" data-popout="true" data-btn-ok-label="Eliminar" data-btn-ok-class="btn-danger" data-title="Eliminar" data-placement="top" title="Eliminar"><i class="material-icons pull-left">delete</i></a></td>
                                                
                        
                                        </tr>
                                                
                                        <%
                                                }
                                                s.close();
                                            } catch (SQLException e) {
                                                System.out.println("No se encontró usuario: " + e.getMessage());
                                            }
                                            
                                            
                                        %>
                                    </tbody>
                                </table>
                                        
                            </div>
                            <div id="licencias" class="tab-pane fade" >
                                <br />
                                <br />
                                <table id="tablalicencia" class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Tipo</th>
                                            <th>Inicio</th>
                                            <th>Final</th>
                                            <th>Motivo</th>
                                            <th>Confirmación</th>
                                            <th>Observaciones</th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            sql = "select * from licencia where empleadoID = " + request.getAttribute("id")  + " order by licenciaID desc";
                                            
                                            try {
                                                Statement s = conn.createStatement();
                                                ResultSet rs = s.executeQuery(sql);
                                                while(rs.next()) {
                                        %>
                                        <tr>
                                            <td><%= rs.getString("tipo") %></td>
                                            <td><%= rs.getString("fecha_inicio") %></td>
                                            <td><%= rs.getString("fecha_fin") %></td>
                                            <td><%= rs.getString("motivo") %></td>
                                            <td><%= rs.getString("confirmacion") %></td>
                                            <td><%= rs.getString("observaciones") %></td>
                                            <td><a href="ServletPermisos?text=editarLicencia&amp;id=<%= rs.getInt("licenciaID") %>" class="btn btn-info btn-xs " role="button" data-toggle="tooltip" data-placement="top" title="Editar"><i class="material-icons pull-left">mode_edit</i></a></td>
                                            <td><a href="ServletPermisos?text=eliminarLicencia&amp;id=<%= rs.getInt("licenciaID")%>&amp;empleado=<%=request.getAttribute("id")%>" class="btn btn-danger btn-xs" data-toggle="confirmation" data-singleton="true" data-popout="true" data-btn-ok-label="Eliminar" data-btn-ok-class="btn-danger" data-title="Eliminar" data-placement="top" title="Eliminar"><i class="material-icons pull-left">delete</i></a></td>
                                                
                        
                                        </tr>
                                                
                                        <%
                                                }
                                                s.close();
                                            } catch (SQLException e) {
                                                System.out.println("No se encontró usuario: " + e.getMessage());
                                            }
                                            
                                            
                                        %>
                                    </tbody>
                                </table>
                                        
                            </div>
                        </div>
                        
                    </div>
                
                </div>                               
            </div>
        </div>
        
        <!-- BOOTSTRAP SCRIPTS -->
        <script src="js/bootstrap.js"></script>
        <script src="js/bootstrap-confirmation.js"></script>
        <!-- METISMENU SCRIPTS -->
        <script src="js/jquery.metisMenu.js"></script>     
        
        <script>
            $("#usuarios").addClass("active");
            $('#tablapermisos tr:contains("Confirmado")').addClass("info");
            $('#tablalicencia tr:contains("Confirmado")').addClass("info");
            
            $(function () {
                $('[data-toggle="tooltip"]').tooltip()
            });
            
            $('[data-toggle=confirmation]').confirmation({
            rootSelector: '[data-toggle=confirmation]',
            // other options
            
            });
        </script>
    </body>
</html>
