<%-- 
    Document   : login
    Created on : 17-jun-2022, 13:25:51
    Author     : bdtej07524
--%>

<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/978a86c169.js" crossorigin="anonymous"></script>
    </head>
    <body>

        <div class="container mt-5">
            <h3>Iniciar sesión</h3>
            <form method="post" action="login.jsp">
                <div class="mb-3">
                    <label class="form-label">Usuario</label>
                    <input type="text" name="user" class="form-control">
                </div>
                <div class="mb-3">
                    <label class="form-label">Contraseña</label>
                    <input type="password" name="pass" class="form-control">
                </div>
                <button type="submit" name="login" class="btn btn-primary">Ingresar</button>
            </form>
            <%
                Connection conn = null;
                Statement st = null;
                ResultSet rs = null;

                if (request.getParameter("login") != null) {
                    String user = request.getParameter("user");
                    String pass = request.getParameter("pass");
                    HttpSession sesion = request.getSession();
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp?user=root&password=");
                        st = conn.createStatement();
                        rs = st.executeQuery("SELECT * FROM usuarios WHERE user = '" + user + "' AND pass = '" + getMD5(pass) + "';");
                        while (rs.next()) {
                            sesion.setAttribute("login", "1");
                            sesion.setAttribute("user", rs.getString("user"));
                            sesion.setAttribute("nombre", rs.getString("nombre"));
                            sesion.setAttribute("id", rs.getString("id"));
                            response.sendRedirect("index.jsp");
                        }
                        out.println("<div class=\"alert alert-danger mt-3\" role=\"alert\"> Usuario o contraseña invalidos </div>");
                    } catch (Exception e) {
                        out.print("Error: " + e);
                    }
                }
            %>
        </div>
    </body>
</html>

<%!
    public String getMD5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.reset();
            md.update(input.getBytes());
            byte[] encBytes = md.digest();
            BigInteger num = new BigInteger(1, encBytes);
            String encString = num.toString(16);
            while (encString.length() < 32) {
                encString = "0" + encString;
            }
            return encString;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
%>
