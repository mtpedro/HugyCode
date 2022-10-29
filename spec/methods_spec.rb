require 'methods'

include Methods

RSpec.describe Methods, '#variable' do
	context 'single letter variables' do
		it 'should return a hash with :a = > 45' do
			res = Methods.variable "$a=45"
			expected = {:a => 45}
			expect(res).to eq expected
		end
	end

	context 'multi-letter variables' do
		it 'should return a hash with :var => 45' do
			res = Methods.variable "$var=45"
			expected = {:var => 45}
			expect(res).to eq expected
		end
	end

	context 'string variables' do
		it 'should return a hash with :var => "HUGY"' do
			res = Methods.variable "$var=HUGY"
			expected = {:var => "HUGY"}
			expect(res).to eq expected
		end
	end
end
