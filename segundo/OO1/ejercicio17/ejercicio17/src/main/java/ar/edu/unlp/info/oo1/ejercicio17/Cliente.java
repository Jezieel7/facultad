package ar.edu.unlp.info.oo1.ejercicio17;

public abstract class Cliente {
	protected String nombre;
	protected String direccion;
	protected Numero numero;
	protected Factura factura;
	
	public Cliente(String nombre, String direccion, Numero numero) {
		this.nombre = nombre;
		this.direccion = direccion;
		this.numero = numero;
	}
	
	public Factura facturar(DateLapse periodo) {
        double monto = this.numero.costoTotal(periodo);
        return new Factura(periodo, monto);
	}
}
