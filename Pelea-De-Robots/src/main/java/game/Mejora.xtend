package game

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors class Mejora {
	
	var String nombre
	var String descripcion
	var int mejora
	var int precio
	
	new(String nombre, String descripcion, int mejora, int precio){
		this.nombre = nombre
		this.descripcion = descripcion
		this.mejora = mejora
		this.precio = precio
	}
}