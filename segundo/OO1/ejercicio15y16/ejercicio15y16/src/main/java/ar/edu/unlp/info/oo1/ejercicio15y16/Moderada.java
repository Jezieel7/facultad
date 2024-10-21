package ar.edu.unlp.info.oo1.ejercicio15y16;

import java.time.LocalDate;

public class Moderada implements Politica{
    public double reembolso(Reserva reserva, LocalDate fecha){
        return reserva.diasAInicio(fecha) > 7 ? reserva.precio() : (reserva.diasAInicio(fecha) > 2 ? reserva.precio() * 0.5 : 0);
    }
}
