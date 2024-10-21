package ar.edu.unlp.info.oo1.ejercicio5;

import java.util.Date;

public class Mamifero{
    private String identificador;
    private String especie;
    private Date fechaNacimiento;
    private Mamifero padre;
    private Mamifero madre;

    public Mamifero(String nombre) {
    	this.setIdentificador(nombre);
    };
    
    public Mamifero() {

    };
    
    public String getIdentificador(){
        return this.identificador;
    };

    public void setIdentificador(String identificador){
        this.identificador = identificador;
    };

    public String getEspecie(){
        return this.especie;
    };

    public void setEspecie(String especie){
        this.especie = especie;
    };

    public Date getFechaNacimiento(){
        return this.fechaNacimiento;
    };

    public void setFechaNacimiento(Date fechaNacimiento){
        this.fechaNacimiento = fechaNacimiento;
    };

    public Mamifero getPadre(){
        return this.padre;
    };

    public void setPadre(Mamifero padre){
        this.padre = padre;
    };
    
    public Mamifero getMadre(){
        return this.madre;
    };

    public void setMadre(Mamifero madre){
        this.madre = madre;
    };

    public Mamifero getAbueloMaterno(){
    	if(this.getMadre() != null && this.getMadre().getPadre() != null) {
        	return this.getMadre().getPadre();
        }
    	return null;
    };

    public Mamifero getAbuelaMaterna(){
    	if(this.getMadre() != null && this.getMadre().getMadre() != null) {
        	return this.getMadre().getMadre();
        }
    	return null;
    };

    public Mamifero getAbueloPaterno(){
    	if(this.getPadre() != null && this.getPadre().getPadre() != null) {
        	return this.getPadre().getPadre();
        }
    	return null;
    };

    public Mamifero getAbuelaPaterna(){
    	if(this.getPadre() != null && this.getPadre().getMadre() != null) {
        	return this.getPadre().getMadre();
        }
    	return null;
    };
    
    private boolean tieneComoAncestro(Mamifero actual, Mamifero unMamifero) {
        boolean b = false;
        
        if(actual.identificador.equals(unMamifero.getIdentificador())) {
          return true;
        }else{   
            if((actual.padre != null)){
              b = tieneComoAncestro(actual.padre, unMamifero);
            }
            if ((b == false) && (actual.madre != null)){
              b = tieneComoAncestro(actual.madre, unMamifero);
            }  
          }
          return b; 
      }

      public boolean tieneComoAncestroA(Mamifero unMamifero){
        if(this.identificador.equals(unMamifero.getIdentificador())) {
          return false;
        }else{
            return tieneComoAncestro(this, unMamifero);          
        }
      }
}