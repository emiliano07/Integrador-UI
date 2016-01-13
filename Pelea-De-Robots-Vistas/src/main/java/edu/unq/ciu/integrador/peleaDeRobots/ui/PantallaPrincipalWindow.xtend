package edu.unq.ciu.integrador.peleaDeRobots.ui

import juego.Juego
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class PantallaPrincipalWindow extends SimpleWindow<Juego>{
	
	new(WindowOwner parent, Juego juego) {
		super(parent, juego)
		title = "Pelea De Robots"
		taskDescription =  "" 
	}

	override protected createFormPanel(Panel mainPanel) {
		
		new Label(mainPanel) => [
			text = "LUCIO CARETA!!!!!!!!!!!!!!"
		]
	}
	
	override protected addActions(Panel actionsPanel) {
	
	}
}