package applicationModel

import game.Game
import game.Jugador
import game.Robot
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors class JugadorApplicationModel {
	
	var Game game
	var Jugador jugador
	var Robot robotSeleccionado
	var Robot robotRivalSeleccionado
	
	new(Game game, Jugador jugador){
		this.game = game
		this.jugador = jugador
		this.robotSeleccionado = null
		this.robotRivalSeleccionado = null
	}
	
	def robotsRivales(){
		var listado = newArrayList
		for (Jugador jug : this.game.jugadores){
			if(jug != this.jugador)
				listado.addAll(jug.robots)
		}
		return listado
	}
}