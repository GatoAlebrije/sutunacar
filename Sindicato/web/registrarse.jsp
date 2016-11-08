
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrarse</title>
        
        <link href="css/bootstrap.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLES-->
        <link href="css/font-awesome.css" rel="stylesheet" />
         <!--WIZARD STYLES-->
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
         
        
        <style>
           .wizard {
                margin: 20px auto;
                background: #fff;
            }

            .wizard .nav-tabs {
                position: relative;
                margin: 40px auto;
                margin-bottom: 0;
                border-bottom-color: #e0e0e0;
            }

            .wizard > div.wizard-inner {
                position: relative;
            }

            .connecting-line {
                height: 2px;
                background: #e0e0e0;
                position: absolute;
                width: 80%;
                margin: 0 auto;
                left: 0;
                right: 0;
                top: 50%;
                z-index: 1;
            }

            .wizard .nav-tabs > li.active > a, .wizard .nav-tabs > li.active > a:hover, .wizard .nav-tabs > li.active > a:focus {
                color: #555555;
                cursor: default;
                border: 0;
                border-bottom-color: transparent;
            }

            span.round-tab {
                width: 70px;
                height: 70px;
                line-height: 70px;
                display: inline-block;
                border-radius: 100px;
                background: #fff;
                border: 2px solid #e0e0e0;
                z-index: 2;
                position: absolute;
                left: 0;
                text-align: center;
                font-size: 25px;
            }
            span.round-tab i{
                color:#555555;
            }
            .wizard .nav-tabs > li.active a{
                width: 90px;
                height: 90px;
            }
            .wizard li.active span.round-tab {
                background: #fff;
                border: 2px solid #5bc0de;
                width: 90px;
                height: 90px;
                line-height:90px;

            }
            .wizard li.active span.round-tab i{
                color: #5bc0de;
            }

            span.round-tab:hover {
                color: #333;
                border: 2px solid #333;
            }

            .wizard .nav-tabs > li {
                width: 25%;
            }

            .wizard li:after {
                content: " ";
                position: absolute;
                left: 46%;
                opacity: 0;
                margin: 0 auto;
                bottom: 0px;
                border: 5px solid transparent;
                border-bottom-color: #5bc0de;
                transition: 0.1s ease-in-out;
            }

            .wizard li.active:after {
                content: " ";
                position: absolute;
                left: 46%;
                opacity: 1;
                margin: 0 auto;
                bottom: 0px;
                border: 10px solid transparent;
                border-bottom-color: #5bc0de;
            }

            .wizard .nav-tabs > li a {
                width: 70px;
                height: 70px;
                margin: 20px auto;
                border-radius: 100%;
                padding: 0;
            }

                .wizard .nav-tabs > li a:hover {
                    background: transparent;
                }

            .wizard .tab-pane {
                position: relative;
                padding-top: 50px;
            }

            .wizard h3 {
                margin-top: 0;
            }
            
            .step1{
                border:1px solid #ccc;
                border-radius:5px;
                padding: 20px 35px;
                margin-bottom:10px;
            }
            .step1 .row {
                margin-bottom:10px;
            }
            .step_21 {
                border :1px solid #eee;
                border-radius:5px;
                padding:10px;
            }
            .step33 {
                border:1px solid #ccc;
                border-radius:5px;
                padding-left:10px;
                margin-bottom:10px;
            }
            .step44{
                border:1px solid #ccc;
                border-radius:5px;
                padding: 20px 35px;
                margin-bottom:10px;
            }
            .dropselectsec {
                width: 68%;
                padding: 6px 5px;
                border: 1px solid #ccc;
                border-radius: 3px;
                color: #333;
                margin-left: 10px;
                outline: none;
                font-weight: normal;
            }
            .dropselectsec1 {
                width: 74%;
                padding: 6px 5px;
                border: 1px solid #ccc;
                border-radius: 3px;
                color: #333;
                margin-left: 10px;
                outline: none;
                font-weight: normal;
            }
            .mar_ned {
                margin-bottom:10px;
            }
            .wdth {
                width:25%;
            }
            .birthdrop {
                padding: 6px 5px;
                border: 1px solid #ccc;
                border-radius: 3px;
                color: #333;
                margin-left: 10px;
                width: 16%;
                outline: 0;
                font-weight: normal;
            }


            /* according menu */
            #accordion-container {
                font-size:13px
            }
            .accordion-header {
                font-size:13px;
                    background:#ebebeb;
                    margin:5px 0 0;
                    padding:7px 20px;
                    cursor:pointer;
                    color:#fff;
                    font-weight:400;
                    -moz-border-radius:5px;
                    -webkit-border-radius:5px;
                    border-radius:5px
            }
            .unselect_img{
                    width:18px;
                    -webkit-user-select: none;  
                    -moz-user-select: none;     
                    -ms-user-select: none;      
                    user-select: none; 
            }
            .active-header {
                    -moz-border-radius:5px 5px 0 0;
                    -webkit-border-radius:5px 5px 0 0;
                    border-radius:5px 5px 0 0;
                    background:#F53B27;
            }
            .active-header:after {
                    content:"\f068";
                    font-family:'FontAwesome';
                    float:right;
                    margin:5px;
                    font-weight:400
            }
            .inactive-header {
                    background:#333;
            }
            .inactive-header:after {
                    content:"\f067";
                    font-family:'FontAwesome';
                    float:right;
                    margin:4px 5px;
                    font-weight:400
            }
            .accordion-content {
                    display:none;
                    padding:20px;
                    background:#fff;
                    border:1px solid #ccc;
                    border-top:0;
                    -moz-border-radius:0 0 5px 5px;
                    -webkit-border-radius:0 0 5px 5px;
                    border-radius:0 0 5px 5px
            }
            .accordion-content a{
                    text-decoration:none;
                    color:#333;
            }
            .accordion-content td{
                    border-bottom:1px solid #dcdcdc;
            }



            @media( max-width : 585px ) {

                .wizard {
                    width: 90%;
                    height: auto !important;
                }

                span.round-tab {
                    font-size: 16px;
                    width: 50px;
                    height: 50px;
                    line-height: 50px;
                }

                .wizard .nav-tabs > li a {
                    width: 50px;
                    height: 50px;
                    line-height: 50px;
                }

                .wizard li.active:after {
                    content: " ";
                    position: absolute;
                    left: 35%;
                }
            } 
            
            /*-------------------- CSS PROPIOS----------------------*/
            
            .boton-registrarse{
                font-size: 15px;
                padding: 15px;
            }
            

              
        </style>
    </head>
    <body>
        <div class="container" style="width: 65%;">
            <div class="row">
                <section>
                <div class="wizard">
                    <div class="wizard-inner">
                        <div class="connecting-line"></div>
                        <ul class="nav nav-tabs" role="tablist">

                            <li role="presentation" class="active">
                                <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Datos personales">
                                    <span class="round-tab">
                                        <i class="fa fa-user"></i>
                                    </span>
                                </a>
                            </li>

                            <li role="presentation" class="disabled">
                                <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Datos laborales">
                                    <span class="round-tab">
                                        <i class="fa fa-suitcase"></i>
                                    </span>
                                </a>
                            </li>
                            <li role="presentation" class="disabled">
                                <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Escolaridad">
                                    <span class="round-tab">
                                        <i class="fa fa-graduation-cap"></i>
                                    </span>
                                </a>
                            </li>

                            <!--li role="presentation" class="disabled">
                                <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="Referencia familiar">
                                    <span class="round-tab">
                                        <i class="fa fa-users"></i>
                                    </span>
                                </a>
                            </li-->
                        </ul>
                    </div>

                    <form role="form">
                        <div class="tab-content">
                            <div class="tab-pane active" role="tabpanel" id="step1">
                                
                                <div class="step1">
                                    <h2><strong>Datos personales</strong></h2>
                                    <hr>
                                    <div class="form-group">
                                            <label>Nombre</label>
                                            <input type="text" class="form-control" autofocus required pattern="[A-Za-z\s]{2,}" placeholder="Nombre">
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Apellido materno</label>
                                                <input type="text" class="form-control"  required pattern="[A-Za-z\s]{2,}" placeholder="Apellido materno">
                                            </div>
                                            <div class="col-md-6">
                                                <label>Apellido paterno</label>
                                                <input type="text" class="form-control"  required pattern="[A-Za-z\s]{2,}" placeholder="Apellido paterno">
                                            </div>
                                        </div>
                                    </div>                                   
                                    <div class="form-group">
                                            <label>Fecha de naciemiento</label>
                                            <div class="row">                               
                                                <div class="col-xs-2">

                                                    <select name="dia" id="dia" class="form-control">
                                                        <%for (int i=1;i<32;i++){%>
                                                        <option value="<%=i%>"><%=i%></option>
                                                        <%}%>
                                                    </select>
                                                </div>
                                                <div class="col-xs-3">
                                                    <select name="mes" id="mes" class="form-control">
                                                        <option value="enero">Enero</option>
                                                        <option value="febrero">Febrero</option>
                                                        <option value="marzo">Marzo</option>
                                                        <option value="abril">Abril</option>
                                                        <option value="mayo">Mayo</option>
                                                        <option value="junio">Junio</option>
                                                        <option value="julio">Julio</option>
                                                        <option value="agosto">Agosto</option>
                                                        <option value="septiembre">Septiembre</option>
                                                        <option value="octubre">Octubre</option>
                                                        <option value="noviembre">Noviembre</option>
                                                        <option value="diciembre">Diciembre</option>
                                                    </select>
                                                </div>
                                                <div class="col-xs-2">
                                                    <select name="anio" id="anio" class="form-control">
                                                        <% int year = (Integer)Calendar.getInstance().get(Calendar.YEAR);
                                                           int max = year-70;
                                                           int min = year-18;
                                                           for(int i=min; i>=max; i--){   
                                                        %>
                                                        <option value="<%=i%>"><%=i%></option>
                                                        <%}%>
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
                                                    <input type="text" class="form-control"  required pattern="[A-Za-z\s]{2,}" >
                                                </div>
                                                <div class="col-xs-2">
                                                    <span>Número exterior</span>
                                                    <input type="text" class="form-control"  required pattern="\d+" >
                                                </div>
                                                <div class="col-xs-2">
                                                    <span>Número interior</span>
                                                    <input type="text" class="form-control"  required pattern="\d+" >
                                                </div>
                                            </div>
                                            <br />
                                            <div class="row">
                                                <div class="col-md-5">
                                                    <span>Cruzamiento</span>
                                                    <input type="text" class="form-control"  required pattern="[A-Za-z\s]{2,}" >
                                                </div>                                               
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-3">
                                                    <span>Colonia</span>
                                                    <input type="text" class="form-control"  required >
                                                    
                                                </div>
                                                <div class="col-xs-2">
                                                    <span>Código postal</span>
                                                    <input type="text" class="form-control"  required pattern="\d+" >
                                                </div>
                                            </div>
                                            <br />
                                            <div class="row">
                                                <div class="col-xs-3">
                                                    <span>País</span>
                                                    <select name="pais" id="pais" class="form-control">
                                                        
                                                    </select>
                                                </div>
                                                <div class="col-xs-3">
                                                    <span>Estado</span>
                                                    <select name="estado" id="estado" class="form-control">
                                                        <option value="estado">Estado 1</option>
                                                        <option value="estado">Estado 2</option>
                                                        <option value="estado">Estado 3</option>
                                                        <option value="estado">Estado 4</option>
                                                    </select>
                                                    
                                                </div>
                                                <div class="col-xs-3">
                                                    <span>Ciudad</span>
                                                    <select name="ciudad" id="ciudad" class="form-control">
                                                        <option value="ciudad">Ciudad 1</option>
                                                        <option value="ciudad">Ciudad 2</option>
                                                        <option value="ciudad">Ciudad 3</option>
                                                        <option value="ciudad">Ciudad 4</option>
                                                    </select>                                                  
                                                </div>
                                            </div>
                                        <hr />         
                                        </div>
                                        <div class="form-group">
                                            <label>Estado civil</label> <br /><br />
                                            <div style="margin-left: 25px;">
                                                <label class="radio-inline">
                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> Soltero
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> Comprometido
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3"> Casado
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3"> Divorciado
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3"> Viudo
                                                </label>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Correo electr&oacute;nico</label>
                                                    <input type="email" class="form-control" required placeholder="Correo electrónico">
                                                </div>
                                            </div>                                                                                                                                    
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-4">
                                                <label for="exampleInputEmail1">Tel&eacute;fono de casa</label>
                                                <input type="text" class="form-control" id="exampleInputEmail1" pattern="\d+" placeholder="Teléfono">
                                            </div>  
                                            <div class="col-md-6">
                                                <label for="exampleInputEmail1">Tel&eacute;fono celular</label>
                                                <input type="text" class="form-control" id="exampleInputEmail1" pattern="\d+" placeholder="Teléfono">
                                            </div> 
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>RFC</label>
                                                <input type="text" name="rfc" class="form-control" required placeholder="RFC">
                                            </div>
                                            <div class="col-xs-6">
                                                <label>CURP</label>
                                                <input type="text" name="curp" class="form-control"  placeholder="CURP" required>
                                            </div>
                                        </div>
                                        <br />                                       
                                        <div class="row">
                                            <div class="col-xs-6">
                                                <label>N&uacute;mero de seguro social</label>
                                                <input type="text" name="seguridad" class="form-control" required placeholder="Seguridad Social">
                                            </div>
                                            <div class="col-xs-6">
                                                <label>Tipo de sangre</label>
                                                <select name="turno" id="turno" class="form-control">
                                                    <option value="o+">O+</option>
                                                    <option value="o-">O-</option>
                                                    <option value="a+">A+</option>
                                                    <option value="a-">A-</option>
                                                    <option value="b+">B+</option>
                                                    <option value="b-">B-</option>
                                                    <option value="ab+">AB+</option>
                                                    <option value="ab-">AB-</option>
                                                </select>
                                            </div> 
                                        </div>
                                        <br />                                        
                                        <div class="form-group">
                                            <label>Foto de perfil</label><br>
                                            <input type="file" name="foto" accept="image/gif, image/jpeg, image/png" required>    
                                        </div>                              
                                </div>
                                <ul class="list-inline pull-right">
                                    <li><button type="button" class="btn btn-primary next-step">Continuar</button></li>
                                </ul>
                            </div>
                            <div class="tab-pane" role="tabpanel" id="step2">
                                <div class="step2">
                                    <div class="step_21" style="padding: 30px;">
                                        <h2><strong>Datos laborales</strong></h2>
                                        <hr>
                                        <div class="row">
                                            <div class="col-xs-3">
                                                <label>N&uacute;mero de empleado</label>
                                                <input type="text" class="form-control" name="num" autofocus required pattern="\d+"> 
                                            </div>
                                                           
                                        </div>
                                        <br />
                                        <div class="checkbox">
                                            <label data-toggle="tooltip" title="Seleccionar si tienes dos horarios de entrada y salida en el dia"><input type="checkbox" id="checkHorario" name="checkHorario" >
                                                Horario cortado
                                            </label>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-3">
                                                <label>Horario de entrada</label>
                                                <select name="" id="grado" class="form-control">  
                                                    <%for(int i=7; i<=22; i++){   
                                                    %>
                                                        <option value="<%=i%>"><%=i%>:00 hrs</option>
                                                    <%}%>                                                    
                                                </select>
                                            </div>
                                            <div class="col-xs-3">
                                                <label>Horario de salida</label>
                                                <select name="" id="grado" class="form-control">   
                                                <%for(int i=7; i<=22; i++){   
                                                    %>
                                                        <option value="<%=i%>"><%=i%>:00 hrs</option>
                                                    <%}%>
                                                </select>
                                            </div>                                                          
                                        </div>
                                        <br />
                                        <!-------------Segundo Horario------------->
                                        <div class="row">
                                            <div class="col-xs-3">
                                                <label>Horario de entrada</label>
                                                <select name="" id="checkRow" class="form-control" disabled="">  
                                                    <%for(int i=7; i<=22; i++){   
                                                    %>
                                                        <option value="<%=i%>"><%=i%>:00 hrs</option>
                                                    <%}%>                                                    
                                                </select>
                                            </div>
                                            <div class="col-xs-3">
                                                <label>Horario de salida</label>                                                
                                                <select name="" id="checkRowTwo" class="form-control" disabled="">   
                                                    <%for(int i=7; i<=22; i++){   
                                                    %>
                                                        <option value="<%=i%>"><%=i%>:00 hrs</option>
                                                    <%}%>
                                                </select>
                                            </div>                                                          
                                        </div>
                                        <br />
                                        
                                        <hr />
                                        <div class="form-group">
                                            <label>Fecha de ingreso a la universidad</label> <p />
                                            <div class="row">                               
                                                <div class="col-xs-2">

                                                    <select name="dia" id="dia" class="form-control">
                                                        <%for (int i=1;i<32;i++){%>
                                                        <option value="<%=i%>"><%=i%></option>
                                                        <%}%>
                                                    </select>
                                                </div>
                                                <div class="col-xs-3">
                                                    <select name="mes" id="mes" class="form-control">
                                                        <option value="enero">Enero</option>
                                                        <option value="febrero">Febrero</option>
                                                        <option value="marzo">Marzo</option>
                                                        <option value="abril">Abril</option>
                                                        <option value="mayo">Mayo</option>
                                                        <option value="junio">Junio</option>
                                                        <option value="julio">Julio</option>
                                                        <option value="agosto">Agosto</option>
                                                        <option value="septiembre">Septiembre</option>
                                                        <option value="octubre">Octubre</option>
                                                        <option value="noviembre">Noviembre</option>
                                                        <option value="diciembre">Diciembre</option>
                                                    </select>
                                                </div>
                                                <div class="col-xs-2">
                                                    <select name="anio" id="anio" class="form-control">
                                                        <% 
                                                           for(int i=min; i>=max; i--){   
                                                        %>
                                                        <option value="<%=i%>"><%=i%></option>
                                                        <%}%>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>                                                                                          
                                         
                                        <div class="form-group">
                                            <label>Fecha de ingreso al sindicato</label>
                                            <p></p>
                                            <div class="row">                               
                                                <div class="col-xs-2">

                                                    <select name="dia" id="dia" class="form-control">
                                                        <%for (int i=1;i<32;i++){%>
                                                        <option value="<%=i%>"><%=i%></option>
                                                        <%}%>
                                                    </select>
                                                </div>
                                                <div class="col-xs-3">
                                                    <select name="mes" id="mes" class="form-control">
                                                        <option value="enero">Enero</option>
                                                        <option value="febrero">Febrero</option>
                                                        <option value="marzo">Marzo</option>
                                                        <option value="abril">Abril</option>
                                                        <option value="mayo">Mayo</option>
                                                        <option value="junio">Junio</option>
                                                        <option value="julio">Julio</option>
                                                        <option value="agosto">Agosto</option>
                                                        <option value="septiembre">Septiembre</option>
                                                        <option value="octubre">Octubre</option>
                                                        <option value="noviembre">Noviembre</option>
                                                        <option value="diciembre">Diciembre</option>
                                                    </select>
                                                </div>
                                                <div class="col-xs-2">
                                                    <select name="anio" id="anio" class="form-control">
                                                        <% 
                                                           for(int i=min; i>=max; i--){   
                                                        %>
                                                        <option value="<%=i%>"><%=i%></option>
                                                        <%}%>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        
                                       
                                        
                                        <hr />
                                        <div class="row">
                                            <div class="col-xs-3">
                                                <label>&Aacute;rea de Adscripci&oacute;n</label>
                                                <select name="turno" id="turno" class="form-control">
                                                    <option value="DES">DES 1</option>
                                                    <option value="DES">DES 2</option>
                                                    <option value="DES">DES 3</option>
                                                    <option value="DES">DES 4</option>
                                                    <option value="DES">DES 5</option>
                                                    <option value="DES">DES 6</option>
                                                    <option value="DES">DES 7</option>
                                                    <option value="DES">DES 8</option>
                                                </select>
                                            </div>                                            
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-xs-5">
                                                <label>Profesi&oacute;n u oficio</label>
                                                <input type="text" name="profesion" class="form-control" required placeholder="Profesión">
                                            </div>
                                            <div class="col-xs-5">
                                                <label>Ocupaci&oacute;n</label>
                                                <input type="text" name="ocupacion" class="form-control" required placeholder="Ocupación">
                                            </div>                                                                                       
                                        </div>
                                    </div>                                    
                                </div>
                                <br />
                                <ul class="list-inline pull-right">
                                    <li><button type="button" class="btn btn-default prev-step">Anterior</button></li>
                                    <li><button type="button" class="btn btn-primary next-step">Siguiente</button></li>
                                </ul>
                            </div>
                            <div class="tab-pane" role="tabpanel" id="step3">
                                <div class="step33" style="padding: 30px;">
                                    <h2><strong>Datos Escolares</strong></h2>
                                    <hr>                                       
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <label>Grado m&aacute;ximo de estudio</label>
                                                <select name="grado" id="grado" class="form-control">   
                                                    <option value="licenciatura">Primaria</option>
                                                    <option value="licenciatura">Secundaria</option>
                                                    <option value="licenciatura">Preparatoria</option>
                                                    <option value="licenciatura">Licenciatura</option>
                                                    <option value="maestria">Maestria</option>
                                                    <option value="doctorado">Doctorado</option>
                                                </select>
                                        </div>
                                    </div>                                       
                                            <br />
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-xs-6">
                                                <label>Otros</label>
                                                <input type="text" class="form-control" placeholder="Otros">
                                            </div>
                                        </div>
                                    </div>                                          
                                </div>
                                <ul class="list-inline pull-right">
                                        <li><button type="button" class="btn btn-default prev-step">Anterior</button></li>                                       
                                        <li><button type="button" class="btn btn-primary btn-info-full next-step">Siguiente</button></li>
                                </ul>
                            </div>
                            <div class="tab-pane" role="tabpanel" id="complete">
                                <div class="step44">
                                    <h2><strong>Referencia familiar</strong></h2>
                                    <hr>
                                    <div class="form-group">
                                        <label>Nombre</label>
                                        <input type="text" name="refnombre" pattern="[A-Za-z\s]{2,}" autofocus class="form-control"
                                           title="Introduce nombre de la persona de referencia">
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Apellido materno</label>
                                            <input type="text" name="refmaterno" pattern="[A-Za-z\s]{2,}" class="form-control"
                                                    title="Introduce el apellido materno de la persona de referencia">
                                        </div>
                                        <div class="col-md-6">
                                            <label>Apellido paterno</label>
                                            <input type="text" name="refpaterno" pattern="[A-Za-z\s]{2,}" class="form-control"
                                                   title="Introduce el apellido paterno de la persona de referencia">
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">                                       
                                        <div class="col-xs-4">
                                            <label>Tel&eacute;fono de casa</label>
                                            <input type="text" name="reftelefono" class="form-control">
                                        </div>
                                        <div class="col-xs-6">
                                            <label>Tel&eacute;fono celular</label>
                                            <input type="text" name="reftelefono" class="form-control">
                                        </div>
                                    </div>
                                    <br />
                                    <hr />
                                    <div class="form-group">
                                            <label>Domicilio</label><br /><br />
                                            <div class="row">
                                                <div class="col-md-5">
                                                    <span>Calle</span>
                                                    <input type="text" class="form-control" pattern="[A-Za-z\s]{2,}" >
                                                </div>
                                                <div class="col-xs-2">
                                                    <span>Número exterior</span>
                                                    <input type="text" class="form-control" pattern="\d+" >
                                                </div>
                                                <div class="col-xs-2">
                                                    <span>Número interior</span>
                                                    <input type="text" class="form-control" pattern="\d+" >
                                                </div>
                                            </div>
                                            <br />
                                            <div class="row">
                                                <div class="col-md-5">
                                                    <span>Cruzada de calle</span>
                                                    <input type="text" class="form-control"  pattern="[A-Za-z\s]{2,}" >
                                                </div>                                                
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-3">
                                                    <span>Colonia</span>
                                                    <input type="text" class="form-control" >
                                                    
                                                </div>
                                                <div class="col-xs-2">
                                                    <span>Código postal</span>
                                                    <input type="text" class="form-control"   pattern="\d+" >
                                                </div>
                                            </div>
                                            <br />
                                            <div class="row">
                                                <div class="col-xs-3">
                                                    <span>País</span>
                                                    <select name="pais" id="pais" class="form-control">
                                                        <option value="pais">Pais 1</option>
                                                        <option value="pais">Pais 2</option>
                                                        <option value="pais">Pais 3</option>
                                                        <option value="pais">Pais 4</option>
                                                    </select>
                                                </div>
                                                <div class="col-xs-3">
                                                    <span>Estado</span>
                                                    <select name="estado" id="estado" class="form-control">
                                                        <option value="estado">Estado 1</option>
                                                        <option value="estado">Estado 2</option>
                                                        <option value="estado">Estado 3</option>
                                                        <option value="estado">Estado 4</option>
                                                    </select>
                                                    
                                                </div>
                                                <div class="col-xs-3">
                                                    <span>Ciudad</span>
                                                    <select name="ciudad" id="ciudad" class="form-control">
                                                        <option value="ciudad">Ciudad 1</option>
                                                        <option value="ciudad">Ciudad 2</option>
                                                        <option value="ciudad">Ciudad 3</option>
                                                        <option value="ciudad">Ciudad 4</option>
                                                    </select>                                                  
                                                </div>
                                            </div>
                                        <hr />         
                                        </div>
                                    
                                    <br>
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <label>Parentesco</label>
                                            <select name="ciudad" id="parentesco" class="form-control">
                                                        <option value="">Abuelo</option>
                                                        <option value="">Padre</option>
                                                        <option value="">Hijo</option>
                                                        <option value="">Tio</option>
                                                        <option value="">Sobrino</option>
                                                        <option value="">Primo</option>
                                                        <option value="">Amigo</option>
                                            </select>
                                        </div>
                                    </div>
                                    
                                </div>
                                <ul class="list-inline pull-right">
                                        <li><button type="button" class="btn btn-default prev-step">Anterior</button></li>                                       
                                        <li><button type="submit" class="btn btn-primary btn-info-full next-step boton-registrarse">Registrar</button></li>
                                    </ul>
                            </div>
                            <div class="clearfix"></div>
                        
                    </form>
                </div>
            </section>
           </div>
    </div> 
                                                        
                                                      
        <script>
            $(document).ready(function () {
                //Initialize tooltips
                $('.nav-tabs > li a[title]').tooltip();

                //Wizard
                $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {

                    var $target = $(e.target);

                    if ($target.parent().hasClass('disabled')) {
                        return false;
                    }
                });

                $(".next-step").click(function (e) {

                    var $active = $('.wizard .nav-tabs li.active');
                    $active.next().removeClass('disabled');
                    nextTab($active);

                });
                $(".prev-step").click(function (e) {

                    var $active = $('.wizard .nav-tabs li.active');
                    prevTab($active);

                });
            });

            function nextTab(elem) {
                $(elem).next().find('a[data-toggle="tab"]').click();
            }
            function prevTab(elem) {
                $(elem).prev().find('a[data-toggle="tab"]').click();
            }


            //according menu

            $(document).ready(function()
            {
                //Add Inactive Class To All Accordion Headers
                $('.accordion-header').toggleClass('inactive-header');

                    //Set The Accordion Content Width
                    var contentwidth = $('.accordion-header').width();
                    $('.accordion-content').css({});

                    //Open The First Accordion Section When Page Loads
                    $('.accordion-header').first().toggleClass('active-header').toggleClass('inactive-header');
                    $('.accordion-content').first().slideDown().toggleClass('open-content');

                    // The Accordion Effect
                    $('.accordion-header').click(function () {
                            if($(this).is('.inactive-header')) {
                                    $('.active-header').toggleClass('active-header').toggleClass('inactive-header').next().slideToggle().toggleClass('open-content');
                                    $(this).toggleClass('active-header').toggleClass('inactive-header');
                                    $(this).next().slideToggle().toggleClass('open-content');
                            }

                            else {
                                    $(this).toggleClass('active-header').toggleClass('inactive-header');
                                    $(this).next().slideToggle().toggleClass('open-content');
                            }
                    });

                    return false;
            });
            
            
            
            $('#checkHorario').change(function(){
                $('#checkRow').prop("disabled", !$(this).is(':checked'));
                $('#checkRowTwo').prop("disabled", !this.checked);
            });
            
            
            
        </script>
        
        <script src="js/countries.js"></script>
        
        <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
        <!-- JQUERY SCRIPTS -->
        
        
        <!-- BOOTSTRAP SCRIPTS -->
        <script src="js/bootstrap.js"></script>
        <!-- METISMENU SCRIPTS -->
        <script src="js/jquery.metisMenu.js"></script>
         <!-- WIZARD SCRIPTS -->
        <script src="js/wizard/modernizr-2.6.2.min.js"></script>
        <script src="js/wizard/jquery.cookie-1.3.1.js"></script>
        <script src="js/wizard/jquery.steps.js"></script>
    </body>
</html>
