package game

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors class Game {
	
	var List<Jugador> jugadores
	
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