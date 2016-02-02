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
		
		createNewColumn(Robot,tablaDeRobotsPropios,"Nombre","nombre")
		createNewColumn(Robot,tablaDeRobotsPropios,"Daño","deterioro")
		createNewColumn(Robot,tablaDeRobotsPropios,"Poder","poder")
		createNewColumn(Robot,tablaDeRobotsPropios,"Poder Efectivo","poderEfectivo")
		createNewColumn(Robot,tablaDeRobotsPropios,"Precio","precio")
		
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
		
		createNewColumn(Robot,tablaDeRobotsRivales,"Dueño","dueño.nombre")
		createNewColumn(Robot,tablaDeRobotsRivales,"Nombre","nombre")
		createNewColumn(Robot,tablaDeRobotsRivales,"Daño","deterioro")
		createNewColumn(Robot,tablaDeRobotsRivales,"Poder","poder")
		createNewColumn(Robot,tablaDeRobotsRivales,"Poder Efectivo","poderEfectivo")
		createNewColumn(Robot,tablaDeRobotsRivales,"Precio","precio")
		
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
	
	def createNewColumn(Object object, Table table, String texto, String property){
		new Column<Object>(table) => [
			title = texto
			fixedSize = 120
			bindContentsToProperty(property)
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