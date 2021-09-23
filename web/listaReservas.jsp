<%@page import="java.util.Date"%>
<%@page import="Logica.Usuario"%>
<%@page import="Logica.Huesped"%>
<%@page import="Logica.Habitacion"%>
<%@page import="Logica.Reserva"%>
<%@page import="java.util.List"%>
<%@page import="Servlets.SvLogin"%>
 <jsp:include page="menu.jsp" /> <!--Incluye el menu-->
        
    <% 
        /*HttpSession misession = request.getSession();
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
            <div class="row">
                <div class="col-8"><h1>Lista Reservas</h1>
                </div>
                <div class="col-4" align="right">
                <a href="SvAltaReserva" class="btn btn-primary   btn-sm">Nueva Reserva</a><br><br>
                </div>
            </div>
                <!-- <div class="alert alert-success">  </div>-->
            <div class="table-responsive">  
                <table id="example" class="table table-striped table-bordered" style="width:100%">
                    <thead class="thead-light">
                        <tr align="center">
                            <th scope="col">#</th>
                            <th scope="col">Huesped</th>
                            <th scope="col">Checkin</th>
                            <th scope="col">Checkout</th>
                            <th scope="col"># días</th>
                            <th scope="col">Habitacion</th>
                            <th scope="col"># Personas</th>
                            <th scope="col">Monto Total</th>
                            <th scope="col">Registro</th>
                            <th scope="col">Usuario</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <% int x = 1;
                            // Controladora control = new Controladora();
                            HttpSession misession = request.getSession();
                            List <Reserva> listaReservas = (List) misession.getAttribute("listaReservas");
                            for (Reserva res : listaReservas){
                        %>
                        
                        <tr align="center">
                            
                            <% Huesped nombHue = res.getHuesped();
                               java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
                               Date fecCheckIn = res.getFechaCheckin();
                               //java.text.DateFormat df2 = new java.text.SimpleDateFormat("dd/MM/yyyy");
                               Date fecCheckOut = res.getFechaCheckout();
                               int cantDias = res.getCantidadDias();
                               Habitacion nombHab = res.getHabitacion();                               
                               int cantPers = res.getCantidadPersonas();
                               double monto = res.getMontoTotal();
                               //java.text.DateFormat df3 = new java.text.SimpleDateFormat("dd/MM/yyyy");
                               Date fecRegistro = res.getFechaRegistro();
                               Usuario nombUsu = res.getUsuario();
                               int id = res.getIdReserva();
                            %>
                            
                            <th scope="row"><%= x %></th>
                                <td><%= nombHue.getNombres() + " " + nombHue.getApellidos() %></td>
                                <td><%= (fecCheckIn != null) ? df.format(fecCheckIn) : "" %></td>
                                <td><%= (fecCheckOut != null) ? df.format(fecCheckOut) : "" %></td>
                                <td><%= cantDias%></td>
                                <td><%= nombHab.getNombreTematica() %></td>                                
                                <td><%= cantPers %></td>
                                <td><%= monto %></td>
                                <td><%= (fecRegistro != null) ? df.format(fecRegistro) : "" %></td>
                                <td><%= nombUsu.getDni() %></td>
                                <td>
                                   <!-- <form action="SvModificarReserva" method="post" style="display:inline">
                                        <input type="hidden" name="id" value="" />
                                        <button type="submit"  class="btn btn-outline-success btn-sm" style="display:inline">Editar</button>
                                    </form>
                                <a href="modificarReserva.jsp" class="btn btn-outline-primary">Editar</a>
                                <a href="#" class="btn btn-outline-primary">Eliminar</a>-->
                                    <form action="SvEliminarReserva" method="post" style="display:inline">
                                        <input type="hidden" name="id" value="<%= id%>" />
                                        <button type="submit"  class="btn btn-outline-danger btn-sm" style="display:inline">Eliminar</button>
                                    </form>
                                </td>
                        </tr>
                        <% x++; 
                            }
                        %>
                    </tbody>
                </table>
            </div>
        
        </div>

         
        
        
    <% } %>
        
        
    </body>
</html>
