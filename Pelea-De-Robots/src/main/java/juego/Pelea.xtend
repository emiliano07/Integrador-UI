package juego

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Pelea {
	
	var Jugador jugador
	var Robot robotPropio
	var Robot robotRival
	var int apuesta
	
	new (Jugador jugador){
		this.jugador = jugador
		this.robotPropio = null
		this.robotRival = null
		this.apuesta = 0
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
		}
		else{
			actualizarDesgaste
		}	
	}
	
	def actualizarGanancia(){
		this.jugador.actualizarGanancia(this.apuesta * (this.robotPropio.poderEfectivo + this.robotRival.poderEfectivo) / this.robotPropio.poderEfectivo)
	}
	
	def void actualizarDesgaste(){
		this.robotPropio.actualizarDesgaste(Math.max(5,(this.robotPropio.poderEfectivo - this.robotRival.poderEfectivo)))
	}
}