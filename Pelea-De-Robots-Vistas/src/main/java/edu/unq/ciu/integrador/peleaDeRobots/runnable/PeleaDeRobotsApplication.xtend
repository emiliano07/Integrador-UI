package edu.unq.ciu.integrador.peleaDeRobots.runnable

import applicationModel.JugadorApplicationModel
import edu.unq.ciu.integrador.peleaDeRobots.ui.PantallaPrincipalWindow
import game.Game
import game.Robot
import org.uqbar.arena.Application

class PeleaDeRobotsApplication extends Application{
	
	def static void main(String[] args){
		new PeleaDeRobotsApplication().start()
	}
	
	override createMainWindow() {
		
		//Juego
		var game = new Game()
		
		//Agrego al juego los jugadores
		game.nuevoJugador("Emiliano")
		game.nuevoJugador("Juani")
		game.nuevoJugador("Ramiro")
		game.nuevoJugador("Beto")

		//Jugadores
		var jugador1 = game.jugadores.get(0)
		var jugador2 = game.jugadores.get(1)
		var jugador3 = game.jugadores.get(2)
		var jugador4 = game.jugadores.get(3)
		
		//Robots
		var robot1 = new Robot("Arturito",150,jugador1)
		var robot2 = new Robot("Robotech",275,jugador1)
		var robot3 = new Robot("Wall-E",90,jugador1)
		var robot4 = new Robot("Terminator",150,jugador2)
		var robot5 = new Robot("Diegote",275,jugador3)
		var robot6 = new Robot("Sony",90,jugador4)
		
		robot1.deterioro = 10
		robot2.deterioro = 25
		
		//Agrego mejoras disponibles a los Robots
		robot1.nuevaMejoraDisponible("Mejora 1","Esta es la mejora 1",50,150)
		robot1.nuevaMejoraDisponible("Mejora 2","Esta es la mejora 2",100,250)
		robot1.nuevaMejoraDisponible("Mejora 3","Esta es la mejora 3",150,375)
		robot2.nuevaMejoraDisponible("Mejora 1","Esta es la mejora 1",50,150)
		robot2.nuevaMejoraDisponible("Mejora 2","Esta es la mejora 2",100,250)
		robot2.nuevaMejoraDisponible("Mejora 3","Esta es la mejora 3",150,375)
		robot3.nuevaMejoraDisponible("Mejora 1","Esta es la mejora 1",50,150)
		robot3.nuevaMejoraDisponible("Mejora 2","Esta es la mejora 2",100,250)
		robot3.nuevaMejoraDisponible("Mejora 3","Esta es la mejora 3",150,375)
		
		//Jugador1
		jugador1.dinero = 350
		jugador1.robots.add(robot1)
		jugador1.robots.add(robot2)
		jugador1.robots.add(robot3)
		
		//Otros Jugadores
		jugador2.robots.add(robot4)
		jugador3.robots.add(robot5)
		jugador4.robots.add(robot6)
		
		new PantallaPrincipalWindow(this, new JugadorApplicationModel(game,jugador1))
	}
}