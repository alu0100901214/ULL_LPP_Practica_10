
# @author Sergio González Guerra
class Plato

	include Comparable
	include Enumerable

	attr_accessor :platoList
	
	# Clase que define un plato con un conjunto de alimentos.
	# @param platoList [List] Lista de alimentos del plato.
	# @param precio [Float] Coste (€) del conjunto de alimentos del plato.
	def initialize(platoList, precio)
		@platoList = platoList
		@precio = precio
	end
	
	# Clase que obtiene el precio.
	# @return [Float] precio del plato.
	def get_precio
		@precio
	end
		
	# Método que calcula la cantidad de gramos (gr) del plato.
	# @return [Float] Devuelve el total de gramos calculados del plato.
	def totalGramos
		node = @platoList.head
		total_gramos = 0
		while(node != nil)
			total_gramos += node.value.lipids + node.value.protein + node.value.carbohydrate
		 	node = node.next
		end
		(total_gramos).round(2)
	end

	# Método que calcula el porcentaje de proteínas que contiene el plato.
	# @return [Float] Devuelve el porcentaje de proteínas calculado del plato.
	def porcentajeProteinas
		node = @platoList.head
		total_gramos_proteinas = 0
		while(node != nil)
			total_gramos_proteinas += node.value.protein
			node = node.next
		end
		((total_gramos_proteinas*100)/totalGramos).round(2)
	end
	# Método que calcula el porcentaje de Lípidos que contiene el plato.
	# @return [Float] Devuelve el porcentaje de Lípidos calculado del plato.
	def porcentajeLipidos
		node = @platoList.head
		total_gramos_lipidos = 0
		while(node != nil)
			total_gramos_lipidos += node.value.lipids
			node = node.next
		end
		((total_gramos_lipidos*100)/totalGramos).round(2)
	end
	
	# Método que calcula el porcentaje de Hidratos de Carbono que contiene el plato.
	# @return [Float] Devuelve el porcentaje de Hidratos de Carbono calculado del plato.
	def porcentajeHidratosCarbono
		node = @platoList.head
		total_gramos_hidrato_carbono = 0
		while(node != nil)
			total_gramos_hidrato_carbono += node.value.carbohydrate
			node = node.next
		end
		((total_gramos_hidrato_carbono*100)/totalGramos).round(2)
	end

	# Método que calcula la cantidad total de Kilocalorias (kcal) del plato.
	# @return [Float] Devuelve la cantidad total de Kilocalorias (kcal) calculadas del plato.
	def totalKilocalorias
		node = @platoList.head
		total_kilocalorias = 0
		while(node != nil)
			total_kilocalorias += node.value.kcalLipids + node.value.kcalProtein + node.value.kcalCarboHydrate
			node = node.next
		end
		(total_kilocalorias).round(2)
	end
	
	# Método que comprueba que índice de energía le corresponde al plato.
	# @return [Int] Devuelve el índice de energía (1, 2 ó3) que le corresponde al plato.
	def indiceEnergia
		totalKcal = totalKilocalorias
		if(totalKcal < 670)
			1
		elsif((totalKcal >= 670) && (totalKcal <= 830))
			2
		elsif(totalKcal > 830)
			3
		end
	end
	
	# Método que incrementa el precio según el indice máximo de un menú dietético.
	# @param [Int] Indice máximo del menú dietético.
	# @return [Float] Devuelve el precio del plato incrementado.
	def incPrecio(maxInd)
		if(maxInd == 1)
			(@precio*1).round(2)
		elsif(maxInd == 2)
			(@precio*2).round(2)
		elsif(maxInd == 3)
			(@precio*3).round(2)
		end
	end
	
	# Método each para usar los métodos del módulo Enumerable
	def each
		node = @platoList.head
		while node != nil
			yield node.value
			node = node.next
		end
	end
	
	# Hace las comparaciones entre platos según las Kilocalorías totales.
	# @return [Int] '-1' '0' o '1'
	def <=> (other)
		return nil unless other.instance_of? Plato
		totalKilocalorias <=> other.totalKilocalorias
	end
	
	# Método to_s que representa la clase formateada en un String.
	# @return [String] Devuelve la lista de alimentos que contiene el plato.
	def to_s
		@platoList.to_s
	end
end


class PlatoImpactoAmbiental < Plato
	
	# Clase que define un plato en relación con su impacto ambiental.
	# @param platoList [List] Lista de alimentos del plato.
	# @param precio [Float] Coste (€) del conjunto de alimentos del plato.
	def initialize(platoList, precio)
		super(platoList, precio)
	end
	
	# Método que calcula la cantidad de GEI que produce el plato.
	# @return [Float] Devuelve la cantidad de GEI calculado.
	def totalGEI
		node = @platoList.head
		total_gei = 0
		while(node != nil)
			total_gei += node.value.gei
			node = node.next
		end
		(total_gei).round(2)
	end
	
	# Método que calcula la cantidad de terreno usado al día.
	# @return [Float] Devuelve la cantidad de terreno diario calculado.
	def totalTerreno
		node = @platoList.head
		total_terreno = 0
		while(node != nil)
			total_terreno += node.value.terrain
			node = node.next
		end
		(total_terreno).round(2)
	end
	
	# Método que calcula la cantidad de GEI que produce el plato al año.
	# @return [Float] Devuelve la cantidad de GEI anual calculado.
	def totalGEIanual
		(totalGEI*365).round(2)
	end
	
	# Método que comprueba que índice de GEI le corresponde al plato.
	# @return [Int] Devuelve el índice de GEI (1, 2 ó 3) que le corresponde al plato.
	def indiceGEI
		totalGEI = totalGEIanual
		if(totalGEI < 800)
			1
		elsif((totalGEI >= 800) && (totalGEI <= 1200))
			2
		elsif(totalGEI > 1200)
			3
		end
	end
	
	# Método que calcula la media de los indices de energía y GEI del plato.
	# @return [Float] Devuelve la media de los indices calculado.
	def mediaIndices
		((indiceGEI + indiceEnergia) / 2).round(2)
	end
	
	# Hace las comparaciones entre platos según los GEI total.
	# @return [Int] '-1' '0' o '1'
	def <=> (other)
		return nil unless other.instance_of? PlatoImpactoAmbiental
		totalGEI <=> other.totalGEI
	end
	
	# Método to_s que representa la clase formateada en un String.
	# @return [String] Devuelve la cantidad de GEI y el terreno diario que produce el plato.
	def to_s
		"GEI: #{totalGEI} terreno(m^2/día): #{totalTerreno}"
	end
end


class PlatoDSL 
	
	attr_accessor :nombre, :alimento

	def initialize(nombre, &block)
		@nombre = nombre
		@titulo = ""
		@alimento = []

		if block_given?
			if block.arity == 1
				yield self
			else
				instance_eval(&block)
			end
		end
	end
	
	def titulo(val)
		@titulo = val
	end

	def alimento(val, options = {})
		food = val
		food << " (#{options[:descripcion]})" if options[:descripcion]
		food << " (#{options[:gramos]})" if options[:gramos]
		@alimento << food
	end
	
	def totalGramos
		gramos = 0
		@alimento.each do |food|
			gramos += food[:gramos]
		end
		gramos
	end

	def to_s
		output = @nombre
		output << "\n#{@titulo}"
		output << "\n======================\n"
		output << "Alimentos: #{@alimento.join(', ')}"
		output << "\nCantidad de gramos: #{totalGramos}"
	end
end
