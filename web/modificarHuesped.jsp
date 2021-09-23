<%@page import="Logica.Huesped"%>
<%@page import="java.util.Date"%>
<%@page import="Servlets.SvLogin"%>
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
        <form action="SvModificarHuesped" method="get" class="form-signin">
 
  <%
        HttpSession misession = request.getSession();
        Huesped hue = (Huesped) misession.getAttribute("dataHuesped");
  %>          
            
  <%
  java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
  String fecNac = (hue.getFechaNac() != null) ? df.format(hue.getFechaNac()) : "";
  String hoy = df.format(new Date());
  %>          

          <h1>Modificar Huésped</h1><br>
          
          <div class="form-group">
            <label>DNI</label>
            <input type="text" class="form-control" name="dni" value="<%=hue.getDni() %>" required autofocus>
          </div>
          <div class="form-group">
            <label>Nombres</label>
            <input type="text" class="form-control" name="nombres" value="<%=hue.getNombres() %>" required>
          </div>
          <div class="form-group">
            <label>Apellidos</label>
            <input type="text" class="form-control" name="apellidos" value="<%=hue.getApellidos() %>" required>
          </div>
          <div class="form-group">
            <label>Fecha de Nacimiento</label>
            <input type="date" class="form-control" max="<%= hoy %>"  name="fechaNac" value="<%=fecNac %>" required>
          </div>
          <div class="form-group">
            <label>Dirección</label>
            <input type="text" class="form-control" name="direccion" value="<%=hue.getDireccion() %>" required>
          </div>
          <div class="form-group">
            <label>Profesión</label>
            <input type="text" class="form-control" name="profesion" value="<%=hue.getProfesion() %>" required>
          </div>
          
          <input type="hidden" name="id" value="<%=hue.getIdHuesped() %>" />
          
          <button type="submit" class="btn btn-primary">Grabar</button>
          <a href="listaHuespedes.jsp" class="btn btn-secondary">Cancelar</a>
        
        </form>
      </div>
    
  <% } %>    
    
  </body>
</html>

