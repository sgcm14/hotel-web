
package Servlets;

import Logica.Controladora;
import Logica.Habitacion;
import Logica.Huesped;
import Logica.Reserva;
import Logica.TipoHabitacion;
import Logica.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "SvAltaReserva", urlPatterns = {"/SvAltaReserva"})
public class SvAltaReserva extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            Controladora control = new Controladora();
            List<Habitacion> listaHabitacion = control.obtenerHabitaciones();
            List<Huesped> listaHuesped = control.obtenerHuespedes();
            HttpSession misession = request.getSession();
            misession.setAttribute("listaHabitacion", listaHabitacion);
            misession.setAttribute("listaHuesped", listaHuesped);
            request.getSession().setAttribute("msgError", "");
            response.sendRedirect("registrarReserva.jsp");
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Controladora control = new Controladora();
            DateFormat f = new SimpleDateFormat("yyyy-MM-dd");
            // traigo los datos del jsp
            String idHuesped = request.getParameter("idHuesped");
            String idHabitacion = request.getParameter("idHabitacion");
            String nPersonas = request.getParameter("npersonas");
            String fCheckin = request.getParameter("fcheckin");
            String fCheckout = request.getParameter("fcheckout");
            String nDias = request.getParameter("ndias");
            String monto = request.getParameter("monto");
            
            //validar reservas
            List<Reserva> reservas = control.obtenerReservas();
            boolean yaExisteReserva = false;
            if(reservas != null) {
                Date newCheckin = f.parse(fCheckin);
                Date newCheckout = f.parse(fCheckout);
                int idHabit = Integer.parseInt(idHabitacion);
                for (Reserva r : reservas) {
                    
                    if(idHabit == r.getHabitacion().getIdHabitacion()) {
                    
                        if( ( (newCheckin.before(r.getFechaCheckin()) || newCheckin.equals(r.getFechaCheckin())) 
                                || (newCheckin.before(r.getFechaCheckout()) || newCheckin.equals(r.getFechaCheckout())) ) && 
                                ( (newCheckout.before(r.getFechaCheckin()) || newCheckout.equals(r.getFechaCheckin())) 
                                || (newCheckout.before(r.getFechaCheckout())) || newCheckout.equals(r.getFechaCheckout())) && 
                                ( newCheckout.after(r.getFechaCheckin()) || newCheckout.equals(r.getFechaCheckin())) ) {
                            yaExisteReserva = true;
                            break;
                        }

                        if( ( (r.getFechaCheckin().before(newCheckin) || r.getFechaCheckin().equals(newCheckin))
                                || (r.getFechaCheckin().before(newCheckout) || r.getFechaCheckin().equals(newCheckout)) ) && 
                                ( (r.getFechaCheckout().before(newCheckin) || r.getFechaCheckout().equals(newCheckin))
                                || (r.getFechaCheckout().before(newCheckout) || r.getFechaCheckout().equals(newCheckout)) ) && 
                                ( (r.getFechaCheckout().after(newCheckin) || r.getFechaCheckout().equals(newCheckin)) )
                                ) {
                            yaExisteReserva = true;
                            break;
                        }
                    
                    }
                }
            }
            
            if(!yaExisteReserva) {
                //conecto la logica
                Usuario usuarioBD = (Usuario) request.getSession().getAttribute("usuario");
                control.altaReserva(idHuesped,idHabitacion,nPersonas,fCheckin,fCheckout,nDias,monto,usuarioBD.getIdEmpleado());

                //armo la respuesta
                request.getSession().setAttribute("listaReservas", control.obtenerReservas());
                
                response.sendRedirect("listaReservas.jsp");
                
            } else {
                request.getSession().setAttribute("msgError", "Ya existe una reserva para las fechas seleccionadas");
                response.sendRedirect("registrarReserva.jsp");
            }
            
            
            
        } catch (ParseException ex) {
            System.out.println(ex.getMessage());
        }
                        
            
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
