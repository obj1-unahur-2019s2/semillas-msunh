import semillas.*
import parcelas.*

object inta {
	var property parcelas = []

	method cantidadDeParcelas(){
		return parcelas.size() 
	}

	method cantidadDePlantasPorParcela(){
		return parcelas.sum({parcela => parcela.cantidadDePlantasQueTieneLaParcela()}) 
			
	}

	method promedioDePlantas() {
		return  self.cantidadDePlantasPorParcela() / self.cantidadDeParcelas()
	}
	
	method parcelasConMasDeCuatroPlantas(){
		return parcelas.filter({ parcela => parcela.cantidadDePlantasQueTieneLaParcela() > 4})
	}
	
	method parcelaMasAutosustentable(){
		return self.parcelasConMasDeCuatroPlantas() //FALTA TERMINAR
		
	}

}
