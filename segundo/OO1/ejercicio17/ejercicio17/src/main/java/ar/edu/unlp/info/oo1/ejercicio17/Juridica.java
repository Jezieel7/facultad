package ar.edu.unlp.info.oo1.ejercicio17;

public class Juridica extends Cliente {
	private int cuit;
	private String tipo;
	
	public Juridica(String nombre, String direccion, Numero numero, int cuit, String tipo) {
		super(nombre, direccion, numero);
		this.cuit = cuit;
		this.tipo = tipo;
	}
}
