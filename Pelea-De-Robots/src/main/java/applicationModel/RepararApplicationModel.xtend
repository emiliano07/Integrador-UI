package applicationModel

import game.Jugador
import game.Robot
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable

@Observable
@Accessors class RepararApplicationModel {
	
	var Jugador jugador
	var Robot robot
	var int dañoAReparar
	var int costo
	
	new(Jugador jugador, Robot robot){
		this.jugador = jugador
		this.robot = robot
		this.dañoAReparar = 0
	}
	
	def getReparacionPosible(){
		(0 .. robot.deterioro).toList
	}
	
	def setDañoAReparar(int daño){
		this.dañoAReparar = daño
		costo = this.dañoAReparar * 25
		ObservableUtils.firePropertyChanged(this, "costo")
	}
	
	def reparar(){
		jugador.reparacionParcial(this.robot,this.dañoAReparar)
	}
}