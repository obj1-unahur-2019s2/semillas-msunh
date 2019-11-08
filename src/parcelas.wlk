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

	method cantidadMaximaDePlantasQueTolera() {
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
		return self.cantidadMaximaDePlantasQueTolera() <= self.cantidadDePlantasQueTieneLaParcela()
	}

	method plantar(planta) {
		if (not self.superaLaCantidadDeLaParcela() and self.parcelaRecibeMasHorasDeSolQueLaPlanta(planta)) {
			plantas.add(planta)
		} else {
			self.error("Casapacidad completa, No se puede plantar en esta Parcela")
		}
	}

}

class ParcelaEcologica inherits Parcela {

	method seAsociaBien(planta) {
		return not self.tieneComplicaciones() and planta.esUnaParcelaIdeal(self)
	}

}

class ParcelaIndustrial inherits Parcela {

	method seAsociaBien(planta) {
		return self.cantidadDePlantasQueTieneLaParcela() >= 2 and planta.esFuerte()
	}

}