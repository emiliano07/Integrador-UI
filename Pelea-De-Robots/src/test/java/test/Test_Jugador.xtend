package test

import game.Jugador
import game.Mejora
import game.Robot
import org.junit.Assert
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*

class Test_Jugador {
	
	var Jugador jugador
	var Robot robot
	
	@Before
	def void setUp() {
		this.jugador = new Jugador("emi")
		this.robot = new Robot("rob",100)
	}
	
	@Test 
	def void nuevoJugador() {
		Assert::assertEquals("emi",jugador.nombre)
		Assert::assertEquals(0,jugador.dinero)
		Assert::assertEquals(0,jugador.robots.size)
		Assert::assertEquals(null,jugador.peleaActiva)
	}
	
	@Test 
	def void comprarYVenderRobot(){
		jugador.dinero = 5000
		Assert::assertEquals(5000,jugador.dinero)
		Assert::assertEquals(0,jugador.robots.size)
		jugador.comprar(robot)
		Assert::assertEquals(0,jugador.dinero)
		Assert::assertEquals(1,jugador.robots.size)
		Assert::assertEquals("rob",jugador.robots.get(0).nombre)
		jugador.vender(robot)
		Assert::assertEquals(5000,jugador.dinero)
		Assert::assertEquals(0,jugador.robots.size)
	}
	
	@Test 
	def void reparacionParcial(){
		robot.deterioro = 50
		jugador.dinero = 1250
		jugador.reparacionParcial(robot,50)
		Assert::assertEquals(0,jugador.dinero)
		Assert::assertEquals(0,robot.deterioro)
	}
	
	@Test 
	def void reparacionTotal(){
		robot.deterioro = 50
		jugador.dinero = 1250
		jugador.reparacionTotal(robot)
		Assert::assertEquals(0,jugador.dinero)
		Assert::assertEquals(0,robot.deterioro)
	}
	
	@Test 
	def void iniciarPelea(){
		Assert::assertEquals(null,jugador.peleaActiva)
		jugador.iniciarPelea
		Assert::assertEquals("emi",jugador.peleaActiva.jugador.nombre)
	}
	
	@Test 
	def void seleccionarRobotPropio(){
		jugador.iniciarPelea
		jugador.seleccionarRobotPropio(robot)
		Assert::assertEquals("rob",jugador.peleaActiva.robotPropio.nombre)
	}
	
	@Test 
	def void seleccionarRobotRival(){
		jugador.iniciarPelea
		jugador.seleccionarRobotRival(robot)
		Assert::assertEquals("rob",jugador.peleaActiva.robotRival.nombre)
	}
	
	@Test 
	def void puedoApostar(){
		jugador.dinero = 1
		assertFalse(jugador.puedoApostar(75))
		jugador.dinero = 100
		assertTrue(jugador.puedoApostar(75))
		assertFalse(jugador.puedoApostar(76))
	}
	
	@Test 
	def void definirApuesta(){
		jugador.dinero = 100
		jugador.iniciarPelea
		jugador.definirApuesta(75)
		Assert::assertEquals(75,jugador.peleaActiva.apuesta)		
	}
	
	@Test 
	def void actualizarGanancia(){
		Assert::assertEquals(0,jugador.dinero)
		jugador.actualizarGanancia(100)
		Assert::assertEquals(100,jugador.dinero)
	}
	
	@Test 
	def void mejorar(){
		Assert::assertEquals(0,jugador.dinero)
		var mejora = new Mejora("mejora","mejora de prueba",25,100)
		jugador.dinero = 100
		robot.poder = 100
		Assert::assertEquals(100,jugador.dinero)
		Assert::assertEquals(100,robot.poder)
		jugador.mejorar(robot,mejora)
		Assert::assertEquals(0,jugador.dinero)
		Assert::assertEquals(125,robot.poder)
	}
	
	@Test
	def void pelear(){
		var Robot robotRival = new Robot("rival",200)
		jugador.iniciarPelea
		jugador.peleaActiva.seleccionarRobotPropio(robot)
		jugador.peleaActiva.seleccionarRobotRival(robotRival)
		jugador.dinero = 1000
		jugador.definirApuesta(100)
		jugador.pelear
		Assert::assertEquals(5,robot.deterioro)	
		
		//El siguiente AssertEquals puede o no funcionar, ya que depende de un número al azar (cero o uno).
		//En este caso evaluo cuando el número al azar es cero y el Robot del Jugador resulta ganador.
		Assert::assertEquals(1200,jugador.dinero)	
	}
}