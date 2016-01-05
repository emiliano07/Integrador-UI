package juego

class noHayDineroParaReparacionException extends Exception{
	
	new(){
		super("Dinero insuficiente para realizar la reparacion")
	}	
}