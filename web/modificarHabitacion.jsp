<%@page import="Logica.TipoHabitacion"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Habitacion"%>
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
        <form action="SvModificarHabitacion" method="get" class="form-signin">
 
  <%
        HttpSession misession = request.getSession();
        Habitacion hab = (Habitacion) misession.getAttribute("dataHabitacion");
        List <TipoHabitacion> listaTipoHabitacion = (List)misession.getAttribute("listaTipoHabitacion");
  %>          
            
          <h1>Modificar Habitación</h1><br>
          
          <div class="form-group">
            <label>Nombre Temática</label>
            <input type="text" class="form-control" name="tematica" value="<%=hab.getNombreTematica() %>" required autofocus>
          </div>
          <div class="form-group">
            <label>Tipo de Habitación</label><br>
            <select type="button" class="form-control dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" name="tipos" required>
              <option class="dropdown-item" disabled>Seleccione tipo</option>
                    <% for (TipoHabitacion tipoHab : listaTipoHabitacion)
                        {
                        int idTipo = tipoHab.getIdTipo();
                        String nombreTipo = tipoHab.getNombreTipo();
                        String selected = "";

                        //if(habi.getTipo().getidTipo() == idTipo) { selected='selected'}
                        if(hab.getTipo().getIdTipo() == idTipo){
                           selected = "selected";
                        }
                    %>
              <option class="dropdown-item" value="<%=idTipo %>" <%=selected %>><%=nombreTipo %></option>
                    <% }  %>
            </select>
          </div>
           
          <div class="form-group">
            <label>Piso de Cuarto</label>
            <input type="text" class="form-control" name="piso" value="<%=hab.getPisoUbicacion() %>" required>
          </div>
          <div class="form-group">
            <label>Precio por Noche</label>
            <input type="text" class="form-control" name="precio" value="<%=hab.getPrecioNoche() %>" required>
          </div>
          
          <input type="hidden" name="id" value="<%=hab.getIdHabitacion() %>" />
          
          <button type="submit" class="btn btn-primary">Grabar</button>
          <a href="listaHabitaciones.jsp" class="btn btn-secondary">Cancelar</a>
        
        </form>
      </div>
    
  <% } %>    
    
  </body>
</html>

