package test

import juego.Juego
import juego.Jugador
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class Test_Juego {
	
	var Juego juego
	
	@Before
	def void setUp() {
		this.juego = new Juego
	}
	
	@Test 
	def void nuevoJuego() {
		Assert::assertEquals(0,juego.jugadores.size)
	}
	
	@Test 
	def void nuevoJugador() {
		Assert::assertEquals(0,juego.jugadores.size)
		juego.nuevoJugador("emi")
		Assert::assertEquals(1,juego.jugadores.size)
		Assert::assertEquals("emi",juego.jugadores.get(0).nombre)
		Assert::assertEquals(0,juego.jugadores.get(0).dinero)
		Assert::assertEquals(0,juego.jugadores.get(0).robots.size)
		Assert::assertEquals(null,juego.jugadores.get(0).peleaActiva)
	}
	
	@Test 
	def void eliminarJugador() {
		Assert::assertEquals(0,juego.jugadores.size)
		juego.nuevoJugador("emi")
		Assert::assertEquals(1,juego.jugadores.size)
		var Jugador jug = juego.jugadores.get(0)
		juego.eliminarJugador(jug)
		Assert::assertEquals(0,juego.jugadores.size)
	}
}