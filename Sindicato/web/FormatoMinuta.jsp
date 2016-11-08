
<%@page import="java.util.Locale"%>
<%@page import="org.joda.time.DateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formato Minuta</title>
        
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
        
        <%
        String[] meses = {"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};
        String tipo = "";
        String numActa = "";
        String formatoID = "";
        String fecha = "";
        int dia = 0;
        int mes = 0;
        int anio = 0;
        String id = request.getParameter("id");
        String method = request.getParameter("method");
        
        if(method.equals("editarFormato")) {
            id = request.getAttribute("id").toString();
            tipo = request.getAttribute("tipo").toString();
            numActa = request.getAttribute("numActa").toString();
            fecha = request.getAttribute("fecha").toString();
            formatoID = request.getAttribute("formatoID").toString();
            
            DateTime date = new DateTime(fecha);
            dia = date.getDayOfMonth();
            mes = date.getMonthOfYear();
            anio = date.getYear();
        }
        
        
        %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2" style="margin-top: 20px">
                    <%@include file="srcJsp/nav-admin.jsp" %>
                </div>
                <!-- Area trabajo -->
                <div class="col-md-8 main" >
                    <div class="row" style="margin-left: 20px;">
                        <div class="col-lg-12">
                            <h1 class="page-header">Agregando formato de minuta</h1>
                        </div>
                    </div>
                    <div class="row" style="margin-left: 20px;" >
                        <div class="col-lg-6" style="margin-left: 10px;">
                            
                            <form action="ServletAsamblea" method="post" enctype="multipart/form-data" accept-charset="ISO-8859-1">
                                <input type="text" name="text" value="<%=method%>" hidden>
                                <input type="text" name="id" value="<%=id%>" hidden>
                                <input type="text" name="formatoID" value="<%=formatoID%>" hidden>
                                
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-5">
                                            <label>Número de acta</label>
                                            <input type="text" name="numActa" value="<%=numActa%>" class="form-control" required>
                                        </div>
                                        <div class="col-md-5">
                                            <label>Tipo</label>
                                            <select name="tipo" id="tipo" class="form-control">
                                                <option value="Ordinaria">Ordinaria</option>
                                                <option value="Extraordinaria" >Extraordinaria</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label>Fecha</label>
                                        <div class="row">                               
                                            <div class="col-xs-3">
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
                                            <div class="col-xs-5">
                                                <select name="mes" id="mes" class="form-control">
                                                    <%
                                                        for(int i=1; i <= meses.length; i++){
                                                            if (mes == i) {
                                                                out.print("<option value=\"" + i + "\" selected>" + meses[i-1] + "</option>");
                                                            } else {
                                                                out.print("<option value=\"" + i + "\">" + meses[i-1] + "</option>");
                                                            }

                                                        }
                                                    %>
                                                </select>
                                            </div>
                                            <div class="col-xs-3">
                                                <select name="anio" id="anio" class="form-control">
                                                    <%  
                                                        int year = new DateTime().getYear();
                                                        if (method.equals("editarFormato")) {
                                                            
                                                            for (int i = year; i >= anio; i--) {
                                                        
                                                    %>
                                                            <option value="<%=i%>"> <%=i%> </option>
                                                    <%
                                                            }
                                                        } else {
                                                    %>
                                                            <option value="<%=year%>"> <%=year%> </option>
                                                    <%
                                                        }
                                                    %>
                                                 </select>
                                            </div>
                                        </div>
                                </div>
                                <div class="form-group">
                                <label>Seleccionar archivo PDF (16MB max)</label><br>
                                <%
                                if(method.equals("editarFormato")){
                                %>
                                    <input type="file" name="archivo" accept="application/pdf">    
                                <%
                                }else {
                                %>
                                    <input type="file" name="archivo" accept="application/pdf" required>    
                                <%
                                }
                                %>
                                </div>
                                <p class="pull-right">
                                    <input type="submit" class="btn btn-success" style="padding: 10px 30px;" value="Guardar">
                                </p>
                                </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $("#asamblea").addClass("active"); 
            
            var method = <%=method%>;
            if(method === "editarFormato") {
                
                $("#dia").val("<%=dia%>");
                $("#mes").val("<%=mes%>");
                $("#anio").val("<%=anio%>");
                $("#tipo").val("<%=tipo%>");
            }
            
            /*
             * var row;
            $(document).ready(function(){
                $("#add").click(function(){
                    var numPersonal = $("#numPersonal").val();
                    var numAcuerdo = $("#numAcuerdo").val();
                    for(var i=0; i < numPersonal; i++) {
                        row = "<div class=\"row\">"
                            + "<div class=\"col-md-8\">"
                            + "<input type=\"text\" name=\"personal_" + i + "\" class=\"form-control\">"    
                            +    "</div>"
                            + "<div class=\"col-md-2\">"
                            +    "<label class=\"radio-inline\">"
                            +    "<input type=\"radio\" name=\"asiste_" + i +"\" value=\"Si\" checked> Si"
                            +    "</label>"
                            +    "<label class=\"radio-inline\">"
                            +        "<input type=\"radio\" name=\"asiste_" + i + "\" value=\"No\"> No"
                            +    "</label>"
                            + "</div>"
                            + "</div>"
                            + "<br/>";
                    $("#personal").append(row);
                    }
                    
                    
                    for(var i=0; i< numAcuerdo; i++) {
                        row =       "<div class=\"row\">"
                                +       "<div class=\"col-md-8\">"
                                +           "<input type=\"text\" name=\"acuerdo_" + i + "\" class=\"form-control\">"    
                                +       "</div>"
                                +       "<div class=\"col-md-4\">"
                                +           "<input type=\"text\" name=\"Aresponsable_" + i + "\" class=\"form-control\"> "   
                                +       "</div>"
                                + "</div>"
                                + "<br/>";
                        $("#acuerdo").append(row);
                    }
                });
            });
            */
        </script>
        <!-- BOOTSTRAP SCRIPTS -->
        <script src="js/bootstrap.js"></script>
        <script src="js/bootstrap-confirmation.js"></script>
    </body>
</html>
