package juego

import java.util.ArrayList

class Jugador {

	var String nombre
	var int dinero
	var ArrayList<Robot> robots
	var Pelea peleaActiva
	
	new(String nombre){
		this.nombre = nombre
		this.dinero = 0
		this.robots = newArrayList
		this.peleaActiva = null
	}
	
	def void comprar(Robot robot){
		this.robots.add(robot)
		//ver dinero
	}
	
	def void vender(Robot robot){
		this.robots.remove(robot)
		//ver dinero
	}
	
	def void reparacionParcial(Robot robot, int reparacion){
		var costoDeReparacion = reparacion * 25
		if (costoDeReparacion <= this.dinero){
			robot.reparacionParcial(reparacion)
			this.dinero = this.dinero - costoDeReparacion
		}
		else
			throw new noHayDineroParaReparacionException
	}
	
	def void reparacionTotal(Robot robot){
		var costoDeReparacion = robot.deterioro * 25
		if (costoDeReparacion <= this.dinero){
			robot.reparacionTotal
			this.dinero = this.dinero - costoDeReparacion
		}
		else
			throw new noHayDineroParaReparacionException
	}
		
	def iniciarPelea(){
		this.peleaActiva = new Pelea
	}
	
	def seleccionarRobotPropio(Robot robot){
		peleaActiva.seleccionarRobotPropio(robot)
	}
	
	def seleccionarRobotRival(Robot robot){
		peleaActiva.seleccionarRobotRival(robot)
	}
	
	def Boolean puedoApostar(int apuesta) {
		if((apuesta * 100 / this.dinero) < 76)
			return true
		return false
	}
	
	def definirApuesta(int apuesta){
		if (puedoApostar(apuesta)){
			this.peleaActiva.definirApuesta(apuesta)
			this.dinero = this.dinero - apuesta
		}
		else
			throw new apuestaExedidaException
	}
	
	def pelear(){
		this.peleaActiva.pelear
	}
	
	def mejorar(Robot robot, Mejora mejora){
		if (mejora.precio <= this.dinero){
			robot.mejorar(mejora.mejora)
			this.dinero = this.dinero - mejora.precio
		}
		else
			throw new noHayDineroParaMejoraException
	}
}