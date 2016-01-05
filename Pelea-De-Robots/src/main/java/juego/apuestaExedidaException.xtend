package juego

class apuestaExedidaException extends Exception {
	
	new(){
		super("Se supero el limite para apostar")
	}
}