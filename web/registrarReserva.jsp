<%@page import="java.util.Date"%>
<%@page import="Logica.Usuario"%>
<%@page import="Logica.Huesped"%>
<%@page import="Logica.Habitacion"%>
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
  
  <%
  java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
  String hoy = df.format(new Date());
  %>
  
  <%    HttpSession misession = request.getSession();
        List <Habitacion> listaHabitacion = (List)misession.getAttribute("listaHabitacion");
        List <Huesped> listaHuesped = (List)misession.getAttribute("listaHuesped");
  %>
      
      <div class="container-sm mt-4">
        <form action="SvAltaReserva" method="post" class="form-signin">
        
          <!--<input type="hidden" class="form-control" name="opcion" value="insertar">-->
          <h1>Registrar Reserva</h1><br>
          
          <%
            String mensaje = (String)misession.getAttribute("msgError"); 
            if(mensaje != null && !"".equals(mensaje)) {
          %>
          
          <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Error!</strong> <%=mensaje%>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <%
              }
          %>
          
<div class="form-row">
    <div class="form-group col-md-9">
      <label >Nombre de Huésped</label>
      <select type="button" class="form-control dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" name="idHuesped" required>
          <option class="dropdown-item" value="" disabled selected>Seleccione Huesped</option>
                    <% for (Huesped hue : listaHuesped)
                        {
                        int idHuesped = hue.getIdHuesped();
                        String nombreHuesped = hue.getDni() + " - " + hue.getNombres()+" "+hue.getApellidos();
                    %>
              <option class="dropdown-item" value="<%=idHuesped %>"><%=nombreHuesped %></option>
                    <% }  %>
            </select>
    </div>
    <div class="form-group col-md-3">
        <label > &nbsp; </label>
      <a href="registrarHuesped.jsp" class="form-control btn btn-outline-primary">Nuevo Huésped</a>
    </div>
  </div>
  <div class="form-row">
    <div class="form-group col-md-8">
      <label>Nombre de Habitación</label>
     <select type="button" class="form-control dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" id="idHabitacion" 
             name="idHabitacion" required>
              <option class="dropdown-item" value="" disabled selected>Seleccione Habitacion</option>
                    <% for (Habitacion hab : listaHabitacion)
                        {
                        int idHabitacion = hab.getIdHabitacion();
                        String nombreHabitacion = hab.getNombreTematica() + " (S/. " + hab.getPrecioNoche() + ")";
                    %>
              <option class="dropdown-item" 
                      data-npmax="<%=hab.getTipo().getLimitePersonas()%>" 
                      data-precioh="<%=hab.getPrecioNoche()%>"
                      value="<%=idHabitacion %>"><%=nombreHabitacion %></option>
                    <% }  %>
            </select>
    </div>
    <div class="form-group col-md-4">
      <label>Numero de Personas</label>
      <select type="button" class="form-control dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" id="npersonas"
              name="npersonas" required>
              <option class="dropdown-item" value="" disabled selected>Seleccione # Personas</option>
                    
            </select>
    </div>
  </div>        
          
<div class="form-row">
    <div class="form-group col-md-4">
      <label>Checkin</label>
      <input type="date" min="<%= hoy %>" value="<%= hoy %>" class="form-control" id="fcheckin" name="fcheckin" required>
    </div>
    <div class="form-group col-md-4">
      <label>Checkout</label>
       <input type="date" min="<%= hoy %>" class="form-control" id="fcheckout" name="fcheckout" required>
    </div>
    <div class="form-group col-md-4">
      <label>Número de Días</label>
      <input type="number" class="form-control" id="ndias" name="ndias" readonly required>
    </div>
  </div>
          
           
          <div class="form-group">
            <label>Monto Total</label>
            <input type="text" class="form-control" id="monto" name="monto" readonly required>
          </div>
          <div class="form-group">
            <label>Fecha de Registro</label>
            <input type="date" value="<%= hoy %>" class="form-control" name="fregistro" readonly required>
          </div>  
          
          
          <button type="submit" class="btn btn-primary">Grabar</button>
          <a href="listaReservas.jsp" class="btn btn-secondary">Cancelar</a>
        </form>
      </div>
  
 <script type="text/javascript">
          
          $(function(){
             
             $('#idHabitacion').on('change',function() {
                 
                 var npmax = $(this).find(':selected').attr('data-npmax');
                 
                 $('#npersonas')
                    .empty()
                    .append('<option class="dropdown-item" value="" disabled selected>Seleccione # Personas</option>');
            
                 for(var i =1; i<=npmax; i++) {
                     $('#npersonas').append($('<option>', {
                            value: i,
                            text: i
                        }));
                 }
                 
                 var dias = $('#ndias').val();
                 if(dias > 0) {
                    let precio = $(this).find(':selected').attr('data-precioh');
                    let total = parseInt(dias) * parseFloat(precio);
                    $('#monto').val(total);
                }
                 
             });
             
             $('#fcheckin').on('change',function() {
                $('#fcheckout').val('');
                $('#ndias').val('');
                $('#monto').val('');
             });
             
             $('#fcheckin').blur(function() {
                $('#fcheckout').attr('min',$(this).val());
             });
             
             $('#fcheckout').on('change',function() {
                 if($('#idHabitacion').val() === null) {
                     alert('Seleccione una Habitacion');
                     $('#fcheckout').val('');
                     return false;
                 }
                 let firstDate = $('#fcheckin').val();
                 let secondDate = $('#fcheckout').val();
                 let dias = diasEntreFechas(firstDate,secondDate) + 1;
                
                //calculo total
                if(dias > 0) {
                    $('#ndias').val(dias);
                    let precio = $('#idHabitacion').find(':selected').attr('data-precioh');
                    let total = parseInt(dias) * parseFloat(precio);
                    $('#monto').val(total);
                } 
                
                
             });
             
             function diasEntreFechas(firstDate, secondDate) {
                 firstDate = new Date(firstDate);
                secondDate = new Date(secondDate);

                let timeDifference = Math.abs(secondDate.getTime() - firstDate.getTime());

                let millisecondsInADay = (1000 * 3600 * 24);

                let differenceOfDays = Math.ceil(timeDifference / millisecondsInADay);

                return differenceOfDays;
             }
              
          });
          
          
      </script>
      
  <%
    }
  %>        
        
  
  </body>
</html>


