import semillas.*

class Parcela {

	var property ancho = 0
	var property largo = 0
	var property horasDeSolQueRecibePorDia = 0
	var property plantas = []

	method agregarPlanta(planta) {
		plantas.add(planta)
	}

	method superficieDeLaParcela() {
		return ancho * largo
	}

	method cantidadMaximaDePLantasQueTolera() {
		if (ancho > largo) {
			return self.superficieDeLaParcela() / 5
		} else {
			return (self.superficieDeLaParcela() / 3) + largo
		}
	}

	method tieneComplicaciones() {
		return plantas.any({ planta => planta.horasDeSolQueTolera() < horasDeSolQueRecibePorDia })
	}

	method parcelaRecibeMasHorasDeSolQueLaPlanta(planta) {
		return horasDeSolQueRecibePorDia < planta.horasDeSolQueTolera() + 2
	}

	method cantidadDePlantasQueTieneLaParcela() {
		return plantas.size()
	}

	method superaLaCantidadDeLaParcela() {
		return self.cantidadMaximaDePLantasQueTolera() <= self.cantidadDePlantasQueTieneLaParcela()
	}

	method plantarUnaPlanta(planta) {
		if (not self.superaLaCantidadDeLaParcela() and self.parcelaRecibeMasHorasDeSolQueLaPlanta(planta)) {
			plantas.add(planta)
		} else {
			self.error("No se puede plantar en esta Parcela")
		}
	}
	
	method esEcologica(planta){
		return not self.tieneComplicaciones() and planta.esUnaParcelaIdeal(self) 
	}
	
	method esIdustrial(planta){
		return self.cantidadDePlantasQueTieneLaParcela() >= 2 and planta.esFuerte() 
	}

}	
	
	

