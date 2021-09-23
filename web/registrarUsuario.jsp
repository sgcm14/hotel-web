<%@page import="Servlets.SvLogin"%>
<%@page import="java.util.Date"%>
<jsp:include page="menu.jsp" /> <!--Incluye el menu-->
      
  <% 
        /* HttpSession misession = request.getSession();
        String usu  = (String) misession.getAttribute("usuario");
        if(usu == null){
            response.sendRedirect("login.jsp");
        }
        else{*/
        if(SvLogin.checkLogeado(request, response)){
            response.sendRedirect("login.jsp");
        } else{
  %>    
      
  <%
  java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
  String hoy = df.format(new Date());
  %>    
      
      <div class="container-sm mt-4">
        <form action="SvAltaUsuario" method="post" class="form-signin">
        
          <!--<input type="hidden" class="form-control" name="opcion" value="insertar">-->
          <h1>Registrar Usuario</h1><br>
          
          <div class="form-group">
            <label>DNI</label>
            <input type="text" class="form-control" name="dni" placeholder="Ingrese N° DNI" required autofocus>
          </div>
          <div class="form-group">
            <label>Nombres</label>
            <input type="text" class="form-control" name="nombres" placeholder="Ingrese nombres" required>
          </div>
          <div class="form-group">
            <label>Apellidos</label>
            <input type="text" class="form-control" name="apellidos" placeholder="Ingrese apellidos" required>
          </div>
          <div class="form-group">
            <label>Fecha de Nacimiento</label>
            <input type="date" max="<%= hoy %>" class="form-control" name="fechaNac" placeholder="Ingrese fecha de nacimiento" required>
          </div>
          <div class="form-group">
            <label>Dirección</label>
            <input type="text" class="form-control" name="direccion" placeholder="Ingrese dirección" required>
          </div>
          <div class="form-group">
            <label>Cargo</label>
            <input type="text" class="form-control" name="cargo" placeholder="Ingrese cargo" required>
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Usuario</label>
            <input type="email" class="form-control" name="usuario" placeholder="Ingrese email" id="exampleInputEmail1" aria-describedby="emailHelp" required>
          </div>
          <div class="form-group">
            <label>Clave</label>
            <input type="text" class="form-control" name="clave" placeholder="Ingrese clave" required>
          </div>

          <button type="submit" class="btn btn-primary">Grabar</button>
          <a href="listaUsuarios.jsp" class="btn btn-secondary">Cancelar</a>
        </form>
      </div>
  
  <% } %>        
          
  </body>
</html>
