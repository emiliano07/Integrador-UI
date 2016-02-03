package game

import exception.ApuestaExcedidaException
import exception.NoHayDineroParaCompraException
import exception.NoHayDineroParaMejoraException
import exception.NoHayDineroParaReparacionException
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors class Jugador {

	var String nombre
	var int dinero
	var List<Robot> robots
	
	new(String nombre){
		this.nombre = nombre
		this.dinero = 0
		this.robots = newArrayList
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
	
	def seleccionarRobotPropio(Pelea pelea, Robot robot){
		pelea.seleccionarRobotPropio(robot)
	}
	
	def seleccionarRobotRival(Pelea pelea, Robot robot){
		pelea.seleccionarRobotRival(robot)
	}
	
	def Boolean puedoApostar(Integer apuesta) {
		if(apuesta <= 0 || !((apuesta * 100 / this.dinero) < 76))
			return false
		return true
	}
	
	def definirApuesta(Pelea pelea, int apuesta){
		if (puedoApostar(apuesta)){
			pelea.definirApuesta(apuesta)
			this.dinero = this.dinero - apuesta
		}
		else
			throw new ApuestaExcedidaException
	}
	
	def pelear(Pelea pelea){
		pelea.pelear
	}
	
	def actualizarGanancia(int ganancia){
		this.dinero = this.dinero + ganancia
	}
	
	def mejorar(Robot robot, Mejora mejora){
		if (mejora.precio <= this.dinero){
			robot.mejorar(mejora)
			this.dinero = this.dinero - mejora.precio
		}
		else
			throw new NoHayDineroParaMejoraException
	}
}