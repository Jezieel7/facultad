package ar.edu.unlp.info.oo1.ej8_distribuidora;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

public class DistribuidoraDos {
	
	private double precioKW;
	private Set<UsuarioDos> usuarios;
	
	public DistribuidoraDos(double preciokw) {
		this.precioKW = preciokw;
		this.usuarios = new HashSet<>();
	}
	
	public void setPrecioKW(double precioKW) {
		this.precioKW = precioKW;
	}
	
	public double getPrecioKW() {
		return this.precioKW;
	}
	
	public void agregarUsuario(UsuarioDos usuario) {
		this.usuarios.add(usuario);
	}

	public List<UsuarioDos> getUsuarios() {
		return new ArrayList<>(this.usuarios);
	}
	
	public List<FacturaDos> facturar() {
		List<FacturaDos> result = this.usuarios
			.stream()
			.map((UsuarioDos u) -> u.facturarEnBaseA(this.getPrecioKW()))
			.collect(Collectors.toList());
		return result;
	}

	public double consumoTotalActiva() {
		return this.usuarios
			.stream()
			.mapToDouble((UsuarioDos u) -> u.ultimoConsumoActiva())
			.sum();
	}
}
