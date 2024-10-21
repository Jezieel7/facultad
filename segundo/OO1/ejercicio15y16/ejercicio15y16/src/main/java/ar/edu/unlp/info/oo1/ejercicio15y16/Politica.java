package ar.edu.unlp.info.oo1.ejercicio15y16;

import java.time.LocalDate;

public interface Politica {
	double reembolso(Reserva reserva, LocalDate fecha);
}
