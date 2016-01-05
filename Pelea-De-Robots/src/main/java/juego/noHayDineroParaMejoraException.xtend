package juego

class noHayDineroParaMejoraException extends Exception{
	
	new(){
		super("Dinero insuficiente para realizar la mejora")
	}	
}