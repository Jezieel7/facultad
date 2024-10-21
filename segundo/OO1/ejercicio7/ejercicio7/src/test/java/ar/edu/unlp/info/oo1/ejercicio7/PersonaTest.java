package ar.edu.unlp.info.oo1.ejercicio7;

public class PersonaTest {
	Gerente alan = new Gerente("Alan Turing");
	double aportesDeAlan = alan.aportes();
	//Aportes(), montoBasico() Gerente.
	//2850
	
	Gerente jorge = new Gerente("Alan Turing");
	double sueldoBasicoDeAlan = alan.sueldoBasico();
	
	//sueldoBasico() EmpleadoJerarquico
	//sueldoBasico() Empleado
	//montoBasico() Gerente 57000
	//aportes() Gerente 2850
	//montoBasico() Gerente 57000+2850
	//bonoPorCategoria() EmpleadoJerarquico
	//8000
	//67850
	
}
