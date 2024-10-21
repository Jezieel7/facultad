package ar.edu.unlp.info.oo1.ejercicio15y16;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;

import static org.junit.jupiter.api.Assertions.*;

public class OobnbTest {

    private Oobnb oobnb;
    private Usuario usuario;
    private LocalDate f1,f2;


    @BeforeEach
    void SetUp(){
        this.oobnb = new Oobnb();
        this.usuario = new Usuario("b", "2", 2);
        this.f1 = LocalDate.of(1, 2, 3);
        this.f2 = LocalDate.of(1, 3, 3);
    }

    @Test
    void testRegistrarUsuario(){
        assertNotNull(this.oobnb.registrarUsuario("a", "1", 1));
    }

    @Test
    void testRegistrarPropiedad(){
        assertNotNull(this.oobnb.registrarPropiedad("a", "d", 10d, "1", this.usuario, new Estricta()));
        assertNotNull(this.oobnb.propiedadesDisponibles(this.f1, this.f2));
    }

}
