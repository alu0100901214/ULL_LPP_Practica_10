
require './lib/tdd/alimento'
require './lib/tdd/plato'
require './lib/tdd/list'
require './lib/tdd/menu'

RSpec.describe Tdd do
  it "has a version number" do
    expect(Tdd::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(false)
  end
end

RSpec.describe Alimento do

	before :all do
		@carneDeVaca = Alimento.new("Carne de Vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
		@pollo = Alimento.new("Pollo", 20.6, 0.0, 5.6, 5.7, 7.1)
	end
	context "Instancias de la clase." do
		it "Debe existir un nombre para el alimento." do
			carneVaca = Alimento.new("Carne de Vaca",21.1,0.0,3.1,50.0,164.0)
		end

		it "Existe una cantidad para Proteínas(g), Carbohidratos(g) y Lípidos(g), GEI (kgCO2eq) y el Terreno (m^2 al año)." do
			proteinas = Alimento.new("Carne de Vaca",21.1,0.0,3.1,50.0,164.0)
		end
	end
	context "Comprobación de que se calcula la eficencia energética del Alimento." do

		it "Se calcula la cantidad de kilocalorías que producen los CarboHidratos de un alimento" do
			expect(@carneDeVaca.kcalCarboHydrate).to eq(0.0)
		end

		it "Se calcula la cantidad de kilocalorías que producen los Lipidos de un alimento" do
			expect(@carneDeVaca.kcalLipids).to eq(27.9)
		end

		it "Se calcula la cantidad de kilocalorías que producen las proteínas" do
			expect(@carneDeVaca.kcalProtein).to eq(84.4)
		end

		it "Se calcula la cantidad total de kilocalorías del Alimento." do
			expect(@carneDeVaca.kcalTotal).to eq (112.3)
		end
	end

	context "La clase Alimento es Comparable" do

		it "Comparación de igualdad." do
			expect(@carneDeVaca == @pollo).to eq(false)
			expect(@carneDeVaca != @pollo).to eq(true)
		end

		it "Las kilocalorías de la carne de vaca son menores o iguales a las del pollo." do
			expect(@carneDeVaca < @pollo).to eq(true)
			expect(@carneDeVaca <= @pollo).to eq(true)
		end

		it "Las kilocalorías del pollo son mayores o iguales que las de la carne de vaca." do
			expect(@pollo > @carneDeVaca).to eq(true)
			expect(@pollo >= @carneDeVaca).to eq(true)
		end
	end

end

RSpec.describe Plato do

	before :all do
		@carneDeVaca = Alimento.new("Carne de Vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
		@carneDeCordero = Alimento.new("Carne de Cordero", 18.0, 0.0, 17.0, 20.0, 185.0)
		@camarones = Alimento.new("Camarones", 17.6, 1.5, 0.6, 18.0, 2.0)
		@chocolate = Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
		@salmon = Alimento.new("Salmó n", 19.9, 0.0, 13.6, 6.0, 3.7)
		@cerdo = Alimento.new("Cerdo", 21.5, 0.0, 6.3, 7.6, 11.0)
		@pollo = Alimento.new("Pollo", 20.6, 0.0, 5.6, 5.7, 7.1)
		@queso = Alimento.new("Queso", 25.0, 1.3, 33.0, 11.0, 41.0)
		@cerveza = Alimento.new("Cerveza", 0.5, 3.6, 0.0, 0.24, 0.22)
		@lecheDeVaca = Alimento.new("Leche de Vaca", 3.3, 4.8, 3.2, 3.2, 8.9)
		@huevos = Alimento.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7)
		@cafe = Alimento.new("Café ", 0.1, 0.0, 0.0, 0.4, 0.3)
		@tofu = Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2)
		@lentejas = Alimento.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)
		@nuez = Alimento.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9)

		@ListaLaEspañola = List.new
		@ListaLaEspañola.push_tails(@chocolate, @lecheDeVaca, @carneDeCordero)
		@DietaLaEspañola = Plato.new(@ListaLaEspañola,71.6)
		@DietaLaEspañolaImpacto = PlatoImpactoAmbiental.new(@ListaLaEspañola,19.9)

		@ListaLaVasca = List.new
		@ListaLaVasca.push_tails(@chocolate, @chocolate, @lentejas, @cerveza)
		@DietaLaVasca = Plato.new(@ListaLaVasca,48.3)
		@DietaLaVascaImpacto = PlatoImpactoAmbiental.new(@ListaLaVasca,18.9)

		@ListaLaVegetariana = List.new
		@ListaLaVegetariana.push_tails(@chocolate, @tofu, @huevos, @lecheDeVaca)
		@DietaLaVegetariana = Plato.new(@ListaLaVegetariana,50.2)
		@DietaLaVegetarianaImpacto = PlatoImpactoAmbiental.new(@ListaLaVegetariana,16.9)

		@ListaLaVegetaliana = List.new
		@ListaLaVegetaliana.push_tails(@lentejas, @tofu, @nuez, @tofu)
		@DietaLaVegetaliana = Plato.new(@ListaLaVegetaliana,51.2)
		@DietaLaVegetalianaImpacto = PlatoImpactoAmbiental.new(@ListaLaVegetaliana,19)

		@ListaLocuraPorLaCarne = List.new
		@ListaLocuraPorLaCarne.push_tails(@carneDeVaca, @lentejas, @carneDeCordero, @lecheDeVaca)
		@DietaLocuraPorLaCarne = Plato.new(@ListaLocuraPorLaCarne,62.3)
		@DietaLocuraPorLaCarneImpacto = PlatoImpactoAmbiental.new(@ListaLocuraPorLaCarne,27)


		@MenuDietetico = [@DietaLaEspañolaImpacto, @DietaLaVascaImpacto, @DietaLaVegetarianaImpacto, @DietaLaVegetalianaImpacto, @DietaLocuraPorLaCarneImpacto]
	end

	context "Probando la instancia de la clase Plato y su to_s" do

		it "Se puede definir un plato con una lista de alimentos y existe algún nombre." do
			dietaLaEspañola = Plato.new(@ListaLaEspañola, 71.6)
			expect(dietaLaEspañola.platoList.head.to_s).to eq("Chocolate")
		end

		it "Se puede obtener el plato formateado" do
			dietaLaEspañola = Plato.new(@ListaLaEspañola, 71.6)
			expect(dietaLaEspañola.to_s).to eq("Chocolate Leche de Vaca Carne de Cordero ")
		end
	end

	context "Comprobar Clase, Tipo y pertenencia a la jerarquía." do
		it "Jerarquía de la clase Plato." do
			#expect(@DietaLaEspañola.class.ancestors).to eq([Plato, Enumerable, Comparable, Object, Kernel, BasicObject])
		end

		it "Tipo de objeto de Plato" do
			expect((@DietaLaEspañola).is_a?(Plato)).to eq(true)
			expect(@DietaLaEspañola).to be_a_kind_of(Plato)
			expect(@DietaLaEspañola).to respond_to(:platoList)
			expect(@DietaLaEspañola).to respond_to('totalGramos', 'porcentajeProteinas', 'porcentajeLipidos', 'porcentajeHidratosCarbono', 'totalKilocalorias', 'to_s')
		end

		it "Jerarquía de la clase PlatoImpactoAmbiental" do
			#expect(@DietaLaEspañolaImpacto.class.ancestors).to eq([PlatoImpactoAmbiental, Plato, Enumerable, Comparable, Object, Kernel, BasicObject])
		end

		it "Tipo de objeto de PlatoImpactoAmbiental" do
			expect((@DietaLaEspañolaImpacto).is_a?(Plato)).to eq(true)
			expect(@DietaLaEspañolaImpacto).to respond_to('totalGEI', 'totalTerreno', 'totalGEIanual', 'to_s')
		end
	end

	context "Pruebas de calculo de GEI y terreno usado de la clase PlatoImpactoAmbiental" do

		it "Comprueba que se suma la cantidad total de GEI (gases de efecto invernadero) de todas las dietas." do
			expect(@DietaLaEspañolaImpacto.totalGEI).to eq(25.5)
			expect(@DietaLaVascaImpacto.totalGEI).to eq(5.24)
			expect(@DietaLaVegetarianaImpacto.totalGEI).to eq(11.7)
			expect(@DietaLaVegetalianaImpacto.totalGEI).to eq(4.7)
			expect(@DietaLocuraPorLaCarneImpacto.totalGEI).to eq(73.6)
		end

		it "Comprueba que se suma la cantidad total de terreno (m^2/año) ocupado de todas las dietas." do
			expect(@DietaLaEspañolaImpacto.totalTerreno).to eq(197.3)
			expect(@DietaLaVascaImpacto.totalTerreno).to eq(10.42)
			expect(@DietaLaVegetarianaImpacto.totalTerreno).to eq(20.2)
			expect(@DietaLaVegetalianaImpacto.totalTerreno).to eq(15.7)
			expect(@DietaLocuraPorLaCarneImpacto.totalTerreno).to eq(361.3)
		end

		it "Comprueba la cantidad total de GEI anual de todas las dietas." do
			expect(@DietaLaEspañolaImpacto.totalGEIanual).to eq(9307.5)
			expect(@DietaLaVascaImpacto.totalGEIanual).to eq(1912.6)
			expect(@DietaLaVegetarianaImpacto.totalGEIanual).to eq(4270.5)
			expect(@DietaLaVegetalianaImpacto.totalGEIanual).to eq(1715.5)
			expect(@DietaLocuraPorLaCarneImpacto.totalGEIanual).to eq(26864.0)
		end

		it "Se puede obtener la eficiencia energética formateada." do
			expect(@DietaLaVascaImpacto.to_s).to eq("GEI: 5.24 terreno(m^2/día): 10.42")
		end

	end

	context "Calculos relacionados con la información nutricional de los platos" do
		it "Existe un conjunto de cantidades de alimentos." do
			expect(@DietaLaEspañola.totalGramos).to eq(128.6)
		end

		it "Porcentaje de proteínas del conjunto de alimentos." do
			expect(@DietaLaEspañola.porcentajeProteinas).to eq(20.68)
		end

		it "Porcentaje de lípidos del conjunto de alimentos." do
			expect(@DietaLaEspañola.porcentajeLipidos).to eq(39.04)
		end

		it "Porcentaje de hidratos de carbono." do
			expect(@DietaLaEspañola.porcentajeHidratosCarbono).to eq(40.28)
		end

		it "Valor Calórico Total VCT de los Alimentos en Kilocalorías." do
			expect(@DietaLaEspañola.totalKilocalorias).to eq(765.4)
		end
	end

	context "La clase Plato es Comparable." do

		it "Comparació n de igualdad." do
			expect(@DietaLaEspañola == @DietaLaVegetariana).to eq(false)
			expect(@DietaLaEspañola != @DietaLaVegetariana).to eq(true)
		end

		it "Comparació n menor y menor o igual que." do
			expect(@DietaLaEspañola < @DietaLaVasca).to eq(true)
			expect(@DietaLaEspañola <= @DietaLaVasca).to eq(true)
		end

		it "Comparació n mayor y mayor o igual que." do
			expect(@DietaLaEspañola > @DietaLaVasca).to eq(false)
			expect(@DietaLaEspañola >= @DietaLaVasca).to eq(false)
		end
	end

	context "La clase PlatoImpactoAmbiental es Comparable." do

		it "Comparació n de igualdad." do
			expect(@DietaLaEspañolaImpacto == @DietaLaVegetarianaImpacto).to eq(false)
			expect(@DietaLaEspañolaImpacto != @DietaLaVegetarianaImpacto).to eq(true)
		end

		it "Comparació n menor y menor o igual que." do
			expect(@DietaLaEspañolaImpacto < @DietaLaVascaImpacto).to eq(false)
			expect(@DietaLaEspañolaImpacto <= @DietaLaVascaImpacto).to eq(false)
		end

		it "Comparació n mayor y mayor o igual que." do
			expect(@DietaLaEspañolaImpacto > @DietaLaVascaImpacto).to eq(true)
			expect(@DietaLaEspañolaImpacto >= @DietaLaVascaImpacto).to eq(true)
		end
	end

	context "La Clase Plato es Enumerable." do
		it "Pruebas de los metodos each, max, min, select, collect, sort." do
			vec_aux = []
			@DietaLaEspañola.each{ |x| vec_aux.push(x.to_s)}
			expect("#{vec_aux}").to eq("[\"Chocolate\", \"Leche de Vaca\", \"Carne de Cordero\"]")
			expect(@DietaLaVasca.max).to eq(@chocolate)
			expect(@DietaLaVegetariana.min).to eq(@lecheDeVaca)
			expect(@DietaLaVegetaliana.collect{|x| x}).to eq([@lentejas, @tofu, @nuez, @tofu])
			expect(@DietaLocuraPorLaCarne.select{ |x| "" == x.to_s}).to eq([])
			expect(@DietaLaEspañola.sort).to eq([@lecheDeVaca, @carneDeCordero, @chocolate])
		end
	end

	context "Pruebas de comparación entre menús." do
		it "Comparaciones de la valoración nutricional de cada menú." do
			expect(@DietaLaEspañola < @DietaLaVasca).to eq(true)
			expect(@DietaLaEspañola < @DietaLaVegetariana).to eq(true)
			expect(@DietaLaEspañola < @DietaLaVegetaliana).to eq(true)
			expect(@DietaLaEspañola > @DietaLocuraPorLaCarne).to eq(true)
			expect(@DietaLaVasca > @DietaLaVegetariana).to eq(true)
			expect(@DietaLaVasca > @DietaLaVegetaliana).to eq(true)
			expect(@DietaLaVasca > @DietaLocuraPorLaCarne).to eq(true)
			expect(@DietaLaVegetariana < @DietaLaVegetaliana).to eq(true)
			expect(@DietaLaVegetariana > @DietaLocuraPorLaCarne).to eq(true)
			expect(@DietaLaVegetaliana > @DietaLocuraPorLaCarne).to eq(true)
		end

		it "Comparaciones de la eficiencia energética de cada menú." do
			expect(@DietaLaEspañolaImpacto > @DietaLaVascaImpacto).to eq(true)
			expect(@DietaLaEspañolaImpacto > @DietaLaVegetarianaImpacto).to eq(true)
			expect(@DietaLaEspañolaImpacto > @DietaLaVegetalianaImpacto).to eq(true)
			expect(@DietaLaEspañolaImpacto < @DietaLocuraPorLaCarneImpacto).to eq(true)
			expect(@DietaLaVascaImpacto < @DietaLaVegetarianaImpacto).to eq(true)
			expect(@DietaLaVascaImpacto > @DietaLaVegetalianaImpacto).to eq(true)
			expect(@DietaLaVascaImpacto < @DietaLocuraPorLaCarneImpacto).to eq(true)
			expect(@DietaLaVegetarianaImpacto > @DietaLaVegetalianaImpacto).to eq(true)
			expect(@DietaLaVegetarianaImpacto < @DietaLocuraPorLaCarneImpacto).to eq(true)
			expect(@DietaLaVegetalianaImpacto < @DietaLocuraPorLaCarneImpacto).to eq(true)
		end
	end

	context "Pruebas para calcular la huella nutricional de un Plato." do

		it "Calculo del índice de Energía (kcal)" do
			expect(@DietaLaEspañola.indiceEnergia).to eq(2)
		end

		it "Calculo del índice de GEI" do
			expect(@DietaLaEspañolaImpacto.indiceGEI).to eq(3)
		end

		it "Media de los índices de un Plato" do
			expect(@DietaLaEspañolaImpacto.mediaIndices).to eq(2)
		end
		
		it "Conjunto de platos de un menu dietético" do
			menuAux = @MenuDietetico.map{|n| n.mediaIndices}
			media = menuAux.reduce(:+)
			media = media/menuAux.size
			expect(media).to eq(2)
		end
		
		it "Plato con máxima huella nutricional" do
			menuMax = @MenuDietetico.max_by{|n| n.mediaIndices}
			expect(menuMax).to eq(@DietaLaVascaImpacto)
		end

		it "Se Incrementa el precio en proporción del índice con máxima huella nutricional" do
			menuMax = @MenuDietetico.max_by{|n| n.mediaIndices}
			menuIncPrecio = @MenuDietetico.collect{|n| (n.get_precio*menuMax.mediaIndices).round(2)}
			expect(menuIncPrecio).to eq([59.7, 56.7, 50.7, 57, 81])	
		end
	end
end

RSpec.describe PlatoDSL do
	
	context "Pruebas para el DSL" do
		it "Definir un plato" do
			plato = PlatoDSL.new("Hamburguesa") do
				titulo  "Hamburguesa especial"
				alimento        :descripcion => "carne de vaca",
					:gramos => 100
				alimento        :descripcion => "huevo",
					:gramos => 20
			end
			expect(plato.to_s).to eq("Hamburguesa\nHamburguesa especial\n======================\nAlimentos: {:descripcion=>\"carne de vaca\", :gramos=>100}, {:descripcion=>\"huevo\", :gramos=>20}\nCantidad de gramos: 120")
			
		end
	end
end

RSpec.describe MenuDSL do
	context "Pruebas para el DSL del Menú" do
		it "Definir un Menú" do
			menu = MenuDSL.new("Combinado nº. 1") do
				descripcion "hamburguesa, papas, refresco"
				componente  	:descripcion => "Hamburguesa especial de la casa",
					    :precio => 4.25
				componente  :descripcion => "Papas pequeñas",
					    :precio => 1.75
				componente  :descripcion => "Refrescos de lata",
					    :precio => 1.55
				precio	    7.55
			end

			expect(menu.to_s).to eq("Combinado nº. 1\nhamburguesa, papas, refresco\n======================\nComponentes: {:descripcion=>\"Hamburguesa especial de la casa\", :precio=>4.25}, {:descripcion=>\"Papas pequeñas\", :precio=>1.75}, {:descripcion=>\"Refrescos de lata\", :precio=>1.55}\n Precio Total: 7.55")
		end
	end
end

RSpec.describe Node do

	before :all do
		@nodo = Node.new(1,nil,nil)
	end

	it "Debe existir un Nodo de la lista con sus datos, su siguiente y su previo." do
		nodo1 = Node.new(1,nil,nil)
		nodo2 = Node.new(2,nodo1,nil)
		nodo3 = Node.new(3,nodo1,nodo2)
	end

	it "Prueba de la función to_s de Node" do
		expect(@nodo.to_s).to eq("1")
	end

end

RSpec.describe List do
	before :all do
		@list = List.new
		@list2 = List.new
		@list2.push_heads(3, 7, 2, 1, 9, 4)
		@pollo = Alimento.new("Pollo", 20.6, 0.0, 5.6, 5.7, 7.1)
		@cerdo = Alimento.new("Cerdo", 21.5, 0.0, 6.3, 7.6, 11.0)
		@huevo = Alimento.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7)
		@list3 = List.new
		@list3.push_heads(@pollo, @cerdo, @huevo)
	end
	context "Se pueden insertar y extraer elementos de la lista." do
		it "Se puede insertar un elemento a la lista por la cabeza." do
			@list.push_head(1)
			@list.push_head(2)
			expect(@list.to_s).to eq("2 1 ")
		end

		it "Se puede insertar un elemento a la lista por la cola." do
			@list.push_tail(3)
			expect(@list.to_s).to eq("2 1 3 ")
		end

		it "Se pueden insertar varios elementos a la lista por la cabeza." do
			@list.push_heads(4, 5)
			expect(@list.to_s).to eq("5 4 2 1 3 ")
		end

		it "Se pueden insertar varios elementos a la lista por la cola." do
			@list.push_tails(7, 8)
			expect(@list.to_s).to eq("5 4 2 1 3 7 8 ")
		end

		it "Se puede extraer un elemento de la cabeza." do
			@list.pop_head
			expect(@list.to_s).to eq("4 2 1 3 7 8 ")
		end

		it "Se puede extraer un elemento de la cola." do
			@list.pop_tail
			expect(@list.to_s).to eq("4 2 1 3 7 ")
		end
	end

	context "La Lista es Enumerable" do

		it "Puede usarse el método each" do
			vec_aux = []
			@list2.each{ |x| vec_aux.push(x)}
			expect("#{vec_aux}").to eq("[4, 9, 1, 2, 7, 3]")
		end

		it "Pruebas para los métodos max, min, select, collect y sort." do
			expect(@list2.max).to eq(9)
			expect(@list2.min).to eq(1)
			expect(@list2.collect{|x| x}).to eq([4, 9, 1, 2, 7, 3])
			expect(@list2.select{|x| x == 2}).to eq([2])
			expect(@list2.sort).to eq([1, 2, 3, 4, 7, 9])
		end
	end

	context "Pruebas de Enumerable con elementos de la clase Alimento." do

		it "Pruebas de los métodos each, max, min, select, collect y sort." do
			vec_aux = []
			@list3.each{ |x| vec_aux.push(x.to_s)}
			expect("#{vec_aux}").to eq("[\"Huevos\", \"Cerdo\", \"Pollo\"]")
			expect(@list3.max).to eq(@huevo)
			expect(@list3.min).to eq(@pollo)
			expect(@list3.collect{|x| x}).to eq([@huevo, @cerdo, @pollo])
			expect(@list3.select{ |x| "Pollo" == x.to_s}).to eq([@pollo])
			expect(@list3.sort).to eq([@pollo, @cerdo, @huevo])
		end
	end
end
