package game

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors class Pelea {
	
	var Jugador jugador
	var Robot robotPropio
	var Robot robotRival
	var Integer apuesta
	var Boolean gane
	
	new (Jugador jugador){
		this.jugador = jugador
		this.robotPropio = null
		this.robotRival = null
		this.apuesta = null
		this.gane = null
	}
	
	def seleccionarRobotPropio(Robot robot){
		this.robotPropio = robot
	}
	
	def seleccionarRobotRival(Robot robot){
		this.robotRival = robot
	}
	
	def definirApuesta(int apuesta){
		this.apuesta = apuesta
	}
	
	def numeroAlAzar(){
		return Math.round(Math.random()*1).intValue
	}
	
	def void pelear(){
		if(numeroAlAzar <= this.robotPropio.poderEfectivo / (this.robotPropio.poderEfectivo + this.robotRival.poderEfectivo)){
			actualizarGanancia
			actualizarDesgaste
			this.gane = true
		}
		else{
			actualizarDesgaste
			this.gane = false
		}	
	}
	
	def String resultado(){
		if(this.gane)
			return "Resultaste el ganador de la Pelea. Felicitaciones!!!"
		return "Lamentablemente fuiste derrotado. No te desepciones, intentalo nuevamente"
	}
	
	def actualizarGanancia(){
		this.jugador.actualizarGanancia(this.apuesta * (this.robotPropio.poderEfectivo + this.robotRival.poderEfectivo) / this.robotPropio.poderEfectivo)
	}
	
	def void actualizarDesgaste(){
		this.robotPropio.actualizarDesgaste(Math.max(5,(this.robotPropio.poderEfectivo - this.robotRival.poderEfectivo)))
	}
	
	def Boolean cumpleRequisitos(){
		return this.apuesta >= 0
	}
}