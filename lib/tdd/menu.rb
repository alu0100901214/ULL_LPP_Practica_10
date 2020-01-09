
class MenuDSL
	
	attr_accessor :nombre

	def initialize(nombre, &block)
		@nombre = nombre
		@descripcion = ""
		@componente = []
		@precio = 0
		if block_given?
			if block.arity == 1
				yield self
			else
				instance_eval(&block)
			end
		end
	end

	def descripcion(val)
		@descripcion = val
	end

	def precio(val)
		@precio = val
	end

	def componente(val, options = {})
		comp = val
		comp << " (#{options[:descripcion]})" if options[:descripcion]
		comp << " (#{options[:precio]})" if options[:precio]
		@componente << comp
	end
	
	def to_s
		output = @nombre
		output << "\n#{@descripcion}"
		output << "\n======================\n"
		output << "Componentes: #{@componente.join(', ')}"
		output << "\n Precio Total: #{@precio}"
	end

end
