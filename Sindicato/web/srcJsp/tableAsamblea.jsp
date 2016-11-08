<!-- Busqueda tabla -->
 <div class="row">
    <div class="col-lg-6">
        <div class="input-group">
            <span class="input-group-addon" id="basic-addon1">
                <i class="pull-left material-icons" style="font-size: 20px;">search</i>
            </span>
            <input type="text" id="search" class="form-control" aria-describedby="basic-addon1" placeholder="Buscar">
            <span class="input-group-btn">
                <a href=""><i id="btn-refresh" class="material-icons">refresh</i></a>                               
            </span>
        </div><!-- /input-group -->
    </div><!-- /.col-lg-6 -->                     
</div><!-- /.row -->

<%
   
    Class.forName("com.mysql.jdbc.Driver");
    String dbName = application.getInitParameter("dbName");
    String dbUser = application.getInitParameter("dbUser");
    String dbPass = application.getInitParameter("dbPass");
    Connection conn = DriverManager.getConnection(dbName, dbUser, dbPass);
    Statement stmt = conn.createStatement();
    
    ResultSet rs = stmt.executeQuery("select asambleaID, titulo, tipo, fecha, hora_entrada, hora_salida, lugar from asamblea order by asambleaID desc");  
%>


<br>
<!-- Tabla usuario -->
<table id="tabla" class="table table-striped">
        <thead>
        <tr>
            <th>#</th>
            <th>Titulo</th>
            <th>Tipo</th>
            <th>Fecha</th>
            <th>Entrada</th>
            <th>Salida</th>
            <th>Lugar</th>
        </tr>
    </thead>
    <tbody>
        <%
                while (rs.next()) {
                    %><tr><%
                    for (int i = 1; i <= 7; i++){
                        if (i == 2)
                            out.print("<td><a href=\"ServletAsamblea?text=detalles&amp;id=" + rs.getString(1)+"\">" + rs.getString(2) + "</a></td>\n");
                        else
                            out.print("<td>" + rs.getString(i) + "</td>\n");
                    }
                    %></tr><%
                }         
        %>      
        
    </tbody>                         
</table><%
              conn.close();
%>