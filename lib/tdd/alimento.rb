
# @author Sergio González Guerra
class Alimento
	
	include Comparable

	attr_accessor :nameFood, :protein, :carbohydrate, :lipids, :gei, :terrain
	
	# Clase que define un alimento.
	# @param nameFood [String] Nombre del alimento.
	# @param protein [Float] Cantidad de proteínas (gr).
	# @param carbohydrate [Float] Cantidad de carbohidratos (gr).
	# @param lipids [Float] Cantidad de lípidos (gr).
	# @param gei [Float] GEI que produce el alimento.
	# @param terrain [Float] terreno diario necesario para producir el alimento.
	def initialize(nameFood, protein, carbohydrate, lipids, gei, terrain)
		@nameFood, @protein, @carbohydrate, @lipids, @gei, @terrain = nameFood, protein, carbohydrate, lipids, gei, terrain
	end
	
	# Método que calcula las Kilocalorías (kcal) de los carbohidratos.
	# @return [Float] Kilocalorías calculadas.
	def kcalCarboHydrate
		(4*@carbohydrate).round(2)
	end
	
	# Método que calcula las Kilocalorías (kcal) de los lípidos.
	# @return [Float] Kilocalorías calculadas.
	def kcalLipids
		(9*@lipids).round(2)
	end
	
	# Método que calcula las Kilocalorías (kcal) de las proteínas.
	# @return [Float] Kilocalorías calculadas.
	def kcalProtein
		(4*@protein).round(2)	
	end
	
	# Método que calcula las Kilocalorías (kcal) totales del alimento.
	# @return [Float] Total de Kilocalorías calculadas.
	def kcalTotal
		(kcalCarboHydrate + kcalLipids + kcalProtein).round(2)
	end
	
	# Hace las comparaciones entre alimentos mirando el total de Kilocalorías de cada uno.
	# @return [Int] '-1' '0' o '1'
	def <=> (other)
		return nil unless other.instance_of? Alimento
		kcalTotal <=> other.kcalTotal
	end

	# Método to_s que devuelve el nombre del alimento.
	# @return [String] Nombre del alimento.
	def to_s
		"#{@nameFood}"
	end
end

