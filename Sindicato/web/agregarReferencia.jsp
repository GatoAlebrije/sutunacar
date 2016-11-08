<%@page import="java.util.Locale"%>
<%@include file="session.jsp" %>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="classes.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Referencia</title>
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
        <%
            String id = "";
            String refnombre = "";
            String refpaterno = "";
            String refmaterno = "";
            String reftel = "";
            String refcasa = "";
            String refcalle = "";
            String refext = "";
            String refint = "";
            String refcruzamiento = "";
            String refcolonia = "";
            String refpostal = "";
            String parentesco = "";
            //String refpais = "";
            //String refestado = "";
            String refciudad = "";
            String porcentaje = "";
            String comentarios = "";
            String empleadoID = "";
            Conexion conexion = new Conexion();
            Connection conn = conexion.Conexion();
            String text = request.getParameter("text");
            if(text.equals("editarReferencia")) {
                id = request.getParameter("id");
                String sql = "select * from referencia where referenciaID = " + id;
                try {
                    Statement s = conn.createStatement();
                    ResultSet rs = s.executeQuery(sql);
                    if(rs.next()) {
                        empleadoID = rs.getString("empleadoID");
                        refnombre = rs.getString("nombre");
                        refpaterno = rs.getString("apePaterno");
                        refmaterno = rs.getString("apeMaterno");
                        reftel = rs.getString("telefono");
                        refcasa = rs.getString("tel_casa");
                        //refpais = rs.getString("pais");
                        //refestado = rs.getString("estado");
                        parentesco = rs.getString("parentesco");
                        refcalle = rs.getString("calle");
                        refext = rs.getString("numext");
                        refint = rs.getString("numint");
                        refcruzamiento = rs.getString("cruzamiento");
                        refcolonia = rs.getString("colonia");
                        refpostal = rs.getString("postal");
                        refciudad = rs.getString("ciudad");
                    }
                } catch(SQLException e) {
                    e.printStackTrace();
                }
            } else if(text.equals("editarBeneficiario")) {
                id = request.getParameter("id");
                String sql = "select * from beneficiario where beneficiarioID = " + id;
                try {
                    Statement s = conn.createStatement();
                    ResultSet rs = s.executeQuery(sql);
                    if(rs.next()) {
                        empleadoID = rs.getString("empleadoID");
                        refnombre = rs.getString("nombre");
                        refpaterno = rs.getString("apePaterno");
                        refmaterno = rs.getString("apeMaterno");
                        reftel = rs.getString("telefono");
                        refcasa = rs.getString("tel_casa");
                        //refpais = rs.getString("pais");
                        //refestado = rs.getString("estado");
                        parentesco = rs.getString("parentesco");
                        refcalle = rs.getString("calle");
                        refext = rs.getString("numext");
                        refint = rs.getString("numint");
                        refcruzamiento = rs.getString("cruzamiento");
                        refcolonia = rs.getString("colonia");
                        refpostal = rs.getString("postal");
                        refciudad = rs.getString("ciudad");
                        porcentaje = rs.getString("porcentaje");
                        comentarios = rs.getString("comentarios");
                    }
                } catch(SQLException e) {
                    e.printStackTrace();
                }
            } else if(text.equals("agregarReferencia") || text.equals("agregarBeneficiario")) {
                empleadoID = request.getParameter("id");
            }
        %>
        
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2" style="margin-top: 20px">
                    
                    <%@include file="srcJsp/nav-admin.jsp" %>
                </div>
                <div class="col-md-10 main">
                    <div class="row">
                        <div class="col-lg-12">
                            <%
                            if(text.equals("agregarReferencia") || text.equals("editarReferencia")) {
                            %>
                            <h3 class="page-header">Referencia del empleado</h3>
                            <%
                            } else {
                            %>
                            <h3 class="page-header">Beneficiario del empleado</h3>
                            <%
                            }
                            %>
                        </div>
                        <div class="col-lg-7" style="margin-left: 30px;">
                            <form action="RegistrarUsuario" method="GET">
                                <input type="text" name="empleadoID" value="<%= empleadoID %>" hidden>
                                <input type="text" name="id" value="<%= id %>" hidden>
                                <input type="text" name="text" value="<%= text %>" hidden>
                                <div class="form-group">
                                <label>Nombre</label>
                                <input type="text" name="refnombre" value="<%=refnombre%>" pattern="[A-Za-z\s]{2,}" autofocus class="form-control"
                                    title="Introduce nombre de la persona de referencia" autocomplete="off">
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Apellido materno</label>
                                            <input type="text" name="refmaterno" value="<%=refpaterno%>" pattern="[A-Za-z\s]{2,}" class="form-control"
                                                title="Introduce el apellido materno de la persona de referencia" autocomplete="off">
                                        </div>
                                        <div class="col-md-6">
                                            <label>Apellido paterno</label>
                                            <input type="text" name="refpaterno" value="<%=refmaterno%>" pattern="[A-Za-z\s]{2,}" class="form-control"
                                                title="Introduce el apellido paterno de la persona de referencia" autocomplete="off">
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div class="form-group">
                                    <div class="row">     
                                    <div class="col-xs-6">
                                        <label>Tel&eacute;fono celular</label>
                                        <input type="text" name="reftelefono" value="<%=reftel%>" class="form-control" autocomplete="off">
                                    </div>
                                    <div class="col-xs-4">
                                        <label>Tel&eacute;fono de casa</label>
                                        <input type="text" name="reftelcasa" value="<%=refcasa%>" class="form-control" autocomplete="off">
                                    </div>
                                    </div>
                                </div>
                                <hr />
                                <div class="form-group">
                                    <label>Domicilio</label><br /><br />
                                    <div class="row">
                                    <div class="col-md-5">
                                        <span>Calle</span>
                                        <input type="text" name="refcalle" value="<%=refcalle%>" class="form-control"  required pattern="[A-Za-z\s]{2,}" autocomplete="off">
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
                                            <input type="text" name="refcruzamiento" value="<%=refcruzamiento%>" class="form-control"  required pattern="[A-Za-z\s]{2,}" autocomplete="off">
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
                                    <br />
                                    <div class="row">
                                        <div class="col-xs-8">
                                            <input id="autocomplete" name="refciudad" class='form-control' placeholder="Ejemplo: Ciudad del Carmen, Campeche, México"
                                            onFocus="geolocate()" type="text" value="<%=refciudad%>">
                                        </div>
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
                                    <%
                                    if(text.equals("agregarBeneficiario") || text.equals("editarBeneficiario")) {
                                    %>
                                    <div class="form-group">
                                        <label>Porcentaje y comentarios</label><br /><br />
                                        <div class="row">
                                            <div class="col-md-3">
                                                <span>Porcentaje</span>
                                                <input type="text" name="porcentaje" value="<%=porcentaje%>" class="form-control"  autocomplete="off">
                                            </div>
                                            <div class="col-md-9">
                                                <span>Comentarios</span>
                                                <input type="text" name="comentarios" value="<%=comentarios%>" class="form-control"  autocomplete="off">
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                    }
                                    %>
                                    <p class="pull-right">
                                        <button type="submit" class="btn btn-primary btn-lg"><i class="material-icons pull-left">done</i>&nbsp;Registrar</button>
                                    </p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
                
    <script src="js/bootstrap.js"></script>
    <script>
        $("#usuarios").addClass("active");
        
        if (<%=text%> === "editar") {
           
            $('#parentesco').select(<%=parentesco%>);
        }
        
        
    </script>
    
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
    
    </body>
</html>
