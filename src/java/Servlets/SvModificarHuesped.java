package Servlets;

import Logica.Controladora;
import Logica.Huesped;
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


@WebServlet(name = "SvModificarHuesped", urlPatterns = {"/SvModificarHuesped"})
public class SvModificarHuesped extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
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
            String profesion = request.getParameter("profesion"); 
            
            Controladora control = new Controladora();
            Huesped hue = control.buscarHuesped(id);
            hue.setDni(dni);
            hue.setNombres(nombre);
            hue.setApellidos(apellido);
            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    Date fecha = formato.parse(fechaNac);
            hue.setFechaNac(fecha);
                    } catch (ParseException ex) {
                        Logger.getLogger(SvModificarHuesped.class.getName()).log(Level.SEVERE, null, ex);
                    }
            hue.setDireccion(direccion);
            hue.setProfesion(profesion);
            
            control.modificarHuesped(hue);
            request.getSession().setAttribute("listaHuespedes", control.obtenerHuespedes());
            response.sendRedirect("listaHuespedes.jsp");
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        Controladora control = new Controladora();
        Huesped hue = control.buscarHuesped(id);
         
        HttpSession misession = request.getSession();
        misession.setAttribute("dataHuesped", hue);
        response.sendRedirect("modificarHuesped.jsp");
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
