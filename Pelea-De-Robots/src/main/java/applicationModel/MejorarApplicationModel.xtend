package applicationModel

import game.Jugador
import game.Mejora
import game.Robot
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable

@Observable
@Accessors class MejorarApplicationModel {
	
	var Jugador jugador
	var Robot robot
	var Mejora mejoraSeleccionada
	var int poder
	
	new(Jugador jugador, Robot robot){
		this.jugador = jugador
		this.robot = robot
		this.mejoraSeleccionada = null
		this.poder = robot.poder
	}
	
	def setMejoraSeleccionada(Mejora mejoraSeleccionada){
		this.mejoraSeleccionada = mejoraSeleccionada
		this.poder = robot.poder + (robot.poder * mejoraSeleccionada.mejora / 100)
		ObservableUtils.firePropertyChanged(this, "poder")
	}
	
	def mejorar(Mejora mejora){
		jugador.mejorar(this.robot, mejora)
		ObservableUtils.firePropertyChanged(this, "mejoraSeleccionada")
	}
}