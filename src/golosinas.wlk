object bombon {
	var peso = 15
	
	method precio() { return 5 }
	method peso() { return peso }
	method mordisco() { peso = 0.max(peso * 0.8 - 1) }
	method gusto() { return "frutilla" }
	method libreGluten() { return true }
}

object alfajor {
	var peso = 300
	method precio() { return 12 }
	method peso() { return peso }
	method mordisco() { peso = 0.max(peso * 0.8) }
	method gusto() { return "chocolate" }
	method libreGluten() { return false}
}

object caramelo {
	var peso = 5
	method precio() { return 1 }
	method peso() { return peso }
	method mordisco() { peso = 0.max(peso - 1) }
	method gusto() { return "frutilla" }
	method libreGluten() { return true}
}

object chupetin {
	var peso = 7
	method precio() { return 2 }
	method peso() { return peso }
	method mordisco() { 
		if (peso > 2) {
			peso = 0.max(peso * 0.9)	
		}
	}
	method gusto() { return "naranja" }
	method libreGluten() { return true}
}
object oblea {
	var peso = 250
	method precio() { return 5 }
	method peso() { return peso }
	method mordisco() { 
		if (peso > 2) {
			peso = 0.max(peso * 0.9)	
		}
	}
	method gusto() { return "vanilla" }
	method libreGluten() { return true}
}
object chocolatin {
	// hay que acordarse de *dos* cosas, el peso inicial y el peso actual
	// el precio se calcula a partir del precio inicial
	// el mordisco afecta al peso actual
	var pesoInicial
	var pesoActual
	method precio() { return pesoInicial * 1.5 }
	method peso(cuanto) { 
		pesoInicial = cuanto
		pesoActual = cuanto
	}
	method mordisco() { 
		pesoActual = 0.max(pesoActual - 2)
	}
	method peso() = pesoActual
	method gusto() { return "chocolate" }
	method libreGluten() { return false}
	
	/* al principio, el peso actual coincide con el inicial */
	method pesoInicial(cuanto) { 
		pesoInicial = cuanto
		pesoActual = cuanto
	}
}

object golosinaBaniada {
	var golosinaInterior
	var pesoBanio = 4
	
	method baniaA(unaGolosina) { golosinaInterior = unaGolosina }
	method precio() { golosinaInterior.precio() + 2 }
	method peso() { golosinaInterior.peso() + 4  }
	method mordisco() {
		golosinaInterior.mordisco()
		if (pesoBanio > 0) { pesoBanio -= 2 }
		// otra forma de hacer la cuenta: pesoBanio = (pesoBanio - 2).max(0) 
	}	
	method gusto() { return golosinaInterior.gusto() }
	method libreGluten() { golosinaInterior.LibreGluten()}	
}

object tuttifrutti {
	// como manejar el cambio de sabor ??
	var property peso = 5
	var property libreDeGluten
	const gustos = ["frutilla", "chocolate", "naranja"]
	var cantMordiscos = 0
	
	/*method esLibreONoDeGluten(angengo) {
		esLibreDeGluten = angengo
	}
	*/
	method precio() {
		if (libreDeGluten == true) {
			return 7
		}else {
			return 10
		}
	}
	method mordisco() {
		 cantMordiscos++	 
	}
	method gusto() {
		gustos.get(cantMordiscos % gustos.size())
	}
} 

