OPTIONS = [
	'-help',
	'-i',
]

OPTIONS_EX = [
	'usage: ruby hugy.rb -i <file name>',
	'',
	'-help: show this help menu',
]

def help
	OPTIONS_EX.each {|o| puts o}
end
