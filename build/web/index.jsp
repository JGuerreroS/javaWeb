<%-- 
    Document   : index
    Created on : 03-jun-2022, 9:43:09
    Author     : bdtej07524
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("login") == null || sesion.getAttribute("login").equals("0")) {
        response.sendRedirect("login.jsp");
    }
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

            <a href="crear.jsp" class="btn btn-sm btn-secondary">
                Registrar persona <i class="fa-solid fa-user-plus"></i>
            </a>

            <form class="row g-3 mt-2" action="index.jsp" method="post">
                <div class="col-auto">
                    <label class="visually-hidden">Buscar personas</label>
                    <input type="text" class="form-control" placeholder="Buscar" name="buscar">
                </div>
                <div class="col-auto">
                    <button type="submit" class="btn btn-primary mb-3">Buscar</button>
                </div>
            </form>

            <table class="table mt-3">
                <thead>
                    <tr>
                        <th scope="col"> Nº </th>
                        <th scope="col"> Cédula </th>
                        <th scope="col"> Nombres </th>
                        <th scope="col"> Acciones </th>
                    </tr>
                </thead>
                <tbody class="table-group-divider">
                    <jsp:include page="Personas"/>
                </tbody>
            </table>
        </div>
    </body>
</html>
