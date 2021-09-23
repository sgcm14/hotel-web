
package Servlets;

import Logica.Controladora;
import Logica.Reserva;
import Logica.TipoHabitacion;
import Logica.Usuario;
import Persistencia.ControladoraPersistencia;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvLogin", urlPatterns = {"/SvLogin"})
public class SvLogin extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }
    
    public static void cargaInicial(){
        try {
            ControladoraPersistencia cp = new ControladoraPersistencia();
            int tipo= cp.getTipoHabitacionCount();
            int usuario = cp.getUsuarioCount();
            
            
            if(usuario==0 && tipo==0){
            System.out.println("----LLENANDO TABLAS----");
            
            System.out.println("----Usuario Admin----");
            Usuario usu = new Usuario();
            usu.setDni("30495867");
            usu.setNombres("Armando");
            usu.setApellidos("Paredes Cuadros");
            usu.setCargo("Administrador");
            usu.setDireccion("Los Jazmines - Lima");
            DateFormat f = new SimpleDateFormat("yyyy-MM-dd");
            usu.setFechaNac(f.parse("1989-10-05"));
            usu.setUsuario("admin@gmail.com");
            usu.setClave("admin");            
            cp.altaUsuario(usu);
            System.out.println(usu.toString());
                        
            System.out.println("----Tipo Habitacion----");
            TipoHabitacion tipo1= new TipoHabitacion();
            tipo1.setNombreTipo("single");
            tipo1.setLimitePersonas(1);
            
            TipoHabitacion tipo2= new TipoHabitacion();
            tipo2.setNombreTipo("doble");
            tipo2.setLimitePersonas(2);
            
            TipoHabitacion tipo3= new TipoHabitacion();
            tipo3.setNombreTipo("triple");
            tipo3.setLimitePersonas(3);
            
            TipoHabitacion tipo4= new TipoHabitacion();
            tipo4.setNombreTipo("multiple");
            tipo4.setLimitePersonas(5);
            cp.altaTipoHabitacion(tipo1);
            System.out.println(tipo1.toString());
            cp.altaTipoHabitacion(tipo2);
            System.out.println(tipo2.toString());
            cp.altaTipoHabitacion(tipo3);
            System.out.println(tipo3.toString());
            cp.altaTipoHabitacion(tipo4);
            System.out.println(tipo4.toString());
            }
            
        } catch (ParseException ex) {
            System.out.println(ex.getStackTrace());
        }
        
                    
        
    }
    
    public static boolean checkLogeado(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	HttpSession sesion = request.getSession();
        return sesion.getAttribute("usuario") == null;
    	 
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        response.sendRedirect("login.jsp");
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String usuario = request.getParameter("email");
        String contra = request.getParameter("clave");
        
        
        Controladora control = new Controladora();
        Usuario usuarioBD = control.verificarUsuario(usuario,contra);
        
        if (usuarioBD != null){
            HttpSession misesion = request.getSession(true);
            misesion.setAttribute("usuario", usuarioBD);
            //misesion.setAttribute("contra", contra);
            
            List<Reserva> listaReservas = control.obtenerReservas();
            misesion.setAttribute("listaReservas", listaReservas);
            response.sendRedirect("listaReservas.jsp");
        }
        else{
            //request.setAttribute("mensaje", "Email y/o clave incorrecto");
            response.sendRedirect("login.jsp");
            // RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            // dispatcher.forward(request, response);
        }
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
