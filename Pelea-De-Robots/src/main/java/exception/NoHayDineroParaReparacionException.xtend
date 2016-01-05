package exception

class NoHayDineroParaReparacionException extends Exception{
	
	new(){
		super("Dinero insuficiente para realizar la reparacion")
	}	
}