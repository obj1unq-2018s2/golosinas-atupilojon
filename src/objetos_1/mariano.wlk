
import golosinas.*

object mariano {
	// para este objeto no damos pistas
	// definimos algunos métodos para que compile el test
	var bolsaGolosinasCompradas = []
		
	method comprar(golosina) {
		bolsaGolosinasCompradas.add(golosina)
	}
	method golosinas() {
		/* cambiar por la implementacion correcta */ 
		return bolsaGolosinasCompradas 
	}
	method desechar(unaGolosina) {
		bolsaGolosinasCompradas.remove(unaGolosina)
	}
	method probarGolosinas() {
		bolsaGolosinasCompradas.forEach({golosina => golosina.mordisco()})
	}
	method hayGolosinaSinTACC() {
		var golosinasSinTACC = false
		bolsaGolosinasCompradas.forEach({golosina => golosinasSinTACC = golosinasSinTACC or golosina.libreGluten()})
		return golosinasSinTACC
	}
	method preciosCuidados(){
		var golosinasCuidados = true
		bolsaGolosinasCompradas.forEach({golosina => golosinasCuidados = golosinasCuidados and self.esGolosinaCuidada(golosina)})
		return golosinasCuidados
	}
	method golosinaDeSabor(unSabor) {
		return self.golosinasDeSabor(unSabor).first()
	}
	method golosinasDeSabor(unSabor) {
		return bolsaGolosinasCompradas.filter({golosina => golosina.gusto() == unSabor})
	}
	method sabores(){
		var sabores = self.saboresTotales()
		var saboresSinRepetir = []
		sabores.forEach({sabor =>
			if (saboresSinRepetir.contains(sabor)) {}
			else {saboresSinRepetir.add(sabor)}
		})
		return saboresSinRepetir
	}
	/*
	method saboresSet(){
		var sabores = self.saboresTotales()
		return sabores.asSet()
	}
	*/
	
	method golosinaMasCara() =
		bolsaGolosinasCompradas.fold(bolsaGolosinasCompradas.first(), {
			masPesada, golosina => 
			if (masPesada.peso() > golosina.peso()) return masPesada else return golosina
			})

	method pesoGolosinas() =
		bolsaGolosinasCompradas.sum({golosina => golosina.peso()})
		
	// Auxiliares
	method esGolosinaCuidada(unaGolosina) = 10 > unaGolosina.precio()
	method saboresTotales() {
		return bolsaGolosinasCompradas.map({golosina => golosina.gusto()})
	}
	method golosinasFaltantes(golosinasDeseadas){
		return golosinasDeseadas.filter({deseada => not bolsaGolosinasCompradas.contains(deseada)})
	}
	method gustosFaltantes(gustosDeseados) {
		return gustosDeseados.filter({deseados => not self.saboresTotales().contains(deseados)})
	}
}
