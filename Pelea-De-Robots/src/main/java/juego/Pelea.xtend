package juego

class Pelea {
	
	var Robot robotPropio
	var Robot robotRival
	var int apuesta
	
	new (){
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
		//ver como se lo sumo al jugador
		apuesta * (this.robotPropio.poderEfectivo + this.robotRival.poderEfectivo) / this.robotPropio.poderEfectivo
	}
	
	def void actualizarDesgaste(){
		this.robotRival.actualizarDesgaste(Math.max(5,(this.robotPropio.poderEfectivo - this.robotRival.poderEfectivo)))
	}
}