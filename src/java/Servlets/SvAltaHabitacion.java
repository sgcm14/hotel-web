
package Servlets;

import Logica.Controladora;
import Logica.TipoHabitacion;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "SvAltaHabitacion", urlPatterns = {"/SvAltaHabitacion"})
public class SvAltaHabitacion extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            Controladora control = new Controladora();
            List<TipoHabitacion> listaTipoHabitacion = control.obtenerTipoHabitacion();
            HttpSession misession = request.getSession();
            misession.setAttribute("listaTipoHabitacion", listaTipoHabitacion);
            response.sendRedirect("registrarHabitacion.jsp");
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            
            // traigo los datos del jsp
            String tematica = request.getParameter("tematica");
            String tipoHab = request.getParameter("tipos");
            String piso = request.getParameter("piso");
            String precio = request.getParameter("precio");
            
            //conecto la logica
            Controladora control = new Controladora();
            control.altaHabitacion(tematica, tipoHab, piso, precio);
            
            //armo la respuesta
            request.getSession().setAttribute("listaHabitaciones", control.obtenerHabitaciones());
            response.sendRedirect("listaHabitaciones.jsp");
        
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
