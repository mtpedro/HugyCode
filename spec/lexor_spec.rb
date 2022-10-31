require 'lexor'

RSpec.describe Hugycode, '#methods' do
	context 'running lexor on code with two seperate methods' do
		it 'should return four seperated methods' do
			code = Hugycode.new 'examples/variables.hugy'
			code.parse
			expect(code.methods.length).to eq 2
		end
	end	

	context 'running lexor on code with comments' do
		it 'should only return code (not comments)' do
			code = Hugycode.new 'examples/comments.hugy'
			code.parse
			expect(code.methods.length).to eq 1
		end
	end	
end
