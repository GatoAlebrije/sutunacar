
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sindicato Único de Trabajadores</title>
        
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLES-->
        <link href="css/font-awesome.css" rel="stylesheet" />
        
        <!-- Custom styles for this template -->
       
        
        
        <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Raleway:400,300,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Assistant">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Droid+Serif">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Cairo">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Arvo">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <style>
        body{
            margin: 0;
            padding: 0;
        }
        
        
        /*-------------------------SECCION NOTICIA----------------------------*/
        .ruta{
            font-family: "Assistant";
            color: #9e9e9e;
            text-align: left;
            margin: auto;
            margin-bottom: 6px;
            width: 900px;
            
        }
        .titulo-pagina{
            width: 888px;
            height: 50px;
            background-color: rgb(20,30,36);
            margin:auto;
            
            padding-left: 10px;
            padding-bottom: 10px;
            font-size: 20px;
            text-align: left;
            color: white;
            font-family: "Cairo", serif;
            border: 1px solid #ccc;
            
        }
        .seccion-noticia{
            width: 1000px;
            overflow: auto;
            
            margin: auto;
            margin-bottom: 30px;
            background-color: white;
            
            /*-moz-box-shadow: 2px 2px 8px rgba(0, 0, 0, .2);
            -webkit-box-shadow: 2px 2px 8px rgba(0, 0, 0, .2);
            box-shadow: 2px 2px 8px rgba(0, 0, 0, .2);*/
            
                
        }
        /*.seccion-noticia a{
            background-color: #2b844d;
            color: white;
            padding: 14px 16px;
            text-decoration: none;
            border-radius: 5px;
            transition: 0.2s;
            
        }
        .seccion-noticia a:hover{
            background-color: #349e5c;
        }*/
        .noticia-relevante{
                       
            overflow: auto;          
            text-align: justify;  
            
        }        
        .noticia-relevante a{
            float: right;
            
            
        }        
        .noticia-relevante p{
            font-family: "Assistant";
            font-size: 18px;
        }
        .noticia-relevante h1{
            font-family: "Arvo";
        }
        
        .noticia{
            display: inline-block;             
            overflow: auto;
            text-align: justify;
        }        
        .noticia a{
            float: right;            
        }
        .noticia h3{                      
            font-family: "Cairo";            
        }
        .noticia p{
            font-family: "Assistant", serif;
            font-size: 16px;
            color: #333333;
        }       
        .footer{
            padding: 15px 46px;
            width: 100%;
            height: 80px;
            background-color: #05080a;
        }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-default navbar-fixed-top ">
            <div class="container-fluid">
              <!-- Brand and toggle get grouped for better mobile display -->
              <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                  <span class="sr-only">Toggle navigation</span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">SUTUNACAR</a>
              </div>

              <!-- Collect the nav links, forms, and other content for toggling -->
              <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                  <li class="active"><a href="index.jsp">Inicio <span class="sr-only">(current)</span></a></li>
                  <li><a href="#">Eventos</a></li>
                  <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Nosotros <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                      <li><a href="#">Objetivos</a></li>
                      <li><a href="#">Beneficios</a></li>
                      <li><a href="#">Directorio</a></li>
                      <li role="separator" class="divider"></li>
                      <li><a href="#">Contrato colectivo</a></li>
                      <li role="separator" class="divider"></li>
                      <li><a href="#">Contáctanos</a></li>
                    </ul>
                  </li>
                </ul>
                
                <ul class="nav navbar-nav navbar-right" style="margin-right: 30px;">                   
                    <li><a href="login.jsp" ><i class="fa fa-sign-in"></i> &nbsp; Iniciar sesión</a></li>
                    <li><a href="registrarse.jsp" >Registrarse</a></li>
                </ul>
              </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>  
        
        <!--ul>           
            <li class="barra-opciones">
                <a href="index.jsp" class="activo">Inicio</a>
                <a href="">Eventos</a>
                <a href="index.jsp">Objetivos</a>
                <a href="index.jsp">Beneficios</a>
                <a href="index.jsp">Directorio</a>
                <a href="index.jsp">Contrato colectivo</a>
                <a href="index.jsp">Contactanos</a>
                
            </li>
            <li class="inicio-sesion">
                <a href="login.jsp" class="login">Iniciar sesión</a>
                <a href="registro.jsp" class="registro">Registrarse</a>
            </li>
        </ul>
        
        <!------------------------SECCION NOTICA------------------------------->
        
        
        
        
        
        
        <br style="margin-top: 60px;">
        
        <div class="seccion-noticia">
            <h3>Noticias</h3>
            <div class="panel panel-primary">
                <div class="panel-heading">
                  <h2 class="panel-title">Noticias más recientes</h2>
                </div>
                <div class="panel-body">
                    <!--NOTICIA PRINCIPAL-->
                    <div class="noticia-relevante">
                        <div class="panel panel-default">                       
                            <div class="panel-body">
                                <div class="row">
                                    <div class="page-header">
                                        <h1>Titulo de noticia principal &nbsp; <small>28/07/2016</small></h1>
                                    </div>
                                    <div class="col-xs-6 col-md-7">
                                        <a href="detalle-noticia.jsp" class="thumbnail">
                                          <img src="img/biblioteca.JPG" alt="">
                                        </a>
                                    </div>
                                    <div class="col-xs-5">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                                            Quisque sit amet purus ut lacus imperdiet tincidunt. 
                                            Maecenas scelerisque eu leo a congue. Morbi urna dui, 
                                            rhoncus eu pulvinar quis, posuere bibendum magna. Donec 
                                            vel fringilla elit, consectetur congue elit. Quisque 
                                            accumsan libero quis neque accumsan congue. Phasellus 
                                            fermentum tempus nunc. Fusce vehicula est et enim efficitur 
                                            eleifend. Etiam tortor orci, posuere suscipit elit vitae, 
                                            commodo fringilla diam. Praesent semper eleifend ullamcorper. 
                                            Sed hendrerit varius mauris vel condimentum. Etiam sit amet 
                                            luctus ligula. Duis fringilla mi turpis, eu tristique elit 
                                            vulputate eu. Maecenas purus turpis, volutpat eget dui sit amet, 
                                            fermentum semper ante.                                        
                                        </p>
                                        <a href="detalle-noticia.jsp" class="btn btn-primary btn-lg">Leer más...</a>
                                    </div>                                    
                                </div>                            
                            </div>                                                        
                        </div>                        
                    </div>
                    <!-- FIN DE NOTICIA PRINCIPAL-->
                    <div class="noticia">
                        <div class="panel panel-default">                       
                            <div class="panel-body">
                                <div class="row">
                                    <div class="page-header">
                                        <h3>Titulo de noticia pasada &nbsp; <small>28/07/2016</small></h3>
                                    </div>
                                    <div class="col-xs-4 col-md-5">
                                        <a href="detalle-noticia.jsp" class="thumbnail">
                                          <img src="img/biblioteca.JPG" alt="">
                                        </a>
                                    </div>
                                    <div class="col-xs-7">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                                            Quisque sit amet purus ut lacus imperdiet tincidunt. 
                                            Maecenas scelerisque eu leo a congue. Morbi urna dui, 
                                            rhoncus eu pulvinar quis, posuere bibendum magna. Donec 
                                            vel fringilla elit, consectetur congue elit. Quisque 
                                            accumsan libero quis neque accumsan congue. Phasellus 
                                            fermentum tempus nunc. Fusce vehicula est et enim efficitur 
                                            eleifend. Etiam tortor orci, posuere suscipit elit vitae, 
                                            commodo fringilla diam. Praesent semper eleifend ullamcorper. 
                                            Sed hendrerit varius mauris vel condimentum. Etiam sit amet 
                                            luctus ligula. Duis fringilla mi turpis, eu tristique elit 
                                            vulputate eu. Maecenas purus turpis, volutpat eget dui sit amet, 
                                            fermentum semper ante.                                        
                                        </p>
                                        <a href="detalle-noticia.jsp" class="btn btn-primary">Leer más...</a>
                                    </div>                                    
                                </div>                            
                            </div>                                                        
                        </div> 
                    </div>
                    <div class="noticia">
                        <div class="panel panel-default">                       
                            <div class="panel-body">
                                <div class="row">
                                    <div class="page-header">
                                        <h3>Titulo de noticia pasada &nbsp;<small>28/07/2016</small></h3>
                                    </div>
                                    <div class="col-xs-4 col-md-5">
                                        <a href="detalle-noticia.jsp" class="thumbnail">
                                          <img src="img/biblioteca.JPG" alt="">
                                        </a>
                                    </div>
                                    <div class="col-xs-7">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                                            Quisque sit amet purus ut lacus imperdiet tincidunt. 
                                            Maecenas scelerisque eu leo a congue. Morbi urna dui, 
                                            rhoncus eu pulvinar quis, posuere bibendum magna. Donec 
                                            vel fringilla elit, consectetur congue elit. Quisque 
                                            accumsan libero quis neque accumsan congue. Phasellus 
                                            fermentum tempus nunc. Fusce vehicula est et enim efficitur 
                                            eleifend. Etiam tortor orci, posuere suscipit elit vitae, 
                                            commodo fringilla diam. Praesent semper eleifend ullamcorper. 
                                            Sed hendrerit varius mauris vel condimentum. Etiam sit amet 
                                            luctus ligula. Duis fringilla mi turpis, eu tristique elit 
                                            vulputate eu. Maecenas purus turpis, volutpat eget dui sit amet, 
                                            fermentum semper ante.                                        
                                        </p>
                                        <a href="detalle-noticia.jsp" class="btn btn-primary">Leer más...</a>
                                    </div>                                    
                                </div>                            
                            </div>                                                        
                        </div> 
                    </div>
                </div>
            </div>
            <nav aria-label="...">
                <ul class="pager">
                    <li class="previous disabled"><a href="#"><i class="fa fa-angle-left"></i> &nbsp; Anterior</a></li>
                    <li class="next"><a href="#">Siguiente &nbsp; <i class="fa fa-angle-right"></i></a></li>
                </ul>
              </nav>
        </div>
        
        <div class="footer container">
            <div class="row">
                <div class="col-xs-5">
                    <i class="fa fa-map-marker">&nbsp Dirección</i> 
                </div>
            </div>
        </div>
        
        <!-- BOOTSTRAP SCRIPTS -->
        <script src="js/bootstrap.js"></script>
        <!-- METISMENU SCRIPTS -->
        <script src="js/jquery.metisMenu.js"></script>
    </body>
</html>
