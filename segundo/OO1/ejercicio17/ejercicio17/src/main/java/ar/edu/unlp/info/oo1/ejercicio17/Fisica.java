package ar.edu.unlp.info.oo1.ejercicio17;

public class Fisica extends Cliente{
	private int dni;
	
	public Fisica(String nombre, String direccion, Numero numero, int dni) {
		super(nombre, direccion, numero);
		this.dni = dni;
	}
	
	public double descuento(double monto) {
		return (monto * 0.9);
	}
}
