

Node = Struct.new(:value, :next, :prev) do
	# Método que devuelve el Nodo formateado en un String.
	# @return [String] Devuelve el valor del nodo.
	def to_s
		string = ""
		string += "#{value}"
	end
end

# @author Sergio González Guerra
class List
	
	include Enumerable

	attr_accessor :head, :tail
	
	# Clase que define una Lista
	def initialize
		@head = nil
		@tail = nil
		@size = 0
	end
	
	# Método que devuelve el tamaño de la lista.
	# @return [Int] Devuelve el tamaño de la lista.
	def get_size
		@size
	end
	
	# Método que inserta por la cabeza un elemento.
	# @param val [Int] Valor a insertar.
	def push_head(val)
		if(is_empty)
			node = Node.new(val,nil,nil)
			@head = node
			@tail = node
		end

		if(!is_empty)
			node = Node.new(val,@head,nil)
			@head.prev = node
			@head = node
		end
		@size += 1
	end
	
	# Método que inserta por la cola un elemento.
	# @param val [Int] Valor a insertar.
	def push_tail(val)
		if(is_empty)
			node = Node.new(val,nil,nil)
			@head = node
			@tail = node
		end
		if(!is_empty)
			node = Node.new(val,nil,@tail)
			@tail.next = node
			@tail = node
		end
		@size += 1
	end
	
	# Método que inserta varios elementos por la cabeza.
	# @param val [Int] Valores a insertar.
	def push_heads(*vals)
		vals.each do |x|
			push_head(x)
		end
	end
	
	# Método que inserta varios elementos por la cola.
	# @param val [Int] Valores a insertar.
	def push_tails(*vals)
		vals.each do |x|
			push_tail(x)
		end
	end
	
	# Método que elimina un elemento por la cabeza.
	def pop_head
		if(!is_empty)
			node = @head
			@head = node.next
			@head.prev = nil
			@size -= 1
		end
	end
	
	# Método que elimina un elemento por la cola.
	def pop_tail
		if(!is_empty)
			node = @tail
			@tail = node.prev
			@tail.next = nil
			@size -= 1
		end
	end
	
	# Método que comprueba si la lista está vacía.
	# @return [Bool] devuelve true o false según la lista este vacía o no.
	def is_empty
		if(@size <= 0)
			return true
		end
		return false
	end
	
	# Método each para usar los métodos del módulo Enumerable.
	def each
		node = @head
		while node != nil
			yield node.value
			node = node.next
		end	
	end
	
	# Método to_s de la lista.
	# @return [String] Devuelve un string con la lista.
	def to_s
		string = ""
		node = @head
		i = 0
		while (node != nil) do
			string = string + node.to_s + " "
			node = node.next
		end

		string
	end

end
