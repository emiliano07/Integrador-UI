package edu.unq.ciu.integrador.peleaDeRobots.ui

import applicationModel.RepararApplicationModel
import exception.NoHayDineroParaReparacionException
import java.awt.Color
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class RepararWindow extends SimpleWindow<RepararApplicationModel>{
	
	new(WindowOwner parent, RepararApplicationModel repararApplicationModel) {
		super(parent, repararApplicationModel)
		title = "Reparar"
		taskDescription =  "" 
	}

	override protected createFormPanel(Panel mainPanel) {
		
		var secondPanel = new Panel(mainPanel)
		secondPanel.setLayout(new ColumnLayout(2))
		
		new Label(secondPanel) => [
			text = "Daño de Robot:"
			foreground = Color.BLUE
			fontSize = 12
		]
		
		new Label(secondPanel) => [
			fontSize = 10
			bindValueToProperty("robot.deterioro")
		]
		
		new Label(secondPanel) => [
			text = "Daño a reparar:"
			foreground = Color.BLUE
			fontSize = 12
		]
		
		new Selector(secondPanel) => [
			bindItemsToProperty("reparacionPosible")
			bindValueToProperty("dañoAReparar")
		]
		
		new Label(secondPanel) => [
			text = "Costo:"
			foreground = Color.BLUE
			fontSize = 12
		]
		
		new Label(secondPanel) => [
			fontSize = 10
			bindValueToProperty("costo")
		]
		
		var buttonPanel = new Panel(mainPanel)
		buttonPanel.setLayout(new HorizontalLayout)
		
		new Button(buttonPanel) => [
			caption = "Aceptar"
			onClick [ | this.reparar() ]
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
	
	def reparar(){
		try {
			modelObject.reparar()
			this.close()
		} 
		catch (NoHayDineroParaReparacionException e) {
			showInfo(e.message)
		}
	}
}