<%@page import="Servlets.SvLogin"%>
<%@page import="java.util.Date"%>
<%@page import="Logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Controladora"%>
<jsp:include page="menu.jsp" /> <!--Incluye el menu-->

    <% 
        
        //String usu  = (String) misession.getAttribute("usuario");
        if(SvLogin.checkLogeado(request, response)){
            response.sendRedirect("login.jsp");
        } else{
    %>
        
        <div class="container-sm mt-4">
            <div class="row">
                <div class="col-8"><h1>Lista Usuarios</h1>
                </div>
                <div class="col-4" align="right">
                <a href="registrarUsuario.jsp" class="btn btn-outline-primary  btn-sm">Nuevo Usuario</a><br><br>
                </div>
            </div>
               <!-- <div class="alert alert-success">    </div>-->
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
                            <th scope="col">Cargo</th>
                            <th scope="col">Usuario</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        
                        <% int x = 1;
                            //Controladora control = new Controladora();
                            HttpSession misession = request.getSession();
                            List<Usuario> listaUsuarios = (List)misession.getAttribute("listaUsuarios");
                            for (Usuario user : listaUsuarios){
                        %>
                        <tr align="center">
                            
                            <% String dni = user.getDni();
                               String nombres = user.getNombres();                    
                               String apellidos = user.getApellidos();
                               java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
                               Date fechaNac = user.getFechaNac();
                               String direccion = user.getDireccion();
                               String cargo = user.getCargo();
                               String usuario = user.getUsuario();
                               int id = user.getIdEmpleado();
                            %>
                            <th scope="row"><%= x %></th>
                                <td><%= dni %></td>
                                <td><%= nombres %></td>
                                <td><%= apellidos %></td>
                                <td><%= (fechaNac != null) ? df.format(fechaNac) : "" %></td>
                                <td><%= direccion %></td>
                                <td><%= cargo %></td>
                                <td><%= usuario %></td>
                                <td>
                                    <form action="SvModificarUsuario" method="post" style="display:inline">
                                        <input type="hidden" name="id" value="<%= id%>" />
                                        <button type="submit"  class="btn btn-outline-success btn-sm" style="display:inline">Editar</button>
                                    </form>
                                <!--<a href="modificarUsuario.jsp" class="btn btn-outline-primary">Editar</a>
                                <a href="#" class="btn btn-outline-primary">Eliminar</a>-->
                                    <form action="SvEliminarUsuario" method="post" style="display:inline">
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
