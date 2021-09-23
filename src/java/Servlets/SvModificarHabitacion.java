
package Servlets;

import Logica.Controladora;
import Logica.Habitacion;
import Logica.TipoHabitacion;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "SvModificarHabitacion", urlPatterns = {"/SvModificarHabitacion"})
public class SvModificarHabitacion extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
            int id = Integer.parseInt(request.getParameter("id"));
            String tematica = request.getParameter("tematica");
            String tipoHab = request.getParameter("tipos");
            String piso = request.getParameter("piso");
            String precio = request.getParameter("precio");
            
            Controladora control = new Controladora();
            Habitacion hab = control.buscarHabitacion(id);
            hab.setNombreTematica(tematica);            
                TipoHabitacion tipHab = new TipoHabitacion();
                tipHab.setIdTipo(Integer.parseInt(tipoHab));
            hab.setTipo(tipHab);
            hab.setPisoUbicacion(piso);
            hab.setPrecioNoche(Double.parseDouble(precio));
            
            control.modificarHabitacion(hab);
            request.getSession().setAttribute("listaHabitaciones", control.obtenerHabitaciones());
            response.sendRedirect("listaHabitaciones.jsp");        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        int id = Integer.parseInt(request.getParameter("id"));
        Controladora control = new Controladora();
        Habitacion hab = control.buscarHabitacion(id);
        List<TipoHabitacion> listaTipoHabitacion = control.obtenerTipoHabitacion();
        
        HttpSession misession = request.getSession();
        misession.setAttribute("dataHabitacion", hab);
        misession.setAttribute("listaTipoHabitacion", listaTipoHabitacion);
        response.sendRedirect("modificarHabitacion.jsp");
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
