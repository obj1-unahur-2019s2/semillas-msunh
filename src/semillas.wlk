import parcelas.*

class Planta {

	var property anioDeObtencion = 0
	var property altura = 0

	method horasDeSolQueTolera()

	method esFuerte() {
		return self.horasDeSolQueTolera() > 10
	}

	method daNuevasSemillas() {
		return self.esFuerte() // or
	}

	method espacioQueOcupa()
	
	method esUnaParcelaIdeal(param)
	
//	method seAsociaBien(parcela){
//		return parcela.esEcologica(self) and parcela.esIndustrial(self)
//	}

}

//plantas
class Menta inherits Planta {

	override method horasDeSolQueTolera() {
		return 6
	}

	override method daNuevasSemillas() {
		return super() or altura > 0.4
	}

	override method espacioQueOcupa() {
		return altura * 3
	}
	
	override method esUnaParcelaIdeal(parcela){
		return parcela.superficieDeLaParcela() > 6 
	}
	
	
}

class HierbaBuena inherits Menta {

	override method espacioQueOcupa() {
		return super() * 2
	}

}

class Soja inherits Planta {

	override method horasDeSolQueTolera() {
		if (altura < 0.5) {
			return 6
		} else if (altura.between(0.5, 1)) {
			return 7
		} else {
			return 9
		}
	}

	method semillaDeObtencionReciente() {
		return anioDeObtencion > 2007
	}

	method alturaMayorAUnMetro() {
		return altura > 1
	}

	override method daNuevasSemillas() {
		return super() or (self.semillaDeObtencionReciente() and self.alturaMayorAUnMetro())
	}

	override method espacioQueOcupa() {
		return altura / 2
	}
	
	override method esUnaParcelaIdeal(parcela){
		return parcela.horasDeSolQueRecibePorDia() == self.horasDeSolQueTolera()
	}

}

class SojaTransgenica inherits Soja {

	override method daNuevasSemillas() {
		return false
	}
	
	override method esUnaParcelaIdeal(parcela){ //consultar
		return parcela.cantidadMaximaDePLantasQueTolera() == 1
	}

}

class Quinoa inherits Planta {

	var property horasDeSolQueTolera = 0

	override method espacioQueOcupa() {
		return 0.5
	}

	method semillaDeObtencionTardia() {
		return anioDeObtencion < 2005
	}

	override method daNuevasSemillas() {
		return super() or self.semillaDeObtencionTardia()
	}
	
	override method esUnaParcelaIdeal(parcela){
		return not parcela.plantas().any({ planta => planta.altura() > 1.5 })
	}
	
	//otro
	//override method esUnaParcelaIdeal(parcela){
	// return parcela.plantas().all({ planta => planta.altura < 1.5 )}
	//
	//}
	
	
	

}




