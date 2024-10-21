package ar.edu.unlp.info.oo1.parcial2;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import java.time.LocalDate;
import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.*;

public class FinanciaTuIdeaTest {

    private FinanciaTuIdea financiaTuIdea;
    private Usuario usuario1, usuario2;
    private LocalDate f1, f2;


    @BeforeEach
    void SetUp(){
        this.financiaTuIdea = new FinanciaTuIdea();
        this.f1 = LocalDate.of(2022, 3, 1);
        this.f2 = LocalDate.of(2020, 3, 1);
        this.usuario1 = new Usuario("So", LocalDate.now());
        this.usuario2 = new Usuario("Lucas", LocalDate.now());
    }

    @Test
    void testListarProyectosVigentes(){
        assertEquals(new ArrayList<Proyecto>(), this.financiaTuIdea.listarProyectosVigentes());
        
    	this.financiaTuIdea.registrarUnProyecto(usuario1, "Haga su drone", "Nos proponemos generar kits para que cualquiera pueda construir su propio drone", 150000, this.f1);
    	this.financiaTuIdea.registrarUnProyecto(usuario2, "Haga su impresora 3D", "Nos proponemos generar equipos para que cualquiera pueda construir su propia impresora 3D", 10000, this.f2);
        assertNotNull(this.financiaTuIdea.listarProyectosVigentes());
    }
}