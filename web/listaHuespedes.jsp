<%@page import="Servlets.SvLogin"%>
<%@page import="java.util.Date"%>
<%@page import="Logica.Huesped"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Controladora"%>
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
                <div class="col-8"><h1>Lista Huéspedes</h1>
                </div>
                <div class="col-4" align="right">
                <a href="registrarHuesped.jsp" class="btn btn-outline-primary  btn-sm">Nuevo Huésped</a><br><br>
                </div>
            </div>
                <!--<div class="alert alert-success">      </div>-->
            <div class="table-responsive">  
                <table id="example" class="table table-striped table-bordered" style="width:100%">
                    <thead class="thead-light">
                        <tr align="center">
                            <th scope="col">#</th>
                            <th scope="col">DNI</th>
                            <th scope="col">Nombres</th>
                            <th scope="col">Apellidos</th>
                            <th scope="col">Fecha Nac.</th>
                            <th scope="col">Dirección</th>
                            <th scope="col">Profesión</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        
                        <% int x = 1;
                            // Controladora control = new Controladora();
                            HttpSession misession = request.getSession();
                            List <Huesped> listaHuespedes = (List)misession.getAttribute("listaHuespedes");
                            for (Huesped hue : listaHuespedes){
                        %>
                        <tr align="center">
                            
                            <% String dni = hue.getDni();
                               String nombres = hue.getNombres();                    
                               String apellidos = hue.getApellidos();
                               java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
                               Date fechaNac = hue.getFechaNac();
                               String direccion = hue.getDireccion();
                               String profesion = hue.getProfesion();
                               int id = hue.getIdHuesped();
                            %>
                            <th scope="row"><%=x %></th>
                                <td><%=dni %></td>
                                <td><%=nombres %></td>
                                <td><%=apellidos %></td>
                                <td><%=(fechaNac != null) ? df.format(fechaNac) : "" %></td>
                                <td><%=direccion %></td>
                                <td><%=profesion %></td>
                                <td>
                                    <form action="SvModificarHuesped" method="post" style="display:inline">
                                        <input type="hidden" name="id" value="<%=id%>" />
                                        <button type="submit"  class="btn btn-outline-success btn-sm" style="display:inline">Editar</button>
                                    </form>
                                <!--<a href="modificarHuesped.jsp" class="btn btn-outline-primary">Editar</a>
                                <a href="#" class="btn btn-outline-primary">Eliminar</a>-->
                                    <form action="SvEliminarHuesped" method="post" style="display:inline">
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
