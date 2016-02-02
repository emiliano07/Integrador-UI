package test

import game.Game
import game.Jugador
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class Test_Juego {
	
	var Game game
	
	@Before
	def void setUp() {
		this.game = new Game
	}
	
	@Test 
	def void nuevoJuego() {
		Assert::assertEquals(0,game.jugadores.size)
	}
	
	@Test 
	def void nuevoJugador() {
		Assert::assertEquals(0,game.jugadores.size)
		game.nuevoJugador("emi")
		Assert::assertEquals(1,game.jugadores.size)
		Assert::assertEquals("emi",game.jugadores.get(0).nombre)
		Assert::assertEquals(0,game.jugadores.get(0).dinero)
		Assert::assertEquals(0,game.jugadores.get(0).robots.size)
	}
	
	@Test 
	def void eliminarJugador() {
		Assert::assertEquals(0,game.jugadores.size)
		game.nuevoJugador("emi")
		Assert::assertEquals(1,game.jugadores.size)
		var Jugador jug = game.jugadores.get(0)
		game.eliminarJugador(jug)
		Assert::assertEquals(0,game.jugadores.size)
	}
}