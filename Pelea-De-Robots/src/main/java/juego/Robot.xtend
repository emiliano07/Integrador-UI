package juego

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Robot {
	
	var String nombre
	var int poder
	var int deterioro
	
	new(String nombre, int poder){
		this.nombre = nombre
		this.poder = poder
		this.deterioro = 0
	}
	
	def int poderEfectivo(){
		return this.poder * (100 - this.deterioro) / 100
	}
	
	def int precio(){
		return poderEfectivo * 50
	}
	
	def actualizarDesgaste(int desgaste) {
		deterioro = deterioro + desgaste
	}
	
	def reparacionParcial(int reparacion){
		this.deterioro = this.deterioro - reparacion
	}
	
	def reparacionTotal(){
		this.deterioro = 0
	}
	
	def mejorar(int mejora){
		this.poder = this.poder + (this.poder * mejora / 100)
	}
}