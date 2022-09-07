import golosinas.*

object mariano {
	// para este objeto no damos pistas
	// definimos algunos métodos para que compile el test
	var golosinas = []
	var golosinasDesechadas = []
	
	method comprar(unaGolosina) { golosinas.add(unaGolosina) }
	method comprarVarias(lista) {golosinas.addAll(lista)}
	method vaciarBolsa() {golosinas.clear()}
	method desechar(unaGolosina) {
		golosinas.remove(unaGolosina);
		golosinasDesechadas.add(unaGolosina)
	}
	method cantidadGolosinas() = golosinas.size()
	method tieneLaGolosina(unaGolosina) = golosinas.contains(unaGolosina)
	method probarGolosina() {
		golosinas.forEach({g => g.mordisco()
						  console.println(g.gusto())
		}) 
			
	}
	method haygolosinasSinTACC() = golosinas.all({g => g.libreDeGluten()})
	method preciosCuidados() = golosinas.all({g => g.precio() <= 10})
	method preciosCuidadosConAny() = golosinas.any({g => g.precio() < 10})
	method golosinaDeSabor(unSabor) = golosinas.find({g => g.gusto() == unSabor})
	method golosinasDeSabor(unSabor) = golosinas.filter({g => g.gusto() == unSabor})
	method sabores() = golosinas.map({g => g.gusto()})
	method golosinasMasCaras() = golosinas.max({g => g.precio()})
	method golosinasMasCarasConMap() = golosinas.map({g => g.precio()})
	method precioGolosinasMasCaras() = self.golosinasMasCaras().precio()
	method pesoGolosinas() = golosinas.sum({g => g.peso()})
	method golosinasFaltantes(golosinasDeseadas) =
			golosinasDeseadas.asSet().difference(golosinas.asSet())
	method golosinasFaltantesA(golosinasDeseadas) =
			golosinas.asSet().difference(golosinas.asSet())
	method gustosFaltantes(gustosDeseados) = 
			gustosDeseados.asSet().difference(self.sabores())
	method gastoEn(sabor) = 
	 		self.golosinasDeSabor(sabor).sum({g=> g.precio()})
	method precioGolosinaMasCaraDeUnSabor(sabor) = self.golosinasDeSabor(sabor).max({g => g.precio()}).precio()
	method cantidadDeGolosinasDeUnSabor(unSabor) = self.golosinasDeSabor(unSabor).size()
	method saborMasPopular() = self.sabores().max({sabor=> self.cantidadDeGolosinasDeUnSabor(sabor)})
	method golosinaDePeso(peso) = self.golosinasDeSabor(peso).peso()
	method saborMasPesado()	= self.sabores().max({sabor=> self.golosinaDePeso(sabor)})
	method comproYDesecho(golosina) = golosinasDesechadas.contains(golosina) 
}

