

class Obrero {
	var recursosDisponibles = []
	var arma = new Espada()
	const cosasConstruidas = []
	
	method construir(algo) {
		algo.actualizarRecursos(self)
		
		cosasConstruidas.add(algo)
	}
	
	method arma(nueva){
		arma = nueva
	}
	
	
	method actualizarStock(item){
		const recurso = recursosDisponibles.find{i=>i.material() == item.material()}
		recurso.descontar(item.cantidad())
	}
	
	method totalRecursosUtilizados() = 
	     cosasConstruidas.sum{c=>c.cuantosRecursosRequiere()}
	
	method puedeDefenderse() = arma.esFuerte()
	method recursos() = recursosDisponibles.sum{i=>i.cantidad()}
}


class Item {
	var cantidad
	var material
	
	method cantidad() = cantidad
	method material() = material
	method descontar(cant) {
		cantidad -= cant
	}	
} 

class Casa{
	var recursos = [] 

	method cuantosRecursosRequiere() = recursos.sum{i=>i.cantidad()}
	
	method actualizarRecursos(unObrero) {
		recursos.forEach{item=> unObrero.actualizarStock(item)}
	}
}

class Espada{
	method esFuerte() = true
	method actualizarRecursos(obrero){}
	
}

class Escudo{
	var material 
	var reforzado = false
	method esFuerte() = material.resistencia() > 50 || reforzado

	method actualizarRecursos(obrero){
		obrero.actualizarStock(new Item(
			material=material, 
			cantidad= if (reforzado) 20 else 10 ))
	}
}


class Material{
	var resistencia 
	method resistencia() = resistencia
}


