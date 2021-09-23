package Logica;

import Persistencia.ControladoraPersistencia;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Controladora {
    ControladoraPersistencia controlPersist = new ControladoraPersistencia();
    
    /* ---------------------------------LOGIN ---------------------------------*/
    public Usuario verificarUsuario(String usuario, String contra) {
        List <Usuario> listaUsuarios = controlPersist.obtenerUsuarios();
        
        if(listaUsuarios != null){
            for(Usuario usu : listaUsuarios){
                if(usu.getUsuario().equals(usuario) && usu.getClave().equals(contra)){
                    return usu;
                }
            }
        }
        return null;
    }
    
    /*-----------------------------------------Usuarios--------------------------------------------*/
    public void altaUsuario(String dni, String nombres, String apellidos, String fechaNac, 
            String direccion, String cargo, String usuario, String clave) throws ParseException{
        
        Usuario usu = new Usuario();
        usu.setDni(dni);
        usu.setNombres(nombres);
        usu.setApellidos(apellidos);
        if(!"".equals(fechaNac)) {
            DateFormat f = new SimpleDateFormat("yyyy-MM-dd");
            usu.setFechaNac(f.parse(fechaNac));
        }
        usu.setDireccion(direccion);
        usu.setCargo(cargo);
        usu.setUsuario(usuario);
        usu.setClave(clave);
        
        controlPersist.altaUsuario(usu);
    }
    
            /*public void altaUsuario(Usuario usu){
                controlPersist.altaUsuario(usu);
            }*/
    
    public List<Usuario> obtenerUsuarios() {
        return controlPersist.obtenerUsuarios();
    }
    
    public void borrarUsuario(int id) {
        controlPersist.borrarUsuario(id);
    }
    
    public Usuario buscarUsuario(int id) {
        return controlPersist.buscarUsuario(id);
    }
    
     public void modificarUsuario(Usuario usu) {
         controlPersist.modificarUsuario(usu);
    }
    
     
    /*------------------------------------------Huespedes----------------------------------------*/
    public void altaHuesped(String dni, String nombres, String apellidos,  String fechaNac,
            String direccion, String profesion) throws ParseException{
        Huesped hue = new Huesped();
        hue.setDni(dni);
        hue.setNombres(nombres);
        hue.setApellidos(apellidos);
        if(!"".equals(fechaNac)) {
            DateFormat f = new SimpleDateFormat("yyyy-MM-dd");
            hue.setFechaNac(f.parse(fechaNac));
        }
        hue.setDireccion(direccion);
        hue.setProfesion(profesion);
        
        controlPersist.altaHuesped(hue);
    }
    
    public List<Huesped> obtenerHuespedes() {
        return controlPersist.obtenerHuespedes();
    }

    public void borrarHuesped(int id) {
        controlPersist.borrarHuesped(id);
    }

    public Huesped buscarHuesped(int id) {
        return controlPersist.buscarHuesped(id);
    }

    public void modificarHuesped(Huesped hue) {
        controlPersist.modificarHuesped(hue);
    }

        
    
      /*--------------------------------------Tipo de Habitaciones---------------------------------*/
    public List<TipoHabitacion> obtenerTipoHabitacion() {
        return controlPersist.obtenerTipoHabitacion();
    }
    
    
    /*------------------------------------Habitaciones-------------------------------------------*/
    public List<Habitacion> obtenerHabitaciones() {
        return controlPersist.obtenerHabitaciones();
    }

    public void altaHabitacion(String tematica, String tipoHab, String piso, String precio) {
        Habitacion hab = new Habitacion();
        
        hab.setNombreTematica(tematica);
            TipoHabitacion tipHab = new TipoHabitacion();
            tipHab.setIdTipo(Integer.parseInt(tipoHab));
        hab.setTipo(tipHab);
        hab.setPisoUbicacion(piso);
        hab.setPrecioNoche(Double.parseDouble(precio));
        controlPersist.altaHabitacion(hab);
    }

    public Habitacion buscarHabitacion(int id) {
        return controlPersist.buscarHabitacion(id);
    }

    public void modificarHabitacion(Habitacion hab) {
        controlPersist.modificarHabitacion(hab);
    }

    public void borrarHabitacion(int id) {
        controlPersist.borrarHabitacion(id);
    }

    

    
     /*-------------------------------------Reservas--------------------------------------*/
    public List<Reserva> obtenerReservas() {
        return controlPersist.obtenerReservas();
    }

    public void altaReserva(String idHuesped, String idHabitacion, String nPersonas, String fCheckin, String fCheckout, String nDias, String monto, int idEmpleado) throws ParseException {
        DateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        Reserva res = new Reserva();
        Huesped hue = new Huesped();
        Habitacion hab = new Habitacion();
        
        hue.setIdHuesped(Integer.parseInt(idHuesped));
        res.setHuesped(hue);
        hab.setIdHabitacion(Integer.parseInt(idHabitacion));
        res.setHabitacion(hab);
        res.setCantidadPersonas(Integer.parseInt(nPersonas));
        if(!"".equals(fCheckin)) {
            
            res.setFechaCheckin(f.parse(fCheckin));
        }
        if(!"".equals(fCheckout)) {
            res.setFechaCheckout(f.parse(fCheckout));
        }
        res.setCantidadDias(Integer.parseInt(nDias));
        res.setMontoTotal(Double.parseDouble(monto));
        res.setFechaRegistro(new Date());
        res.setUsuario(new Usuario(idEmpleado));
        
           
        controlPersist.altaReserva(res);
        
    }

    public void borrarReserva(int id) {
        controlPersist.borrarReserva(id);
    }



    

    


}
