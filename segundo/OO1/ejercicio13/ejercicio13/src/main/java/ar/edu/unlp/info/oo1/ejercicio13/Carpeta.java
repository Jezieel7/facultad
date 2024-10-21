package ar.edu.unlp.info.oo1.ejercicio13;

import java.util.ArrayList;
import java.util.List;

public class Carpeta {
	private String nombre;
	private List<Email> emails = new ArrayList<Email>();
	
	public void agregarEmail(Email email) {
		this.emails.add(email);
	}
	
	public void eliminarEmail(Email email) {
		this.emails.remove(email);
	}
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public List<Email> getEmails() {
		return emails;
	}
	public void setEmails(List<Email> emails) {
		this.emails = emails;
	}
	
	public Email buscarEmailCon(String texto) {
		return this.emails.stream()
				.filter((Email e) -> e.coincide(texto))
				.findFirst()
				.get();
	}
	
	public int getTamanio(){
		return this.nombre.length() +
			   this.emails.stream()
		       .mapToInt((Email e) -> e.getTamanio())
		       .sum();
	}
}
