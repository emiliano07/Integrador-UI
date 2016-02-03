package exception

class ApuestaExcedidaException extends Exception {
	
	new(){
		super("El monto que desea apostar excede el máximo disponible")
	}
}