package exception

class NoHayDineroParaMejoraException extends Exception{
	
	new(){
		super("Dinero insuficiente para realizar la mejora")
	}	
}