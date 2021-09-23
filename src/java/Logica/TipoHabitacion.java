package Logica;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class TipoHabitacion implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idTipo;
    @Basic
    private String nombreTipo;
    private int limitePersonas;

    public TipoHabitacion() {
    }

    public int getIdTipo() {
        return idTipo;
    }

    public void setIdTipo(int idTipo) {
        this.idTipo = idTipo;
    }

    public String getNombreTipo() {
        return nombreTipo;
    }

    public void setNombreTipo(String nombreTipo) {
        this.nombreTipo = nombreTipo;
    }

    public int getLimitePersonas() {
        return limitePersonas;
    }

    public void setLimitePersonas(int limitePersonas) {
        this.limitePersonas = limitePersonas;
    }

    @Override
    public String toString() {
        return "TipoHabitacion{" + "idTipo=" + idTipo + ", nombreTipo=" + nombreTipo + ", limitePersonas=" + limitePersonas + '}';
    }

    
    
        
    
}


