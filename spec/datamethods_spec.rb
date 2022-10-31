require 'datamethods'

include Methods

RSpec.describe Methods, '#variable' do
	context 'single letter variables' do
		it 'should return a hash with :a = > 45' do
			res = Methods.newvariable "$a=45"
			expected = [:a, 45]
			expect(res).to eq expected
		end
	end

	context 'multi-letter variables' do
		it 'should return a hash with :var => 45' do
			res = Methods.newvariable "$var=45"
			expected = [:var, 45]
			expect(res).to eq expected
		end
	end

	context 'string variables' do
		it 'should return a hash with :var => "HUGY"' do
			res = Methods.newvariable "$var=HUGY"
			expected = [:var, "HUGY"]
			expect(res).to eq expected
		end
	end
end

RSpec.describe Methods, '#print' do
	context 'printing a string litteral' do
		it 'should return a text to print' do
			memory = {:name => "Hugy"}
			res = Methods.hugyprint memory, ":Hugy"
			expected = "Hugy"
			expect(res).to eq expected
		end
	end

	context 'printing a variable' do
		it 'should return the string value of the variable' do
			memory = {:name => "Hugy"}
			res = Methods.hugyprint memory, ':$name'
			expected = "Hugy"
			expect(res).to eq expected
		end
	end
end

RSpec.describe Methods, '#maths' do
	context 'addition' do
		it 'returns the sum of two numbers' do
			line = '*$a[4+2]'
			res = Methods.maths(line)
			expected = [:a, 6]
			expect(res).to eq expected
		end
	end

	context 'subtraction' do
		it 'returns on number subtracted from another' do
			line = '*$a[4-2]'
			res = Methods.maths(line)
			expected = [:a, 2]
			expect(res).to eq expected
		end
	end

	context 'multiplication' do
		it 'returns the product of two numbers' do
			line = '*$a[4*2]'
			res = Methods.maths(line)
			expected = [:a, 8]
			expect(res).to eq expected
		end
	end

	context 'division' do
		it 'returns the quotient of two numbers' do
			line = '*$a[4/2]'
			res = Methods.maths(line)
			expected = [:a, 2]
			expect(res).to eq expected
		end
	end

	context 'brackets' do
		it 'solves equation with bedmaths' do
			line = '*$a[40/(5+3)]'
			res = Methods.maths(line)
			expected = [:a, 5]
			expect(res).to eq expected
		end
	end

	context 'exponents' do
		it 'raises a number to a power' do
			line = '*$a[20^2]'
			res = Methods.maths(line)
			expected = [:a, 400]
			expect(res).to eq expected
		end
	end
end