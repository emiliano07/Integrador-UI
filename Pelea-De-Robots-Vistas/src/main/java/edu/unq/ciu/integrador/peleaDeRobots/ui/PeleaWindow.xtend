package edu.unq.ciu.integrador.peleaDeRobots.ui

import exception.ApuestaExcedidaException
import game.Pelea
import java.awt.Color
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class PeleaWindow  extends SimpleWindow<Pelea>{
	
	new(WindowOwner parent, Pelea pelea) {
		super(parent, pelea)
		title = "Pelea De Robots"
		taskDescription =  "Haga su apuesta" 
	}

	override protected createFormPanel(Panel mainPanel) {
		
		new Label(mainPanel) => [
			text = modelObject.robotPropio.nombre + " VS " + modelObject.robotRival.nombre
			foreground = Color.BLUE
			fontSize = 20
		]
		
		var secondPanel = new Panel(mainPanel)
		secondPanel.setLayout(new ColumnLayout(2))
		
		new Label(secondPanel) => [
			text = "Apuesta:"
			fontSize = 15
		]
		
		new TextBox(secondPanel) => [
			width = 75
            height = 15
			bindValueToProperty("apuesta")
		]
		
		val elementSelected = new NotNullObservable("apuesta")
		
		var buttonPanel = new Panel(mainPanel)
		buttonPanel.setLayout(new HorizontalLayout)
		
		new Button(buttonPanel) => [
			caption = "Pelear"
			onClick [ | this.pelear ]
			bindEnabled(elementSelected)
			width = 75
			height = 20
		]
		
		new Button(buttonPanel) => [
			caption = "Cancelar"
			onClick [ | this.close() ]
			width = 75
			height = 20
		]	
	}
	
	override protected addActions(Panel actionsPanel) {
	
	}
	
	def pelear(){
		try {
			this.modelObject.jugador.definirApuesta(this.modelObject,this.modelObject.apuesta)
			this.modelObject.jugador.pelear(this.modelObject)
			showInfo(this.modelObject.resultado)
			this.close()
		} 
		catch (ApuestaExcedidaException e) {
			showInfo(e.message)
		}
	}
}