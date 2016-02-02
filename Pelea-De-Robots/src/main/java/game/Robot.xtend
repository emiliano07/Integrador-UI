package game

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors class Robot {
	
	var String nombre
	var int poder
	var int deterioro
	var Jugador dueño
	var List<Mejora> mejorasPosibles
	
	new(String nombre, int poder, Jugador dueño){
		this.nombre = nombre
		this.poder = poder
		this.deterioro = 0
		this.dueño = dueño
		this.mejorasPosibles = newArrayList
	}
	
	def int getPoderEfectivo(){
		return this.poder * (100 - this.deterioro) / 100
	}
	
	def int precio(){
		return poderEfectivo * 50
	}
	
	def actualizarDesgaste(int desgaste) {
		if (this.deterioro + desgaste < 100)
			this.deterioro = this.deterioro + desgaste
		else
			this.deterioro = 100
	}
	
	def reparacionParcial(int reparacion){
		this.deterioro = this.deterioro - reparacion
	}
	
	def reparacionTotal(){
		this.deterioro = 0
	}
	
	def nuevaMejoraDisponible(String nombre, String descripcion, int mejora, int precio){
		var Mejora mej = new Mejora (nombre,descripcion,mejora,precio)
		this.mejorasPosibles.add(mej)
	}
	
	def mejorar(Mejora mejora){
		this.poder = this.poder + (this.poder * mejora.mejora / 100)
	}
}