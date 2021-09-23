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
        <form action="SvAltaHuesped" method="post" class="form-signin">
        
          <!--<input type="hidden" class="form-control" name="opcion" value="insertar">-->
          <h1>Registrar Huésped</h1><br>
          
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
            <label>Profesión</label>
            <input type="text" class="form-control" name="profesion" placeholder="Ingrese profesión" required>
          </div>

          <button type="submit" class="btn btn-primary">Grabar</button>
          <a href="listaHuespedes.jsp" class="btn btn-secondary">Cancelar</a>
        </form>
      </div>
  
  <% } %>
  
  </body>
</html>

