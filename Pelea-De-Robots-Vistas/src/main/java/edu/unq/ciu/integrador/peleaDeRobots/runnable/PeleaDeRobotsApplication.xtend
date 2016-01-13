package edu.unq.ciu.integrador.peleaDeRobots.runnable

import edu.unq.ciu.integrador.peleaDeRobots.ui.PantallaPrincipalWindow
import juego.Juego
import org.uqbar.arena.Application

class PeleaDeRobotsApplication extends Application{
	
	def static void main(String[] args){
		new PeleaDeRobotsApplication().start()
	}
	
	override createMainWindow() {
		
		//Calificaciones
		//var Calificacion nooob = new Nooob
		//var Calificacion manco = new Manco
		
		new PantallaPrincipalWindow(this, new Juego)
	}
}