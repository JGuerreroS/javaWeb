<%-- 
    Document   : borrar
    Created on : 03-jun-2022, 16:23:00
    Author     : bdtej07524
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>

<%
    Connection conn = null;
    Statement st = null;
    
    String id = request.getParameter("id");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp?user=root&password=");
        st = conn.createStatement();
        st.executeUpdate("DELETE FROM test WHERE id = '" + id + "';");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    } catch (Exception e) {
        out.print("Error al eliminar el registro " + e);
    }
%>