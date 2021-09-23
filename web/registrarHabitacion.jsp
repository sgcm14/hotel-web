<%@page import="Logica.TipoHabitacion"%>
<%@page import="java.util.List"%>
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
  <%    HttpSession misession = request.getSession();
        List <TipoHabitacion> listaTipoHabitacion = (List)misession.getAttribute("listaTipoHabitacion");
  %>
      
      <div class="container-sm mt-4">
        <form action="SvAltaHabitacion" method="post" class="form-signin">
        
          <!--<input type="hidden" class="form-control" name="opcion" value="insertar">-->
          <h1>Registrar Habitación</h1><br>
          
          <div class="form-group">
            <label>Nombre Temática</label>
            <input type="text" class="form-control" name="tematica" placeholder="Ingrese Temática" required autofocus>
          </div>
          <div class="form-group">
            <label>Tipo de Habitación</label><br>
            <select type="button" class="form-control dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" name="tipos" required>
              <option class="dropdown-item" disabled selected>Seleccione tipo</option>
                    <% for (TipoHabitacion tipoHab : listaTipoHabitacion)
                        {
                        int idTipo = tipoHab.getIdTipo();
                        String nombreTipo = tipoHab.getNombreTipo(); 
                    %>
              <option class="dropdown-item" value="<%=idTipo %>"><%=nombreTipo %></option>
                    <% }  %>
            </select>
          </div>
           
          <div class="form-group">
            <label>Piso de Cuarto</label>
            <input type="text" class="form-control" name="piso" placeholder="Ingrese piso" required>
          </div>
          <div class="form-group">
            <label>Precio por Noche</label>
            <input type="text" class="form-control" name="precio" placeholder="Ingrese precio" required>
          </div>

          <button type="submit" class="btn btn-primary">Grabar</button>
          <a href="listaHabitaciones.jsp" class="btn btn-secondary">Cancelar</a>
        </form>
      </div>
  
  <%
    }
  %>        
          
  </body>
</html>

