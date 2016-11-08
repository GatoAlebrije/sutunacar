        <nav id="custom-navbar" class="navbar navbar-default navbar-fixed-top " role="navigation">
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
                  <!--
                  <li class="active"><a href="index.jsp">Inicio <span class="sr-only">(current)</span></a></li>
                  -->
                  <li><a href="eventos.jsp">Eventos</a></li>
                  <%
                      
                      if (session.getAttribute("empleadoID") != null) {
                  %>
                  <li><a href="asambleas.jsp">Asambleas</a></li>
                  <%
                      }
                  %>
                  <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Nosotros <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                      <li><a href="under-construction.jsp">Objetivos</a></li>
                      <li><a href="under-construction.jsp">Beneficios</a></li>
                      <li><a href="under-construction.jsp">Directorio</a></li>
                      <li role="separator" class="divider"></li>
                      <li><a href="under-construction.jsp">Contrato colectivo</a></li>
                      <li role="separator" class="divider"></li>
                      <li><a href="under-construction.jsp">Contáctanos</a></li>
                    </ul>
                  </li>
                </ul>
                
                <%
                    
                        if ((session.getAttribute("empleadoID") == null) || (session.getAttribute("empleadoID") == "")) {
                            
                        
                %>
                
                <ul class="nav navbar-nav navbar-right">
                  <li style="margin-right: 15px;">
                      <a href="login.jsp"><i class="pull-left material-icons" style="margin-top: -2px;">person</i> &nbsp;&nbsp;Iniciar sesión</a>
                  </li>  
                </ul>
                <%
                        } else {
                %>  
               ´<ul class="nav navbar-nav navbar-right">
                  <li class="dropdown" style="margin-right: 15px;">
                      <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><%= session.getAttribute("nombre")%> <span class="caret"></span></a>
                      <ul class="dropdown-menu">
                          <%
                          if(session.getAttribute("rol").equals("Admin")) {
                          %>
                          <li><a href="admin.jsp">Administrador</a></li>
                          <%
                          }
                          %>
                          <li><a href="datos-usuario.jsp">Mis Datos</a></li>
                          <li><a href="agregarPermiso.jsp?text=permiso">Solicitar Permiso</a></li>
                          <li><a href="agregarPermiso.jsp?text=licencia">Solicitar Licencia</a></li>
                          <li><a href="logout.jsp">Cerrar Sesión</a></li>
                      </ul>
                      
                  </li>  
                </ul>
                <%
                        }
                    
                %>
                  
              </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>  