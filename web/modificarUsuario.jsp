<%@page import="Servlets.SvLogin"%>
<%@page import="java.util.Date"%>
<%@page import="Logica.Usuario"%>
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
      <div class="container-sm mt-4">
        <form action="SvModificarUsuario" method="get" class="form-signin">
        
  <%
        HttpSession misession = request.getSession();
        Usuario user = (Usuario) misession.getAttribute("dataUsuario");
  %>

  <%
  java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
  String fecNac = (user.getFechaNac() != null) ? df.format(user.getFechaNac()) : "";
  String hoy = df.format(new Date());
  %>           
          <h1>Modificar Usuario</h1><br>
          
          <div class="form-group">
            <label>DNI</label>
            <input type="text" class="form-control" name="dni" value="<%=user.getDni() %>" required autofocus>
          </div>
          <div class="form-group">
            <label>Nombres</label>
            <input type="text" class="form-control" name="nombres" value="<%=user.getNombres() %>" required>
          </div>
          <div class="form-group">
            <label>Apellidos</label>
            <input type="text" class="form-control" name="apellidos" value="<%=user.getApellidos() %>" required>
          </div>
          <div class="form-group">
            <label>Fecha de Nacimiento</label>
            <input type="date" class="form-control"  max="<%= hoy %>"  name="fechaNac" value="<%=fecNac %>" required>
          </div>
          <div class="form-group">
            <label>Dirección</label>
            <input type="text" class="form-control" name="direccion" value="<%=user.getDireccion() %>" required>
          </div>
          <div class="form-group">
            <label>Cargo</label>
            <input type="text" class="form-control" name="cargo" value="<%=user.getCargo() %>" required>
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Usuario</label>
            <input type="email" class="form-control" name="usuario" value="<%=user.getUsuario() %>" id="exampleInputEmail1" aria-describedby="emailHelp" required>
          </div>
          <div class="form-group">
            <label>Clave</label>
            <input type="text" class="form-control" name="clave" value="<%=user.getClave() %>" required>
          </div>

          <input type="hidden" name="id" value="<%=user.getIdEmpleado() %>" />
          
          <button type="submit" class="btn btn-primary">Grabar</button>
          <a href="listaUsuarios.jsp" class="btn btn-secondary">Cancelar</a>
        

        </form>
      </div>
  
  <% } %>   
  </body>
</html>
