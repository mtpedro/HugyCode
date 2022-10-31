load 'lib/interperetor.rb'
load 'lib/lexor.rb'

case ARGV[0]
    when '-i'
        code = Hugycode.new(ARGV[1])
        interperate(code.parse)
    else 
        puts "unrecognised input: #{ARGV[0]}"
end