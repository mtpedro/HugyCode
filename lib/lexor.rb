class Hugycode
	attr_reader :methods

	def initialize path
		@methods = Array.new;
		@code = String.new;

		file = File.foreach(path) do |line|
			usablecode = commentcheck(line)
			if usablecode != String.new
				@code << usablecode.strip
			end
		end
	end

	def parse
		@methods = @code.split(';') 
	end

	private

	def commentcheck(line) # checks for comments
		chars = line.split('')
		usablecode = String.new

		chars.each do |c|
			if c == "#"
				return usablecode
			end
			usablecode << c
		end
		return usablecode
	end
end

# Lexor should return seperate methods 
# so the interperator can run them one by one

# methods are seperated by semi-colons so 
# that when the interperator faces
# code like this: $a=10;$b=20, it will 
# first create variable $a and the 
# variable $b

# the lexor also filters out comments
# this will make binaries smaller for
# compiler.