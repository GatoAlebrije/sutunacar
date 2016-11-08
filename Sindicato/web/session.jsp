<%
    if (session.getAttribute("empleadoID") == null) {
        response.sendRedirect("index.jsp");
    } 
    
    if(session.getAttribute("rol") != null){
        if (!session.getAttribute("rol").equals("Admin")) {
           response.sendRedirect("index.jsp"); 
    }
    }
    
    
    
%>

