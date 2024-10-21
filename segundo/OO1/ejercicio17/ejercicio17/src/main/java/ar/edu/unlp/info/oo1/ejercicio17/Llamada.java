package ar.edu.unlp.info.oo1.ejercicio17;

import java.time.LocalDate;

public abstract class Llamada {
	protected LocalDate fecha;
    protected int horaInicio;
    protected int duracion;
    protected Numero emisor;
    protected Numero receptor;

    public Llamada(LocalDate fecha, int horaInicio, int duracion, Numero emisor, Numero receptor) {
        this.fecha = fecha;
        this.horaInicio = horaInicio;
        this.duracion = duracion;
        this.emisor = emisor;
        this.receptor = receptor;
    }

    public abstract double costo();

    public boolean pasoDurante(LocalDate desde, LocalDate hasta){
        return (this.fecha.isAfter(desde) || this.fecha.equals(desde)) && (this.fecha.isBefore(hasta) || this.fecha.equals(hasta));
    }

    
}
