package classes;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/ServletPassword")

public class ServletPassword extends HttpServlet {
    @Override
    protected void doPost (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
    try {
        HttpSession session = request.getSession(true);
        
        Conexion conexion = new Conexion();
        Connection conn = conexion.Conexion();
        String empleadoID = session.getAttribute("empleadoID").toString();
        String oldPass = request.getParameter("oldPass");
        String newPass = request.getParameter("confirmpassword");
        Password pass = new Password();
        
        String sql = "select pass from usuariorol where empleadoID = " + empleadoID;
        Statement s = conn.createStatement();
        ResultSet rs = s.executeQuery(sql);
        if(rs.next()) {
            String store = rs.getString("pass");
            boolean check = pass.check(oldPass, store);
            if(check == true) {
                newPass = pass.getSaltedHash(newPass);
            }
            else {
            s.close();
            conn.close();
            response.sendRedirect("CambiarPass.jsp?error=true");
            }
        }
        s.close();
        
        sql = "update usuariorol set pass = ? where empleadoID = " + empleadoID;
        PreparedStatement st = conn.prepareStatement(sql);
        st.setString(1, newPass);
        st.executeUpdate();
        
        st.close();
        conn.close();
        response.sendRedirect("index.jsp");
    } catch(SQLException e) {
        e.printStackTrace();
    } catch (Exception ex) {
        Logger.getLogger(ServletSession.class.getName()).log(Level.SEVERE, null, ex);
    }
    
    }

}
