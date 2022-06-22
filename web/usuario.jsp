<%-- 
    Document   : usuario
    Created on : 17-jun-2022, 16:26:32
    Author     : bdtej07524
--%>

<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("login") == null || sesion.getAttribute("login").equals("0")) {
        response.sendRedirect("login.jsp");
    }
    Connection conn = null;
    Statement st = null;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuario</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/978a86c169.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container mt-5">
            <nav class="navbar navbar-expand-lg bg-dark">
                <div class="container-fluid">
                    <a class="navbar-brand text-white" href="#">JavaWeb</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active text-white" aria-current="page" href="index.jsp">Inicio</a>
                            </li>
                            
                            <li class="nav-item">
                                <a class="nav-link active text-white" aria-current="page" href="crear.jsp">Registro</a>
                            </li>
                            
                            <li class="nav-item">
                                <a class="nav-link text-secondary" href="usuario.jsp">
                                    <i class="fa-regular fa-user"></i> <%=sesion.getAttribute("user")%>
                                </a>
                            </li>
                            
                        </ul>
                        <form class="d-flex" action="logout.jsp">
                            <button class="btn btn-outline-danger text-white" type="submit">Cerrar sesión</button>
                        </form>
                    </div>
                </div>
            </nav>

            <br>
            
            <form method="post" action="usuario.jsp">
                <div class="mb-3">
                    <label class="form-label">Usuario</label>
                    <input type="text" name="user" class="form-control" placeholder="Usuario" value="<%=sesion.getAttribute("user")%>">
                </div>
                <div class="mb-3">
                    <label class="form-label">Nombres</label>
                    <input type="text" name="nombres" class="form-control" placeholder="Nombres" value="<%=sesion.getAttribute("nombre")%>">
                </div>
                <div class="mb-3">
                    <label class="form-label">Contraseña</label>
                    <input type="password" name="pass1" class="form-control" placeholder="Contraseña">
                </div>
                <div class="mb-3">
                    <label class="form-label">Repetir Contraseña</label>
                    <input type="password" name="pass2" class="form-control" placeholder="Repetir la contraseña">
                </div>
                <button type="submit" name="guardar" class="btn btn-primary">Guardar</button>
            </form>
        </div>
    </body>
    <%
        if (request.getParameter("guardar") != null) {
            String user = request.getParameter("user");
            String nombres = request.getParameter("nombres");
            String pass1 = request.getParameter("pass1");
            String pass2 = request.getParameter("pass2");
            if (pass1.equals(pass2)){
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp?user=root&password=");
                    st = conn.createStatement();
                    st.executeUpdate("UPDATE usuarios SET user = '" + user + "', pass = '" + getMD5(pass1) + "', nombre = '" + nombres + "' WHERE id = '" + sesion.getAttribute("id") + "';");
                    sesion.setAttribute("user", user);
                    sesion.setAttribute("nombre", nombres);
                    response.sendRedirect("index.jsp");
                } catch (Exception e) {
                    out.print("Error al actualizar los datos: " + e);
                }
            }else{
                out.println("Las contraseñas no coinciden");
            }
        }
    %>
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
