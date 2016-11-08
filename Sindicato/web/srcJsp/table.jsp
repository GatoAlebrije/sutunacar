

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
   
    /*Class.forName("com.mysql.jdbc.Driver");
    String dbName = application.getInitParameter("dbName");
    String dbUser = application.getInitParameter("dbUser");
    String dbPass = application.getInitParameter("dbPass");
    conn = DriverManager.getConnection(dbName, dbUser, dbPass); */
    s = conn.createStatement();
    sql = "select empleadoID, nombre, apeMaterno, apePaterno, estatusID, puestoID, areaID, email, telefono, tel_casa from empleado";
    rs = s.executeQuery(sql);  
%>


<br>
<!-- Tabla usuario -->
<table id="tabla" class="table table-striped">
    <thead>
        <tr>
            
            
            <th>#</th>
            <th>Nombre</th>
            <th>Estatus</th>
            <th>Puesto</th>
            <th>Area</th>
            <th>Email</th>
            <th>Teléfono</th> 
            
        </tr>
    </thead>
    <tbody>
        <%
                while (rs.next()) {
        %>
        <tr>
            <td><a href="ServletUsuario?num=<%=rs.getString(1)%>"> <%=rs.getString(1)%></a></td>
            <td><%=rs.getString(2)%>&nbsp;<%=rs.getString(3)%>&nbsp;<%=rs.getString(4)%></td>
            <!--Imprimir estatus-->
            <%
                sql = "select estatus from estatus where estatusID = " + rs.getString(5);
                Statement s0 = conn.createStatement();
                ResultSet rs0 = s0.executeQuery(sql);
                if (rs0.next()) {
            %>
                <td><%=rs0.getString(1)%></td>
            <%
                }
                s0.close();
                
            %>
            
            <!--Imprimir puesto-->
            <%
                sql = "select puesto from puesto where puestoID = " + rs.getString(6);
                Statement s2 = conn.createStatement();
                ResultSet rs2 = s2.executeQuery(sql);
                if (rs2.next()) {
            %>
                <td><%=rs2.getString(1)%></td>
            <%
                }
                s2.close();
                
            %>
            <!--Imprimir area-->
            <%
                sql = "select nombre from area where areaID = " + rs.getString(7);
                Statement s3 = conn.createStatement();
                ResultSet rs3 = s3.executeQuery(sql);
                if (rs3.next()) {
            %>
                <td><%=rs3.getString(1)%></td>
            <%
                }
                s3.close();
            %>
            <!--email-->
            <td><%=rs.getString(8)%></td>
            <!--telefono-->
            <%
                if(rs.getString(9) != null) {
            %>
            <td><%=rs.getString(9)%></td>
            <%
                } else {
            %>
            <td><%=rs.getString(10)%></td>
            <%
                }
            %>
        </tr>
        <%
                }         
        %>      
        
    </tbody>                         
</table>
<%
              s.close();
              conn.close();
%>