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
end
