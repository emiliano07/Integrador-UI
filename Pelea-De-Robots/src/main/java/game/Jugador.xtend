package game

import exception.ApuestaExedidaException
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
	var Pelea peleaActiva
	
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
	
	def seleccionarRobotPropio(Robot robot){
		peleaActiva.seleccionarRobotPropio(robot)
	}
	
	def seleccionarRobotRival(Robot robot){
		peleaActiva.seleccionarRobotRival(robot)
	}
	
	def Boolean puedoApostar(int apuesta) {
		if(apuesta == 0 || !((apuesta * 100 / this.dinero) < 76))
			return false
		return true
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
			robot.mejorar(mejora)
			this.dinero = this.dinero - mejora.precio
		}
		else
			throw new NoHayDineroParaMejoraException
	}
}