<%@page import="Logica.TipoHabitacion"%>
<%@page import="Logica.Habitacion"%>
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
                <div class="col-8"><h1>Lista Habitaciones</h1>
                </div>
                <div class="col-4" align="right">
                <a href="SvAltaHabitacion" class="btn btn-primary  btn-sm">Nueva Habitación</a><br><br>
                </div>
            </div>
                <!--<div class="alert alert-success">     </div>-->
            <div class="table-responsive">  
                <table id="example" class="table table-striped table-bordered" style="width:100%">
                    <thead class="thead-light">
                        <tr align="center">
                            <th scope="col">#</th>
                            <th scope="col">Nombre Temática</th>
                            <th scope="col">Tipo de Habitación</th>
                            <th scope="col">Piso de Cuarto</th>
                            <th scope="col">Precio x Noche</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <% int x = 1;
                            // Controladora control = new Controladora();
                            HttpSession misession = request.getSession();
                            List <Habitacion> listaHabitaciones = (List)misession.getAttribute("listaHabitaciones");
                            for (Habitacion hab : listaHabitaciones){
                        %>
                        
                        <tr align="center">
                            
                            <% String nombreTem = hab.getNombreTematica();
                               TipoHabitacion tipoHab = hab.getTipo();
                               String pisoUbi = hab.getPisoUbicacion();
                               Double precioNoc = hab.getPrecioNoche();
                               int id = hab.getIdHabitacion();
                            %>
                            
                            <th scope="row"><%=x %></th>
                                <td><%=nombreTem %></td>
                                <td><%=tipoHab.getNombreTipo() %></td>
                                <td><%=pisoUbi %></td>
                                <td><%=precioNoc %></td>
                                <td>
                                    <form action="SvModificarHabitacion" method="post" style="display:inline">
                                        <input type="hidden" name="id" value="<%=id%>" />
                                        <button type="submit"  class="btn btn-outline-success btn-sm" style="display:inline">Editar</button>
                                    </form>
                                <!--<a href="modificarHabitacion.jsp" class="btn btn-outline-primary">Editar</a>
                                <a href="#" class="btn btn-outline-primary">Eliminar</a>-->
                                    <form action="SvEliminarHabitacion" method="post" style="display:inline">
                                        <input type="hidden" name="id" value="<%=id%>" />
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