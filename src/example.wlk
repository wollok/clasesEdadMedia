

class Obrero {
	var recursos = 1000
	var arma = new Escudo()
	const cosasConstruidas = []
	
	method construir(algo) {
		recursos = recursos - algo.cuantosRecursosRequiere()
		cosasConstruidas.add(algo)
	}
	
	method totalRecursosUtilizados() = 
	     cosasConstruidas.sum{c=>c.cuantosRecursosRequiere()}
	
	method puedeDefenderse() = arma.esFuerte()
	method recursos() = recursos
}


class Casa{
	var cuantosRecursosRequiere
	method cuantosRecursosRequiere() =cuantosRecursosRequiere
	
}

class Espada{
	method esFuerte() = true
}


class Escudo{
	var material = "hierro"
	method esFuerte() = material == "hierro"

}