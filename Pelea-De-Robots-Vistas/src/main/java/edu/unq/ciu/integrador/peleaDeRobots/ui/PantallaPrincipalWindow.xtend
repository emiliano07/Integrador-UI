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
		
		var tablePanel = new Panel(mainPanel)
		tablePanel.setLayout(new HorizontalLayout)
		
		var table = new Table<Robot>(tablePanel, Robot) => [
			bindItemsToProperty("jugador.robots")
			bindValueToProperty("robotSeleccionado")
		]
		
		new Column<Robot>(table) => [
			title = "Nombre"
			fixedSize = 120
			bindContentsToProperty("nombre")
			
		]
		
		new Column<Robot>(table) => [
			title = "Daño"
			fixedSize = 120
			bindContentsToProperty("deterioro")
		]
		
		new Column<Robot>(table) => [
			title = "Poder"
			fixedSize = 120
			bindContentsToProperty("poder")
		]
		
		new Column<Robot>(table) => [
			title = "Poder Efectivo"
			fixedSize = 120
			bindContentsToProperty("poderEfectivo")
		]
		
		new Column<Robot>(table) => [
			title = "Precio"
			fixedSize = 120
			bindContentsToProperty("precio")
		]
		
		val elementSelected = new NotNullObservable("robotSeleccionado")
		
		var buttonPanel = new Panel(tablePanel)
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
		
		var table2Panel = new Panel(mainPanel)
		table2Panel.setLayout(new HorizontalLayout)
		
		var table2 = new Table<Robot>(table2Panel, Robot) => [
			bindItemsToProperty("robotsRivales")
			bindValueToProperty("robotRivalSeleccionado")
		]
		
		new Column<Robot>(table2) => [
			title = "Dueño"
			fixedSize = 120
			bindContentsToProperty("dueño.nombre")
		]
		
		new Column<Robot>(table2) => [
			title = "Nombre"
			fixedSize = 120
			bindContentsToProperty("nombre")
		]
		
		new Column<Robot>(table2) => [
			title = "Poder"
			fixedSize = 120
			bindContentsToProperty("poder")
		]
		
		new Column<Robot>(table2) => [
			title = "Daño"
			fixedSize = 120
			bindContentsToProperty("deterioro")
		]
		
		val elementSelected2 = new NotNullObservable("robotRivalSeleccionado")
		
		new Button(table2Panel) => [
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
		modelObject.jugador.peleaActiva = pelea
		pelea.seleccionarRobotPropio(modelObject.robotSeleccionado)
		pelea.seleccionarRobotRival(modelObject.robotRivalSeleccionado)
		new PeleaWindow(this,pelea).open()
	}
}