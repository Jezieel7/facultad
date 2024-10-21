package ar.edu.unlp.info.oo1.ejercicio12;

import java.util.ArrayList;
import java.util.List;

public class ReporteDeConstruccion {
	List<Pieza> piezas = new ArrayList<Pieza>();
	
	public double volumenDeMaterial(String material) {
		return this.piezas
			   .stream()
			   .filter(p -> (p.getMaterial().equals(material)))
			   .mapToDouble(p -> p.volumen())
			   .sum();
	}
	
	public double superficieDeColor(String color) {
		return this.piezas
				   .stream()
				   .filter(p -> (p.getColor().equals(color)))
				   .mapToDouble(p -> p.superficie())
				   .sum();
	}

	public void agregarPieza(Pieza pieza) {
		this.piezas.add(pieza);
	}
	
	public List<Pieza> getPiezas() {
		return piezas;
	}

	public void setPiezas(List<Pieza> piezas) {
		this.piezas = piezas;
	}
}
