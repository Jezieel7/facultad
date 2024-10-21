package ar.edu.unlp.info.oo1.ejercicio17;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

public class Numero {
    private int numero;
    private Set<Llamada> llamadas;

    public Numero (int num){
        this.numero=num;
        llamadas = new HashSet<>();
    }

    public Llamada registrarLlamadaLocal(LocalDate fecha, int horaInicio, int duracion, Numero receptor){
        Local l = new Local(fecha, horaInicio, duracion, this, receptor);
        llamadas.add(l);
        return l;
    }

    public Llamada registrarLlamadaInterurbana(LocalDate fecha, int horaInicio, int duracion, Numero receptor, int distancia){
        Interurbana l = new Interurbana(fecha, horaInicio, duracion, this, receptor, distancia);
        llamadas.add(l);
        return l;
    }

    public Llamada registrarLlamadaInternacional(LocalDate fecha, int horaInicio, int duracion, Numero receptor, Pais paisOrigen, Pais paisDestino){
        Internacional l = new Internacional(fecha, horaInicio, duracion, this, receptor, paisOrigen, paisDestino);
        llamadas.add(l);
        return l;
    }
    
    public double costoTotal(DateLapse periodo){
        return this.llamadas.stream()
        	   .filter(llamada -> llamada.pasoDurante(periodo.from, periodo.to))
        	   .mapToDouble(llamada -> llamada.costo())
        	   .sum();
    }
}
