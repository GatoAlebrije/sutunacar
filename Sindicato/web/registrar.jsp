<%@page import="java.util.Locale"%>
<%@include file="session.jsp"%>
<%@page import="org.joda.time.format.DateTimeFormatter"%>
<%@page import="org.joda.time.format.DateTimeFormat"%>
<%@page import="org.joda.time.DateTime"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="classes.Conexion"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Usuario</title>
        
        <!--Custom css-->
        <link href="css/custom-navbar.css" rel="stylesheet" />
        <link href="css/admin.css" rel="stylesheet" />
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        
        
        
    </head>
    <body>
        <%@include file="srcJsp/navbar.jsp" %>
        <%
            String[] mes = {"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};
            String method = request.getParameter("method");
            String id = "";
            int generalID = 0;
            int refID = 0;
            int areaID = 1; // Si no es editar, combo box seleccionara el primero
            int puestoID = 0;
            int categoriaID = 0;
            String nombre = "";
            String apeMaterno = "";
            String apePaterno = "";
            String fecha_nacimiento ="";
            String calle = "";
            String numext = "";
            String numint = "";
            String cruzamiento = "";
            String colonia = "";
            String postal = "";
            String ciudad = "";
            //String pais = "";
            //String estado = "";
            String civil = "";
            String email = "";
            String telefono = "";
            String tel_casa = "";
            String rfc = "";
            String curp = "";
            String nss = "";
            String sangre = "";
            String hora_entrada = "";
            String hora_salida = "";
            String segunda_entrada = "";
            String segunda_salida = "";
            String fecha_uni = "";
            String fecha_sin = "";
            String area = "";
            String puesto = "";
            String categoria = "";
            String profesion = "";
            String ocupacion = "";
            String grado = "";
            String otros = "";
            String refnombre = "";
            String refmaterno = "";
            String refpaterno = "";
            String reftel = "";
            String refcasa = "";
            String refcalle = "";
            String refext = "";
            String refint = "";
            String refcruzamiento = "";
            String refcolonia = "";
            String refpostal = "";
            String refpais = "";
            String refestado = "";
            String refciudad = "";
            String parentesco = "";
            
            int dia = 1;
            int mes2 = 1;
            int anio = 0;
            int diaUni = 1;
            int mesUni = 1;
            int anioUni = 0;
            int diaSin = 1;
            int mesSin = 1;
            int anioSin = 0;
            
            DateTime fechaactual = new DateTime();
            int year = fechaactual.getYear();
            
            if (method.equals("editar")) {
                id = request.getAttribute("id").toString();
                generalID = Integer.parseInt(request.getAttribute("generalID").toString());
                refID = Integer.parseInt(request.getAttribute("refID").toString());
                areaID = Integer.parseInt((request.getAttribute("areaID").toString()));
                puestoID = Integer.parseInt((request.getAttribute("puestoID").toString()));
                categoriaID = Integer.parseInt((request.getAttribute("categoriaID").toString()));
                
                nombre = request.getAttribute("nombre").toString();
                apeMaterno = request.getAttribute("apeMaterno").toString();
                apePaterno = request.getAttribute("apePaterno").toString();
                fecha_nacimiento = request.getAttribute("fecha_nacimiento").toString();
                calle = request.getAttribute("calle").toString();
                numext = request.getAttribute("numext").toString();
                numint = request.getAttribute("numint").toString();
                cruzamiento = request.getAttribute("cruzamiento").toString();
                colonia = request.getAttribute("colonia").toString();
                postal = request.getAttribute("postal").toString();
                ciudad = request.getAttribute("ciudad").toString();
                //pais = request.getAttribute("pais").toString();
                //estado = request.getAttribute("estado").toString();
                civil = request.getAttribute("civil").toString();
                email = request.getAttribute("email").toString();
                telefono = request.getAttribute("telefono").toString();
                tel_casa = request.getAttribute("tel_casa").toString();
                rfc = request.getAttribute("rfc").toString();
                curp = request.getAttribute("curp").toString();
                nss = request.getAttribute("nss").toString();
                sangre = request.getAttribute("sangre").toString();
                hora_entrada = request.getAttribute("hora_entrada").toString();
                hora_salida = request.getAttribute("hora_salida").toString();
                if (request.getAttribute("segunda_entrada") != null)
                    segunda_entrada = request.getAttribute("segunda_entrada").toString();
                if (request.getAttribute("segunda_salida") != null)
                    segunda_salida = request.getAttribute("segunda_salida").toString();
                fecha_uni = request.getAttribute("ingreso_uni").toString();
                fecha_sin = request.getAttribute("ingreso_sindicato").toString();
                area = request.getAttribute("areaID").toString();
                puesto = request.getAttribute("puestoID").toString();
                categoria = request.getAttribute("categoriaID").toString();
                profesion = request.getAttribute("profesion").toString();
                ocupacion = request.getAttribute("ocupacion").toString();
                grado = request.getAttribute("grado").toString();
                otros = request.getAttribute("otros").toString();
                refnombre = request.getAttribute("refnombre").toString();
                refmaterno = request.getAttribute("refmaterno").toString();
                refpaterno = request.getAttribute("refpaterno").toString();
                reftel = request.getAttribute("reftel").toString();
                refcasa = request.getAttribute("refcasa").toString();;
                refcalle = request.getAttribute("refcalle").toString();
                refext = request.getAttribute("refext").toString();
                refint = request.getAttribute("refint").toString();
                refcruzamiento = request.getAttribute("refcruzamiento").toString();
                refcolonia = request.getAttribute("refcolonia").toString();
                refpostal = request.getAttribute("refpostal").toString();
                //refpais = request.getAttribute("refpais").toString();
                //refestado = request.getAttribute("refestado").toString();
                refciudad = request.getAttribute("refciudad").toString();
                parentesco = request.getAttribute("parentesco").toString();
                
                
                DateTime fecha = new DateTime(fecha_nacimiento);
                DateTime fechaUni = new DateTime(fecha_uni);
                DateTime fechaSin = new DateTime(fecha_sin);
                dia = fecha.getDayOfMonth();
                mes2 = fecha.getMonthOfYear();
                anio = fecha.getYear();
                
                diaUni = fechaUni.getDayOfMonth();
                mesUni = fechaUni.getMonthOfYear();
                anioUni = fechaUni.getYear();
                diaSin = fechaSin.getDayOfMonth();
                mesSin = fechaSin.getMonthOfYear();
                anioSin = fechaSin.getYear();
                
                
                
            }
            
                           
   
            
                
            
        %>
        
        
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2" style="margin-top: 20px;">
                    <%@include file="srcJsp/nav-admin.jsp" %>
                </div>
            
                <div class="col-md-7 main ">
                <div class="row" style="margin-left: 100px; margin-bottom: 100px;">
                        <div class="col-lg-12">
                            <h2 style="text-align: center; color: #c9c9c9;">Registrar Usuario</h2>
                        </div>
                <br>
                <ul class="nav nav-tabs nav-justified">
                    <li class="active">
                        <a data-toggle="tab" href="#home"><i class="material-icons">person</i></a>
                    </li>
                    <li>
                        <a data-toggle="tab" href="#menu1"><i class="material-icons">work</i></a>
                    </li>
                    <li>
                        <a data-toggle="tab" href="#menu2"><i class="material-icons">school</i></a>
                    </li>
                    <li>
                        <a data-toggle="tab" href="#menu3"><i class="material-icons">people</i></a>
                    </li>
                </ul>
                <form action="RegistrarUsuario" method="post"  enctype="multipart/form-data" accept-charset="ISO-8859-1">
                <div class="tab-content">
                    <div id="home" class="tab-pane fade in active">
                        <h3>Datos generales</h3>
                        <hr>
                        <div class="form-group">
                            <input name="text" value="<%=method%>" hidden>
                            <input name="generalID" value="<%=generalID%>" hidden>
                            <input name="refID" value="<%=refID%>" hidden>
                            <label>Nombre</label>
                            <!--pattern="[A-Za-z\s]{2,}"-->
                            <input type="text" name="nombre" value="<%=nombre%>" class="form-control" autofocus required  placeholder="Nombre" autocomplete="off">

                        </div>
                        <br>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Apellido paterno</label>
                                    <input type="text" name="apePaterno" value="<%=apePaterno%>" class="form-control"  required pattern="[A-Za-z\s]{2,}" placeholder="Apellido paterno" autocomplete="off">
                                </div>
                                <div class="col-md-6">
                                    <label>Apellido materno</label>
                                    <input type="text" name="apeMaterno" value="<%=apeMaterno%>" class="form-control"  required pattern="[A-Za-z\s]{2,}" placeholder="Apellido materno" autocomplete="off">
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <label>Fecha de naciemiento</label>
                                <div class="row">                               
                                    <div class="col-xs-2">
                                        <select name="dia" id="dia" class="form-control">
                                            <%
                                                for (int i=1;i<32;i++) {
                                                    if (dia == i) {
                                                        out.print("<option value=\"" + i + "\" selected>" + i + "</option>");
                                                    } else {
                                                        out.print("<option value=\"" + i + "\">" + i + "</option>");
                                                    }
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="col-xs-3">
                                        <select name="mes" id="mes" class="form-control">
                                            <%
                                                for(int i=1; i <= mes.length; i++){
                                                    if (mes2 == i) {
                                                        out.print("<option value=\"" + i + "\" selected>" + mes[i-1] + "</option>");
                                                    } else {
                                                        out.print("<option value=\"" + i + "\">" + mes[i-1] + "</option>");
                                                    }

                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="col-xs-2">
                                        <select name="anio" id="anio" class="form-control">
                                            <%  
                                                int max = year-70;
                                                int min = year-18;
                                                for(int i=min; i>=max; i--){
                                                    if (year == i) {
                                                    out.print("<option value=\"" + i + "\" selected>" + i + "</option>");
                                                    } else {
                                                        out.print("<option value=\"" + i + "\">" + i + "</option>");
                                                    }
                                                }
                                            %>


                                        </select>
                                    </div>
                                </div>
                        </div>
                        <hr />
                        <div class="form-group">
                            <label>Domicilio</label><br /><br />
                            <div class="row">
                               <div class="col-md-5">
                                    <span>Calle</span>
                                    <input type="text" name="calle" value="<%=calle%>" class="form-control"  required  autocomplete="off">
                                </div>
                                <div class="col-xs-2">
                                    <span># exterior</span>
                                    <input type="text" name="ext" value="<%=numext%>" class="form-control"  required pattern="\d+" autocomplete="off">
                                </div>
                                <div class="col-xs-2">
                                    <span># interior</span>
                                    <input type="text" name="int" value="<%=numint%>" class="form-control"  required pattern="\d+" autocomplete="off">
                                </div>
                                <div class="col-xs-3">
                                    <span>Código postal</span>
                                    <input type="text" name="postal" value="<%=postal%>" class="form-control"  required pattern="\d+" autocomplete="off">
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-5">
                                    <span>Cruzamiento</span>
                                    <input type="text" name="cruzamiento" value="<%=cruzamiento%>" class="form-control"  required  autocomplete="off">
                                </div>  
                                <div class="col-xs-3">
                                    <span>Colonia</span>
                                    <input type="text" name="colonia" value="<%=colonia%>" class="form-control"  required autocomplete="off">
                                </div>
                                <!--
                                <div class="col-xs-4">
                                    <span>Ciudad</span>
                                    <select name="ciudad" id="ciudad" class="form-control">
                                        <option value="Ciudad 1">Cd. del Carmen</option>
                                        <option value="Ciudad 2">Isla Aguada</option>
                                        <option value="Ciudad 3">San Antonio Cárdenas</option>
                                        <option value="Ciudad 4">Puerto Rico</option>
                                    </select>                                                  
                                </div>
                                -->
                            </div>

                            <br />
                            <label>Ciudad</label>
                            <div class="row">
                                <!--
                                <div class="col-xs-3">
                                    <span>País</span>

                                    <select name="pais" id="pais" class="form-control">

                                    </select>
                                </div>

                                <div class="col-xs-3">
                                    <span>Estado</span>
                                    <select name="estado" id="estado" class="form-control">
                                        <option value="Estado 1" >Estado 1</option>
                                        <option value="Estado 2">Estado 2</option>
                                        <option value="Estado 3">Estado 3</option>
                                        <option value="Estado 4">Estado 4</option>
                                    </select>
                                </div>
                                -->
                                <div class="col-xs-8">
                                    <input id="autocomplete" name="ciudad" class='form-control' placeholder="Ejemplo: Ciudad del Carmen, Campeche, México"
                                    onFocus="geolocate()" type="text" value="<%=ciudad%>">
                                </div>

                            </div>

                        </div>
                        <hr />

                        <div class="form-group">
                            <label>Estado civil</label> <br /><br />
                            <div style="margin-left: 25px; text-align: center;">
                                <label class="radio-inline">
                                    <input type="radio" name="estadocivil" value="Soltero" checked> Soltero
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="estadocivil" value="Comprimetido"> Comprometido
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="estadocivil" value="Casado"> Casado
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="estadocivil" value="Divorciado"> Divorciado
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="estadocivil" value="Viudo"> Viudo
                                </label>
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Correo electr&oacute;nico</label>
                                    <input type="email" name="email" value="<%=email%>" class="form-control" required placeholder="Correo electrónico" autocomplete="off">
                                </div>
                            </div>                                                                                                                                    
                        </div>
                        <br>
                        <div class="form-group">
                            <div class="row">
                            <div class="col-md-6">
                                <label>Tel&eacute;fono celular</label>
                                <input type="text" name="celular" value="<%=telefono%>" class="form-control" pattern="\d+" placeholder="Teléfono" autocomplete="off">
                            </div>
                            <div class="col-md-4">
                                <label>Tel&eacute;fono de casa</label>
                                <input type="text" name="telcasa" value="<%=tel_casa%>" class="form-control" pattern="\d+" placeholder="Teléfono de casa" autocomplete="off">
                            </div>  
                        </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label>RFC</label>
                                    <input type="text" name="rfc" value="<%=rfc%>" class="form-control" required placeholder="RFC" autocomplete="off">
                                </div>
                                <div class="col-xs-6">
                                    <label>CURP</label>
                                    <input type="text" name="curp" value="<%=curp%>" class="form-control"  placeholder="CURP" required autocomplete="off">
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-xs-6">
                                    <label>N&uacute;mero de seguro social</label>
                                    <input type="text" name="nss" value="<%=nss%>" class="form-control" required placeholder="NSS" autocomplete="off">
                                </div>
                                <div class="col-xs-6">
                                    <label>Tipo de sangre</label>
                                    <select name="sangre" id="sangre" class="form-control">
                                        <option value="O+">O+</option>
                                        <option value="O-">O-</option>
                                        <option value="A+">A+</option>
                                        <option value="A-">A-</option>
                                        <option value="B+">B+</option>
                                        <option value="B-">B-</option>
                                        <option value="AB+">AB+</option>
                                        <option value="AB-">AB-</option>
                                    </select>
                                </div> 
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <label>Foto de perfil</label><br>
                            <input type="file" name="foto" accept="image/gif, image/jpeg, image/png">    
                        </div> 

                    </div>

                    <!-- Menu 1 -->
                    <div id="menu1" class="tab-pane fade">
                        <h3>Datos laborales</h3>
                        <hr />
                        <div class="form-group">
                            <div class="row">
                                <div class="col-xs-4">
                                    <label>N&uacute;mero de empleado</label>
                                    <input type="text" class="form-control" value="<%=id%>" name="num" autofocus required pattern="\d+" autocomplete="off"> 
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <div class="checkbox">
                                <label data-toggle="tooltip" title="Seleccionar si tienes dos horarios de entrada y salida en el dia">
                                    <input type="checkbox" id="checkHorario" name="checkHorario" >
                                    Horario cortado
                                </label>
                            </div>
                            <div class="row">
                                <div class="col-xs-3">
                                    <label>Horario de entrada</label>
                                    <select name="horaEntrada" id="horaentrada" class="form-control">  
                                        <%
                                            for(int i=7; i<=22; i++){   
                                        %>
                                        <option value="<%=i%>:00 hrs"><%=i%>:00 hrs</option>
                                        <%}%>                                                    
                                    </select>
                                </div>
                                <div class="col-xs-3">
                                    <label>Horario de salida</label>
                                    <select name="horaSalida" id="horasalida" class="form-control">   
                                        <%
                                            for(int i=7; i<=22; i++){   
                                        %>
                                        <option value="<%=i%>:00 hrs"><%=i%>:00 hrs</option>
                                        <%}%>
                                    </select>
                                </div>                                                          
                            </div>
                            <br />
                            <!-- Segundo Horario -->
                            <div class="row">
                                <div class="col-xs-3">
                                    <label>Horario de entrada</label>
                                    <select name="horaEntrada2" id="entrada2" class="form-control" disabled="">  
                                        <%
                                            for(int i=7; i<=22; i++){   
                                        %>
                                        <option value="<%=i%>:00 hrs"><%=i%>:00 hrs</option>
                                        <%}%>                                                    
                                    </select>
                                </div>
                                <div class="col-xs-3">
                                    <label>Horario de salida</label>                                                
                                    <select name="horaSalida2" id="salida2" class="form-control" disabled="">   
                                        <%
                                            for(int i=7; i<=22; i++){   
                                        %>
                                        <option value="<%=i%>:00 hrs"><%=i%>:00 hrs</option>
                                    <%}%>
                                    </select>
                                </div>                                                          
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <label>Fecha de ingreso a la universidad</label>
                            <div class="row">                               
                                    <div class="col-xs-2">
                                        <select name="diaUni" id="diaUni" class="form-control">
                                            <%
                                                for (int i=1;i<32;i++){
                                            %>
                                            <option value="<%=i%>"><%=i%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                    <div class="col-xs-3">
                                        <select name="mesUni" id="mesUni" class="form-control">
                                            <%
                                                for(int i=1; i <= mes.length; i++){ 
                                                    out.print("<option value=\"" + i + "\">" + mes[i-1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="col-xs-2">
                                        <select name="anioUni" id="anioUni" class="form-control">
                                            <% 
                                                for(int i=year; i>=max; i--){   
                                            %>
                                            <option value="<%=i%>"><%=i%></option>
                                            <%}%>
                                        </select>
                                    </div>
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <label>Fecha de ingreso al sindicato</label>
                            <div class="row">                               
                                    <div class="col-xs-2">
                                        <select name="diaSin" id="diaSin" class="form-control">
                                            <%
                                                for (int i=1;i<32;i++){
                                            %>
                                            <option value="<%=i%>"><%=i%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                    <div class="col-xs-3">
                                        <select name="mesSin" id="mesSin" class="form-control">
                                            <%
                                                for(int i=1; i <= mes.length; i++){ 
                                                    out.print("<option value=\"" + i + "\">" + mes[i-1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="col-xs-2">
                                        <select name="anioSin" id="anioSin" class="form-control">
                                            <% 
                                                for(int i=year; i>=max; i--){   
                                            %>
                                            <option value="<%=i%>"><%=i%></option>
                                            <%}%>
                                        </select>
                                    </div>
                            </div>
                        </div>
                        <hr />
                        <%
                            Connection conn = new Conexion().Conexion();
                            try {
                            Statement s = conn.createStatement();
                            String sql = "select areaID, nombre from area";
                            ResultSet rs = s.executeQuery(sql);

                        %>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-xs-5">
                                    <label>&Aacute;rea de Adscripci&oacute;n</label>
                                    <select name="area" id="area" class="form-control">
                                        <%
                                            while(rs.next()) {
                                        %>
                                        <option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
                                        <%
                                            }
                                        %>
                                     </select>
                                </div>                                            
                            </div>
                        </div>
                        <br />

                        <div class="form-group">
                            <div class="row">
                                <div class="col-xs-5">
                                    <label>Puesto</label>
                                    <select name="puesto" class="form-control">
                                        <%
                                            sql = "select puestoID, puesto from puesto";
                                            rs = s.executeQuery(sql);
                                            while(rs.next()) {
                                        %>
                                        <option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
                                        <%
                                            }
                                        %>
                                     </select>
                                </div>
                                <div class="col-xs-5">
                                    <label>Categoria</label>
                                    <select name="categoria" class="form-control">
                                        <%
                                            sql = "select categoriaID, categoria from categoria";
                                            rs = s.executeQuery(sql);
                                            while(rs.next()) {
                                        %>
                                        <option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
                                        <%
                                            }
                                        %>

                                     </select>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="form-group">
                            <div class="row">
                                <div class="col-xs-5">
                                    <label>Profesi&oacute;n u oficio</label>
                                    <input type="text" name="profesion" value="<%=profesion%>" class="form-control" required placeholder="Profesión" autocomplete="off">
                                </div>
                                <div class="col-xs-5">
                                    <label>Ocupaci&oacute;n</label>
                                    <input type="text" name="ocupacion" value="<%=ocupacion%>" class="form-control" required placeholder="Ocupación" autocomplete="off">
                                </div>                                                                                       
                            </div>
                        </div>
                        <br>  
                    </div>

                    <!-- Menu 2 -->
                    <div id="menu2" class="tab-pane fade">
                        <h3>Escolaridad</h3>
                        <hr />
                        <div class="form-group">
                            <div class="row">
                                <div class="col-xs-6">
                                    <label>Grado m&aacute;ximo de estudio</label>
                                    <select name="grado" id="grado" class="form-control">   
                                        <option value="Primaria">Primaria</option>
                                        <option value="Secundaria">Secundaria</option>
                                        <option value="Preparatoria">Preparatoria</option>
                                        <option value="Licenciatura">Licenciatura</option>
                                        <option value="Maestria">Maestria</option>
                                        <option value="Doctorado">Doctorado</option>
                                    </select>
                                </div>
                            </div> 
                        </div>
                        <br />
                        <div class="form-group">
                                <div class="row">
                                    <div class="col-xs-6">
                                        <label>Otros</label>
                                        <input type="text" name="otros" value="<%=otros%>" class="form-control" placeholder="Otros" autocomplete="off">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Menu 3 -->
                    <div id="menu3" class="tab-pane fade">
                        <h3>Referencia familiar</h3>
                        <hr />
                        <div class="form-group">
                            <label>Nombre</label>
                            <input type="text" name="refnombre" value="<%=refnombre%>" pattern="[A-Za-z\s]{2,}" autofocus class="form-control"
                                title="Introduce nombre de la persona de referencia" autocomplete="off">
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Apellido paterno</label>
                                    <input type="text" name="refpaterno" value="<%=refmaterno%>" pattern="[A-Za-z\s]{2,}" class="form-control"
                                        title="Introduce el apellido paterno de la persona de referencia" autocomplete="off">
                                </div>
                                <div class="col-md-6">
                                    <label>Apellido materno</label>
                                    <input type="text" name="refmaterno" value="<%=refpaterno%>" pattern="[A-Za-z\s]{2,}" class="form-control"
                                        title="Introduce el apellido materno de la persona de referencia" autocomplete="off">
                                </div>

                            </div>
                        </div>
                        <br />
                        <div class="form-group">
                            <div class="row">     
                                <div class="col-xs-6">
                                    <label>Tel&eacute;fono celular</label>
                                    <input type="text" name="reftelcasa" value="<%=reftel%>" class="form-control" autocomplete="off">
                                </div>
                                <div class="col-xs-4">
                                    <label>Tel&eacute;fono de casa</label>
                                    <input type="text" name="reftelefono" value="<%=refcasa%>" class="form-control" autocomplete="off">
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div class="form-group">
                            <label>Domicilio</label><br /><br />
                            <div class="row">
                               <div class="col-md-5">
                                    <span>Calle</span>
                                    <input type="text" name="refcalle" value="<%=refcalle%>" class="form-control"  required autocomplete="off">
                                </div>
                                <div class="col-xs-2">
                                    <span># exterior</span>
                                    <input type="text" name="refext" value="<%=refext%>" class="form-control"  required pattern="\d+" autocomplete="off">
                                </div>
                                <div class="col-xs-2">
                                    <span># interior</span>
                                    <input type="text" name="refint" value="<%=refint%>" class="form-control"  required pattern="\d+" autocomplete="off">
                                </div>
                                <div class="col-xs-3">
                                    <span>Código postal</span>
                                    <input type="text" name="refpostal" value="<%=refpostal%>" class="form-control"  required pattern="\d+" autocomplete="off">
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-5">
                                    <span>Cruzamiento</span>
                                    <input type="text" name="refcruzamiento" value="<%=refcruzamiento%>" class="form-control"  autocomplete="off">
                                </div>  
                                <div class="col-xs-3">
                                    <span>Colonia</span>
                                    <input type="text" name="refcolonia" value="<%=refcolonia%>" class="form-control"  required autocomplete="off">
                                </div>
                                <!--
                                <div class="col-xs-4">
                                    <span>Ciudad</span>
                                    <select name="refciudad" id="refciudad" class="form-control">
                                        <option value="Ciudad 1">Cd. del Carmen</option>
                                        <option value="Ciudad 2">Isla Aguada</option>
                                        <option value="Ciudad 3">San Antonio Cárdenas</option>
                                        <option value="Ciudad 4">Puerto Rico</option>
                                    </select>                                                  
                                </div>
                                -->
                            </div>
                            <div class="row">

                            </div>
                            <br />
                            <label>Ciudad</label>
                            <div class="row">
                                <!--
                                <div class="col-xs-3">

                                    <span>País</span>
                                    <select name="refpais" id="refpais"  class="form-control">

                                    </select>
                                </div>
                                <div class="col-xs-3">
                                    <span>Estado</span>
                                    <select name="refestado" id="refestado" class="form-control">
                                        <option value="estado">Estado 1</option>
                                        <option value="estado">Estado 2</option>
                                        <option value="estado">Estado 3</option>
                                        <option value="estado">Estado 4</option>
                                    </select>
                                </div>
                                    -->
                                <div class="col-xs-8">
                                    <input id="autocomplete2" name="refciudad" class='form-control' placeholder="Ejemplo: Ciudad del Carmen, Campeche, México"
                                    onFocus="geolocate()" type="text" value="<%=refciudad%>">
                                </div>
                            </div>

                        </div>
                        <br />
                        <div class="form-group">
                            <div class="row">
                                <div class="col-xs-6">
                                    <label>Parentesco</label>
                                    <select name="parentesco" id="parentesco" class="form-control">
                                        <option value="Abuelo">Abuelo</option>
                                        <option value="Padre">Padre</option>
                                        <option value="Hijo">Hijo</option>
                                        <option value="Tio">Tio</option>
                                        <option value="Sobrino">Sobrino</option>
                                        <option value="Primo">Primo</option>
                                        <option value="Amigo">Amigo</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <hr >
                        <p class="pull-right">
                            <button type="submit" class="btn btn-primary btn-lg"><i class="material-icons pull-left">done</i>&nbsp;Registrar</button>
                        </p>
                    </div>
                </div>
                </form>
                       
                    </div>

                </div>
            </div>
        </div>
        <%
              s.close();
            } catch (SQLException e) {
                System.out.println("No se encontró empleado " + e.getMessage());
            } finally { conn.close(); }
        %>
        
        
        <!-- BOOTSTRAP SCRIPTS--> 
     <script src="js/bootstrap.js"></script>
     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA8nkp491jy1hxQhhQlVIQ1rSYYmspmD1c&signed_in=true&libraries=places&callback=initAutocomplete"
        async defer></script>        
        <script>
            function initAutocomplete() {
                // Create the autocomplete object, restricting the search to geographical
                // location types.
                autocomplete = new google.maps.places.Autocomplete(
                    /** @type {!HTMLInputElement} */(document.getElementById('autocomplete')),
           
                    {types: ['geocode']});
                    
                autocomplete2 = new google.maps.places.Autocomplete(
                    /** @type {!HTMLInputElement} */(document.getElementById('autocomplete2')),
           
                    {types: ['geocode']});

                // When the user selects an address from the dropdown, populate the address
                // fields in the form.
                //autocomplete.addListener('place_changed', fillInAddress);
              }
              
              function geolocate() {
                if (navigator.geolocation) {
                  navigator.geolocation.getCurrentPosition(function(position) {
                    var geolocation = {
                      lat: position.coords.latitude,
                      lng: position.coords.longitude
                    };
                    var circle = new google.maps.Circle({
                      center: geolocation,
                      radius: position.coords.accuracy
                    });
                    autocomplete.setBounds(circle.getBounds());
                  });
                }
              }
        </script>   
        
        
    
     
     
     
     <script>
         $("#usuarios").addClass("active");
         
         $('#checkHorario').change(function(){
                $('#salida2').prop("disabled", !$(this).is(':checked'));
                $('#entrada2').prop("disabled", !this.checked);
          });
         
         function initialize() {
            var options = {
                types: ['(geocode)']
            };
            var input = document.getElementById('autocomplete');
            var autocomplete = new google.maps.places.Autocomplete(input , options);
        }
        google.maps.event.addDomListener(window, 'load', initialize);
        
          
          
          var method = "<%=method%>";
          var civil = "<%=civil%>";
          var anioUni = "<%=anioUni%>";
          var anioSin = "<%=anioSin%>";
          if (civil !== null) {
              $("input[name=estadocivil][value='" + civil + "']").prop("checked",true);
          }
          
          if(<%=anio%> !== 0) {
              $("#anio").val("<%=anio%>");
          }
          
          
          if(method === "editar") { 
         
          
          $("#sangre").val("<%=sangre%>");
          $("#horaentrada").val("<%=hora_entrada%>");
          $("#horasalida").val("<%=hora_salida%>");
          $("#entrada2").val("<%=segunda_entrada%>");
          $("#salida2").val("<%=segunda_salida%>");
          $("#diaUni").val("<%=diaUni%>");
          $("#mesUni").val("<%=mesUni%>");
          if (anioUni !== 0) {
              $("#anioUni").val("<%=anioUni%>");
          }
          
          $("#diaSin").val("<%=diaSin%>");
          $("#mesSin").val("<%=mesSin%>");
          if (anioSin !== 0) {
              $("#anioSin").val("<%=anioSin%>");
          }
          
          $("#area").val("<%=areaID%>");
          $("#puesto").val("<%=puestoID%>");
          $("#categoria").val("<%=categoriaID%>");
          $("#grado").val("<%=grado%>");
          $("#parentesco").val("<%=parentesco%>");
      }
     </script>
    </body>
</html>
