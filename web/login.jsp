<%@page import="Servlets.SvLogin"%>
<!DOCTYPE html>
<html lang="en">
  <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
        <style>
          .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
          }

          @media (min-width: 768px) {
            .bd-placeholder-img-lg {
              font-size: 3.5rem;
            }
          }
        </style>
      <link href="bootstrap/css/signin.css" rel="stylesheet">
      <title>Login</title>
      <%
          SvLogin.cargaInicial();
      %>
  </head>
  <body class="text-center">
      
     
    
    
      <form class="form-signin" method="post" action="SvLogin">
        
          <h1 class="h3 mb-3 font-weight-normal">Iniciar Sesión</h1>
      
          <label for="inputEmail" class="sr-only"></label>
          <input type="email" id="inputEmail" name="email" class="form-control" placeholder="&#9993; Ingrese Correo" required autofocus>
          
          <label for="inputPassword" class="sr-only"></label>
          <input type="password" id="inputPassword" name="clave" class="form-control" placeholder="&#9919; Ingrese Clave" required>
          
          <!--<p class="text-danger">   </p>-->
          
      
          <!--<button class="btn btn-lg btn-primary btn-block" role="link" onclick="window.location.href ='index.html';" type="submit">Ingresar</button>-->
          <input  type="submit"  value="Ingresar" class="btn btn-lg btn-primary btn-block" ></input>
      </form>
      
    
  </body>
</html>
