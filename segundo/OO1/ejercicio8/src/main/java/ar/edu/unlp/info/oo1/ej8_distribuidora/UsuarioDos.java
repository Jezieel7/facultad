package ar.edu.unlp.info.oo1.ej8_distribuidora;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class UsuarioDos {
	private String domicilio;
	private String nombre;
	private List<FacturaDos> facturas;
	private List<ConsumoDos> consumos;
	
	public UsuarioDos(String nombre, String domicilio) {
		this.nombre = nombre;
		this.domicilio = domicilio;
		this.facturas = new ArrayList<FacturaDos>();
		this.consumos = new ArrayList<ConsumoDos>();
	}
	
	public void agregarMedicion(ConsumoDos medicion) {
		this.consumos.add(medicion);
	}
	
	public String getNombre() {
		return this.nombre;
	}

	public String getDomicilio() {
		return this.domicilio;
	}
	
	public List<FacturaDos> getFacturas() {
		return facturas;
	}
	
	public void agregarFactura(FacturaDos factura){
		this.facturas.add(factura);
	}
	
	/**
	 * Obtiene el consumo de energía activa desde el consumo con fecha más reciente.
	 * Si no hay ningún consumo, retorna 0
	 * @return
	 */
	public double ultimoConsumoActiva() {
		return this.ultimoConsumoAsOptional()
			.map((ConsumoDos c) -> c.getConsumoDeEnergiaActiva())
			.orElse(0d);
	}

	/**
	 * Retorna el último consumo o null en caso que no exista
	 * @return
	 */
	public ConsumoDos ultimoConsumo() {
		return this.ultimoConsumoAsOptional().orElse(null);
	}	
	
	/**
	 * Retorna un Optional, dependiendo si hay o no consumos.
	 * @return
	 */
	private Optional<ConsumoDos> ultimoConsumoAsOptional() {
		//retorna un Optional ya que puede no tener consumos
		return this.consumos
			.stream()
			.max((ConsumoDos c1, ConsumoDos c2) -> c1.getFecha().compareTo(c2.getFecha()));
	}
	
	/**
	 * Si hay consumos, retorna lo correspondiente al consumo realizado.
	 * Factura 0 si no hay consumos.
	 * @param precioKW
	 * @return
	 */
	public FacturaDos facturarEnBaseA(double precioKW) {
		ConsumoDos ultimo = this.ultimoConsumo();
		if (ultimo == null) {
			return new FacturaDos(0, 0, this);
		}

		double descuento = 0d;
		if (ultimo.factorDePotencia() > 0.8d) {
			descuento = 10;
		}
		return new FacturaDos(ultimo.costoEnBaseA(precioKW), descuento, this);
	}
	
}
