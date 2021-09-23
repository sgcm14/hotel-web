<%@page import="Servlets.SvLogin"%>
<%@page import="Logica.Usuario"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>HOTEL</title>
        <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/navbar-static/">

        <!-- Bootstrap core CSS -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="bootstrap/css/navbar-top.css" rel="stylesheet">
        
        <!-- jQuery, Popper.js, Bootstrap JS -->
        <script src="jquery/jquery-3.3.1.min.js"></script>
        <script src="popper/popper.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        
        <link rel="stylesheet" type="text/css" href="datatables/datatables.min.css"/>
        <!--datables estilo bootstrap 4 CSS-->  
        <link rel="stylesheet"  type="text/css" href="datatables/css/dataTables.bootstrap4.min.css">
        
        <!-- datatables JS -->
        <script type="text/javascript" src="main.js"></script>  
        <script type="text/javascript" src="datatables/datatables.min.js"></script>
        
    </head>
  
    <body>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4">
        <a class="navbar-brand" href="#">HOTEL</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="SvListarReserva">Reservas<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="SvListarHabitacion">Habitaciones</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="SvListarHuesped">Huéspedes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="SvListarUsuario">Usuarios</a>
                    </li>
                </ul>
                <%
                     if(SvLogin.checkLogeado(request, response)){
                        response.sendRedirect("login.jsp");
                    } else{
                         HttpSession misession = request.getSession();
                         Usuario usuarioBD = (Usuario) misession.getAttribute("usuario");    
                     
                
                %>
                    
                <form class="form-inline mt-2 mt-md-0">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link"><%= usuarioBD.getNombres() + " " + usuarioBD.getApellidos() %></a>
                        </li>
                    </ul>
                <!-- <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search"> -->
                <a class="btn btn-outline-danger my-2 my-sm-0" href="SvLogout">Cerrar Sesión</a>
                </form>
                        <% } %>
            </div>
        </nav>
     
