package Servelets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import com.mysql.jdbc.Driver;

/**
 *
 * @author bdtej07524
 */
@WebServlet(name = "Personas", urlPatterns = {"/Personas"})
public class Personas extends HttpServlet {

    Connection conn = null;
    Statement st = null;
    ResultSet rs = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {

            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp?user=root&password=");
                st = conn.createStatement();
                rs = st.executeQuery("SELECT * FROM test");
                while (rs.next()) {
                    out.print("<tr>"
                            + "<th scope = \"row\">" + rs.getString(1) + "</th>"
                            + "<td>" + rs.getString(2) + "</td>"
                            + "<td>" + rs.getString(3) + "</td>"
                            + "<td>"
                            + " <a class=\"btn btn-sm btn-danger\" href = \"borrar.jsp?id=" + rs.getString(1) + "\" title = \"Borrar\">"
                            + "<i class=\"fa-solid fa-trash\"></i>"
                            + " </a>"
                            + " <a class=\"btn btn-sm btn-danger\" href=\"borrar.jsp?id=" + rs.getString(1) + "\" title=\"Borrar\">"
                            + "<i class=\"fa-solid fa-trash\"></i>"
                            + " </a>"
                            + "</td>"
                            + "</tr>"
                    );
                }
            } catch (Exception e) {
                out.print("Error: " + e);
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
