<%-- 
    Document   : index
    Created on : 03-jun-2022, 9:43:09
    Author     : bdtej07524
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection conn = null;
    Statement st = null;
    ResultSet rs = null;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Inicio </title>
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/978a86c169.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container mt-5">
            <a href="crear.jsp" class="btn btn-sm btn-secondary">
                Registrar persona <i class="fa-solid fa-user-plus"></i>
            </a>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col"> Nº </th>
                        <th scope="col"> Cédula </th>
                        <th scope="col"> Nombres </th>
                        <th scope="col"> Acciones </th>
                    </tr>
                </thead>
                <tbody class="table-group-divider">
                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp?user=root&password=");
                            st = conn.createStatement();
                            rs = st.executeQuery("SELECT * FROM test");
                            while (rs.next()) {
                    %>
                    <tr>
                        <th scope="row"> <%= rs.getString(1)%> </th>
                        <td> <%= rs.getString(2)%> </td>
                        <td> <%= rs.getString(3)%> </td>
                        <td>
                            <a class="btn btn-sm btn-secondary" href="editar.jsp?id=<%=rs.getString(1)%>&cedula=<%=rs.getString(2)%>&nombres=<%=rs.getString(3)%>">
                                <i class="fa-solid fa-pen-to-square"></i>
                            </a>

                            <a class="btn btn-sm btn-danger" href="borrar.jsp?id=<%=rs.getString(1)%>">
                                <i class="fa-solid fa-trash"></i>
                            </a>
                        </td>
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            out.print("Error: " + e);
                        }
                    %>

                </tbody>
            </table>
        </div>
    </body>
</html>
