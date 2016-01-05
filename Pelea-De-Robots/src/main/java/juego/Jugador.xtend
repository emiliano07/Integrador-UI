package juego

import exception.ApuestaExedidaException
import exception.NoHayDineroParaCompraException
import exception.NoHayDineroParaMejoraException
import exception.NoHayDineroParaReparacionException
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
		var costoDeCompra = robot.precio
		if (costoDeCompra <= this.dinero){
			this.robots.add(robot)
			this.dinero = this.dinero - costoDeCompra
		}
		else
			throw new NoHayDineroParaCompraException
	}
	
	def void vender(Robot robot){
		this.robots.remove(robot)
		this.dinero = this.dinero + robot.precio
	}
	
	def void reparacionParcial(Robot robot, int reparacion){
		var costoDeReparacion = reparacion * 25
		if (costoDeReparacion <= this.dinero){
			robot.reparacionParcial(reparacion)
			this.dinero = this.dinero - costoDeReparacion
		}
		else
			throw new NoHayDineroParaReparacionException
	}
	
	def void reparacionTotal(Robot robot){
		var costoDeReparacion = robot.deterioro * 25
		if (costoDeReparacion <= this.dinero){
			robot.reparacionTotal
			this.dinero = this.dinero - costoDeReparacion
		}
		else
			throw new NoHayDineroParaReparacionException
	}
		
	def iniciarPelea(){
		this.peleaActiva = new Pelea(this)
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
			throw new ApuestaExedidaException
	}
	
	def pelear(){
		this.peleaActiva.pelear
	}
	
	def actualizarGanancia(int ganancia){
		this.dinero = this.dinero + ganancia
	}
	
	def mejorar(Robot robot, Mejora mejora){
		if (mejora.precio <= this.dinero){
			robot.mejorar(mejora.mejora)
			this.dinero = this.dinero - mejora.precio
		}
		else
			throw new NoHayDineroParaMejoraException
	}
}