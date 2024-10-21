package ar.edu.unlp.info.oo1.ejercicio13;

import java.util.ArrayList;
import java.util.List;

public class Email {
	private String titulo;
	private String cuerpo;
	private List<Archivo> adjuntos = new ArrayList<Archivo>();
	
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getCuerpo() {
		return cuerpo;
	}
	public void setCuerpo(String cuerpo) {
		this.cuerpo = cuerpo;
	}
	public List<Archivo> getAdjuntos() {
		return adjuntos;
	}
	public void setAdjuntos(List<Archivo> adjuntos) {
		this.adjuntos = adjuntos;
	}
	
	public boolean coincide(String texto) {
		return (this.titulo.contains(texto) || this.cuerpo.contains(texto));
	}
	
	public int getTamanio(){
		return this.titulo.length() +
			   this.cuerpo.length() +
			   this.adjuntos.stream()
		       .mapToInt((Archivo a) -> a.getTamanio())
		       .sum();
	}
}
