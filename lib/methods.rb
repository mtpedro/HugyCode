class String
  def is_integer?
    self.to_i.to_s == self
  end
end

module Methods
	def variable line
		name = String.new
		value = String.new 

		chars = line.split('')

		n=1
		until chars[n] == '=' do 
			name << chars[n]
			n+=1 
		end
		n+=1
		
		(n..(chars.length-1)).each do |i|
			value << chars[i]
		end

		if value.is_integer? == true
			return {name.to_sym => value.to_i} 
		end

		return {name.to_sym => value}
	end

	def print(line, memory)
		value = String.new

		chars = line.split('')
	
		if chars[1] == '$'
			name = String.new
			(2..(chars.length-1)).each do |i|
				name << chars[i] 
			end
			return lookup(memory, name.to_sym)
		else
			(1..(chars.length-1)).each do |i|
				value << chars[i] 
			end
		end
		return value
	end


	private

	def lookup(memory, key)
		if memory.has_key?(key) != true
			return nil
		end

		return memory[key]
	end
end
