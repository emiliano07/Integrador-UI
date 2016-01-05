package exception

class NoHayDineroParaCompraException extends Exception {
	
	new(){
		super("El dinero no alcanza para realizar la compra")
	}
}