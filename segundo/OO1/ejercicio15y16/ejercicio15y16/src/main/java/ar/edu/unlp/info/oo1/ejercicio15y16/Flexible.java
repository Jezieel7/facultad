package ar.edu.unlp.info.oo1.ejercicio15y16;

import java.time.LocalDate;

public class Flexible implements Politica {
    public double reembolso(Reserva reserva, LocalDate fecha){
        return reserva.precio();
    }
}
