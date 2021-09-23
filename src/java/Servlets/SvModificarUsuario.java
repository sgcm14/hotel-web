package Servlets;

import Logica.Controladora;
import Logica.Usuario;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvModificarUsuario", urlPatterns = {"/SvModificarUsuario"})
public class SvModificarUsuario extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombres");
        String apellido = request.getParameter("apellidos");
        String fechaNac = request.getParameter("fechaNac");
        String direccion = request.getParameter("direccion");
        String cargo = request.getParameter("cargo");
        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");
        
            
        
        Controladora control = new Controladora();
        Usuario usu = control.buscarUsuario(id);
        usu.setDni(dni);
        usu.setNombres(nombre);
        usu.setApellidos(apellido);
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd"); 
            try {
                Date fecha = formato.parse(fechaNac);
        usu.setFechaNac(fecha);
            } catch (ParseException ex) {
                Logger.getLogger(SvModificarUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        
        usu.setDireccion(direccion);
        usu.setCargo(cargo);
        usu.setUsuario(usuario);
        usu.setClave(clave);
        
        control.modificarUsuario(usu);
        request.getSession().setAttribute("listaUsuarios", control.obtenerUsuarios());
        response.sendRedirect("listaUsuarios.jsp");
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        Controladora control = new Controladora();
        Usuario usu = control.buscarUsuario(id);
         
        HttpSession misession = request.getSession();
        misession.setAttribute("dataUsuario", usu);
        response.sendRedirect("modificarUsuario.jsp");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
