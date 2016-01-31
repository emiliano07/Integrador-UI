package edu.unq.ciu.integrador.peleaDeRobots.ui

import applicationModel.JugadorApplicationModel
import applicationModel.MejorarApplicationModel
import applicationModel.RepararApplicationModel
import game.Pelea
import game.Robot
import java.awt.Color
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class PantallaPrincipalWindow extends SimpleWindow<JugadorApplicationModel>{
	
	new(WindowOwner parent, JugadorApplicationModel jugadorApplicationModel) {
		super(parent, jugadorApplicationModel)
		title = "Pelea De Robots"
		taskDescription =  "" 
	}

	override protected createFormPanel(Panel mainPanel) {
		
		var secondPanel = new Panel(mainPanel)
		secondPanel.setLayout(new HorizontalLayout)
		
		new Label(secondPanel) => [
			bindValueToProperty("jugador.nombre")
			foreground = Color.BLUE
			fontSize = 20
		]
		
		new Label(secondPanel) => [
			text = "  $"
			foreground = Color.BLUE
			fontSize = 20
		]
		
		new Label(secondPanel) => [
			bindValueToProperty("jugador.dinero")
			foreground = Color.BLUE
			fontSize = 20
		]
		
		new Label(mainPanel) => [
			text = "Mis Robots"
			foreground = Color.BLUE
			fontSize = 10
		]
		
		var tablePanel_I = new Panel(mainPanel)
		tablePanel_I.setLayout(new HorizontalLayout)
		
		var tablaDeRobotsPropios = new Table<Robot>(tablePanel_I, Robot) => [
			bindItemsToProperty("jugador.robots")
			bindValueToProperty("robotSeleccionado")
		]
		
		new Column<Robot>(tablaDeRobotsPropios) => [
			title = "Nombre"
			fixedSize = 120
			bindContentsToProperty("nombre")
			
		]
		
		new Column<Robot>(tablaDeRobotsPropios) => [
			title = "Daño"
			fixedSize = 120
			bindContentsToProperty("deterioro")
		]
		
		new Column<Robot>(tablaDeRobotsPropios) => [
			title = "Poder"
			fixedSize = 120
			bindContentsToProperty("poder")
		]
		
		new Column<Robot>(tablaDeRobotsPropios) => [
			title = "Poder Efectivo"
			fixedSize = 120
			bindContentsToProperty("poderEfectivo")
		]
		
		new Column<Robot>(tablaDeRobotsPropios) => [
			title = "Precio"
			fixedSize = 120
			bindContentsToProperty("precio")
		]
		
		val elementSelected = new NotNullObservable("robotSeleccionado")
		
		var buttonPanel = new Panel(tablePanel_I)
		buttonPanel.setLayout(new VerticalLayout)
		
		new Button(buttonPanel) => [
			caption = "Reparar"
			onClick [ | this.reparar ]
			bindEnabled(elementSelected)
			width = 75
			height = 20
		]
		
		new Button(buttonPanel) => [
			caption = "Mejorar"
			onClick [ | this.mejorar ]
			bindEnabled(elementSelected)
			width = 75
			height = 20
		]
		
		new Label(mainPanel) => [
			text = "Contrincantes"
			foreground = Color.BLUE
			fontSize = 10
		]
		
		var tablePanel_II = new Panel(mainPanel)
		tablePanel_II.setLayout(new HorizontalLayout)
		
		var tablaDeRobotsRivales = new Table<Robot>(tablePanel_II, Robot) => [
			bindItemsToProperty("robotsRivales")
			bindValueToProperty("robotRivalSeleccionado")
		]
		
		new Column<Robot>(tablaDeRobotsRivales) => [
			title = "Dueño"
			fixedSize = 120
			bindContentsToProperty("dueño.nombre")
		]
		
		new Column<Robot>(tablaDeRobotsRivales) => [
			title = "Nombre"
			fixedSize = 120
			bindContentsToProperty("nombre")
		]
		
		new Column<Robot>(tablaDeRobotsRivales) => [
			title = "Poder"
			fixedSize = 120
			bindContentsToProperty("poder")
		]
		
		new Column<Robot>(tablaDeRobotsRivales) => [
			title = "Daño"
			fixedSize = 120
			bindContentsToProperty("deterioro")
		]
		
		val elementSelected2 = new NotNullObservable("robotRivalSeleccionado")
		
		new Button(tablePanel_II) => [
			caption = "Competir"
			onClick [ | this.competir ]
			bindEnabled(elementSelected)
			bindEnabled(elementSelected2)
			width = 75
			height = 20
		]
	}
	
	override protected addActions(Panel actionsPanel) {
	
	}
	
	def reparar(){
		new RepararWindow(this,new RepararApplicationModel(modelObject.jugador,modelObject.robotSeleccionado)).open()
	}
	
	def mejorar(){
		new MejorarWindow(this,new MejorarApplicationModel(modelObject.jugador,modelObject.robotSeleccionado)).open()
	}
	
	def competir(){
		var pelea = new Pelea(modelObject.jugador)
		pelea.seleccionarRobotPropio(modelObject.robotSeleccionado)
		pelea.seleccionarRobotRival(modelObject.robotRivalSeleccionado)
		new PeleaWindow(this,pelea).open()
	}
}