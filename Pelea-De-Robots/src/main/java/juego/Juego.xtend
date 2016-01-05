package juego

import java.util.ArrayList

class Juego {
	
	var ArrayList<Jugador> jugadores
	
	new(){
		this.jugadores = newArrayList
	}
	
	def nuevoJugador(String nombre){
		var jugador = new Jugador(nombre)
		this.jugadores.add(jugador)
	}
	
	def eliminarJugador(Jugador jugador){
		this.jugadores.remove(jugador)
	}
}