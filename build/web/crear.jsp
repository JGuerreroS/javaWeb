<%-- 
    Document   : crear
    Created on : 03-jun-2022, 12:36:54
    Author     : bdtej07524
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/978a86c169.js" crossorigin="anonymous"></script>
    </head>
    <body>

        <div class="container mt-5">
            
            <a href="index.jsp" class="btn btn-sm btn-secondary mb-3"> 
                <i class="fa-solid fa-hand-point-left"></i> Volver
            </a>
            
            <form>
                <div class="row g-3 align-items-center">
                    <div class="col-auto">
                        <label class="col-form-label">Cédula</label>
                    </div>
                    <div class="col-auto">
                        <input type="text" class="form-control" name="cedula">
                    </div>

                    <div class="col-auto">
                        <label class="col-form-label">Nombres</label>
                    </div>
                    <div class="col-auto">
                        <input type="text" class="form-control" name="nombres">
                    </div>

                    <div class="col-auto">
                        <button class="btn btn-secondary btn-sm" type="submit" name="registrar">
                            Registrar <i class="fa-solid fa-floppy-disk"></i>
                        </button> 
                    </div>
                </div>
            </form>

            <%
                if (request.getParameter("registrar") != null) {
                    
                    String cedula = request.getParameter("cedula");
                    String nombre = request.getParameter("nombres");

                    try{
                        Connection conn = null;
                        Statement st = null;
                        
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost/jsp?user=root&password=");
                        st = conn.createStatement();
                        st.executeUpdate("INSERT INTO test (cedula, nombre) VALUES ('"+cedula+"', '"+nombre+"');");
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    }catch(Exception e){
                        out.print("Error al registrar: " + e);
                    }
                }
            %>

        </div>
            
    </body>
</html>
