package exception

class ApuestaExedidaException extends Exception {
	
	new(){
		super("Se supero el limite para apostar")
	}
}