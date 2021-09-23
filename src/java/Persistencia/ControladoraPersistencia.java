package Persistencia;

import Logica.Habitacion;
import Logica.Huesped;
import Logica.Reserva;
import Logica.TipoHabitacion;
import Logica.Usuario;
import Persistencia.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class ControladoraPersistencia {
    UsuarioJpaController jpaUsuario = new UsuarioJpaController();
    HabitacionJpaController jpaHabitacion = new HabitacionJpaController();
    HuespedJpaController jpaHuesped = new HuespedJpaController();
    ReservaJpaController jpaReserva = new ReservaJpaController();
    TipoHabitacionJpaController jpaTipoHab = new TipoHabitacionJpaController();
    
            /* public void altaUsuario(Usuario u){
                try {
                    jpaUsuario.create(u);
                } catch (Exception ex) {
                    Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
                } 
            } */

  
    /*------------------------------------Usuarios---------------------------------------------*/
    public void altaUsuario(Usuario usu) {
        jpaUsuario.create(usu);
    }
    
    public int getUsuarioCount() {
        return jpaUsuario.getUsuarioCount();
    }
    
    public List<Usuario> obtenerUsuarios() {
        return jpaUsuario.findUsuarioEntities();
    }

    public void borrarUsuario(int id) {
        try {
            jpaUsuario.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Usuario buscarUsuario(int id) {
        return jpaUsuario.findUsuario(id);
    }

      public void modificarUsuario(Usuario usu) {
        try {
            jpaUsuario.edit(usu);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
      
    /*-----------------------------------------Huespedes-------------------------------------------*/
    public void altaHuesped(Huesped hue) {
        jpaHuesped.create(hue);
    }

    public List<Huesped> obtenerHuespedes() {
        return jpaHuesped.findHuespedEntities();
    }

    public void borrarHuesped(int id) {
        try {
            jpaHuesped.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Huesped buscarHuesped(int id) {
        return jpaHuesped.findHuesped(id);
    }

    public void modificarHuesped(Huesped hue) {
        try {
            jpaHuesped.edit(hue);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    
    
     /*---------------------------------Tipo de Habitaciones-------------------------------------*/
    public void altaTipoHabitacion(TipoHabitacion tip){
        jpaTipoHab.create(tip);
    }
    public List<TipoHabitacion> obtenerTipoHabitacion(){
        return jpaTipoHab.findTipoHabitacionEntities();
    }
    public int getTipoHabitacionCount(){
        return jpaTipoHab.getTipoHabitacionCount();
    }
    
    
    
    
    
     /*------------------------------------Habitaciones-------------------------------------*/
    public List<Habitacion> obtenerHabitaciones() {
        return jpaHabitacion.findHabitacionEntities();
    }

    public void altaHabitacion(Habitacion hab) {
        jpaHabitacion.create(hab);
    }

    public Habitacion buscarHabitacion(int id) {
         return jpaHabitacion.findHabitacion(id);
    }

    public void modificarHabitacion(Habitacion hab) {
        try {
            jpaHabitacion.edit(hab);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void borrarHabitacion(int id) {
        try {
            jpaHabitacion.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    
    /*--------------------------------------Reservas-------------------------------------------*/
    public List<Reserva> obtenerReservas() {
        return jpaReserva.findReservaEntities();
    }

    public void altaReserva(Reserva res) {
        jpaReserva.create(res);
    }

    public void borrarReserva(int id) {
        try {
            jpaReserva.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    

  

    

    
    
}
