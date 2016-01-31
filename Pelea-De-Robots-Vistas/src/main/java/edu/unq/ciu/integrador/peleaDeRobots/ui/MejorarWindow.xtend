package edu.unq.ciu.integrador.peleaDeRobots.ui

import applicationModel.MejorarApplicationModel
import exception.NoHayDineroParaMejoraException
import game.Mejora
import java.awt.Color
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class MejorarWindow extends SimpleWindow<MejorarApplicationModel>{
	
	new(WindowOwner parent, MejorarApplicationModel mejorarApplicationModel) {
		super(parent, mejorarApplicationModel)
		title = "Mejorar"
		taskDescription =  "" 
	}

	override protected createFormPanel(Panel mainPanel) {
		
		var secondPanel = new Panel(mainPanel)
		secondPanel.setLayout(new HorizontalLayout)
		
		new Label(secondPanel) => [
			text = "Poder de " + modelObject.robot.nombre + ": "
			foreground = Color.BLUE
			fontSize = 15
		]
		
		new Label(secondPanel) => [
			foreground = Color.BLUE
			fontSize = 15
			bindValueToProperty("poder")
		]
		
		var tablaDeMejoras = new Table<Mejora>(mainPanel, Mejora) => [
			bindItemsToProperty("robot.mejorasPosibles")
			bindValueToProperty("mejoraSeleccionada")
		]
		
		new Column<Mejora>(tablaDeMejoras) => [
			title = "Nombre"
			fixedSize = 120
			bindContentsToProperty("nombre")
		]
		
		new Column<Mejora>(tablaDeMejoras) => [
			title = "Aumento"
			fixedSize = 120
			bindContentsToProperty("mejora")
		]
		
		new Column<Mejora>(tablaDeMejoras) => [
			title = "Precio"
			fixedSize = 120
			bindContentsToProperty("precio")
		]
		
		var buttonPanel = new Panel(mainPanel)
		buttonPanel.setLayout(new HorizontalLayout)
		
		val elementSelected = new NotNullObservable("mejoraSeleccionada")
		
		new Button(buttonPanel) => [
			caption = "Aceptar"
			onClick [ | this.aceptar ]
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
	
	def aceptar(){
		try {
			modelObject.mejorar(modelObject.mejoraSeleccionada)
			this.close()
		} 
		catch (NoHayDineroParaMejoraException e) {
			showInfo(e.message)
		}
	}
}