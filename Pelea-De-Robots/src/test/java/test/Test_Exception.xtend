package test

import exception.ApuestaExedidaException
import exception.NoHayDineroParaCompraException
import exception.NoHayDineroParaMejoraException
import exception.NoHayDineroParaReparacionException
import game.Jugador
import game.Mejora
import game.Pelea
import game.Robot
import org.junit.Before
import org.junit.Test

class Test_Exception {
	
	var Jugador jug
	var Robot robot
	
	@Before
	def void setUp() {
		this.jug = new Jugador("emi")
		this.robot = new Robot("rob",100,jug)
	}
	
	@Test 
	def void noHayDineroParaCompraException() {
		jug.dinero = 100
		try {
			jug.comprar(robot)
		} 
		catch (NoHayDineroParaCompraException e) {
			e.printStackTrace()
		}
	}
	
	@Test 
	def void noHayDineroParaReparacionException_I() {
		robot.deterioro = 50
		jug.dinero = 100
		try {
			jug.reparacionParcial(robot,50)
		} 
		catch (NoHayDineroParaReparacionException e) {
			e.printStackTrace()
		}
	}
	
	@Test 
	def void noHayDineroParaReparacionException_II() {
		robot.deterioro = 50
		jug.dinero = 100
		try {
			jug.reparacionTotal(robot)
		} 
		catch (NoHayDineroParaReparacionException e) {
			e.printStackTrace()
		}
	}
	
	@Test 
	def void apuestaExedidaException() {
		jug.dinero = 10
		var pelea = new Pelea(jug)
		try {
			jug.definirApuesta(pelea,75)
		} 
		catch (ApuestaExedidaException e) {
			e.printStackTrace()
		}
	}
	
	@Test 
	def void noHayDineroParaMejoraException() {
		var mejora = new Mejora("mejora","mejora de prueba",25,100)
		jug.dinero = 10
		robot.poder = 100
		try {
			jug.mejorar(robot,mejora)
		} 
		catch (NoHayDineroParaMejoraException e) {
			e.printStackTrace()
		}
	}
}