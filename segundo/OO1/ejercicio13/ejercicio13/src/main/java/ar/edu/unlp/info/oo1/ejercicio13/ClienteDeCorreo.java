package ar.edu.unlp.info.oo1.ejercicio13;

import java.util.ArrayList;
import java.util.List;

public class ClienteDeCorreo {
	private Carpeta inbox = new Carpeta();
	private List<Carpeta> carpetas = new ArrayList<Carpeta>();
	
	public void recibir(Email email) {
		this.inbox.agregarEmail(email);
	}
	
	public void mover(Email email, Carpeta origen, Carpeta destino) {
		origen.eliminarEmail(email);
		destino.agregarEmail(email);
	}
	
	public Email buscar(String texto) {
		return this.carpetas.stream()
		.map((Carpeta c) -> c.buscarEmailCon(texto))
		.filter((Email e) -> e != null)
		.findFirst()
		.orElse(null);
		//collect(Collectors.toList()).findFirst().get();
	}
	
	public int espacioOcupado() {
		return this.inbox.getTamanio() +
				   this.carpetas.stream()
			       .mapToInt((Carpeta c) -> c.getTamanio())
			       .sum();
	}
}
