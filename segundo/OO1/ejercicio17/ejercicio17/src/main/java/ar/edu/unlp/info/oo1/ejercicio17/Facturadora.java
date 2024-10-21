package ar.edu.unlp.info.oo1.ejercicio17;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.Set;

public class Facturadora {
    private LinkedList<Numero> numeros;
    private Set<Cliente> clientes;

    public Facturadora(){
    	numeros= new LinkedList<>();
        clientes= new HashSet<>();
    }

    public boolean agregarNumero(int numero){
            return numeros.add(new Numero(numero));
    }
    public Cliente agregarPersonaFisica(String nombre, String direccion, int dni){
            Fisica f = new Fisica(nombre, direccion, numeros.poll(), dni);
            clientes.add(f);
            return f;
    }

    public Cliente agregarPersonaJuridica(String nombre, String direccion, int cuil, String tipo){
            Juridica j = new Juridica(nombre, direccion, numeros.poll(), cuil, tipo);
            clientes.add(j);
            return j;
    }
	
	
}
