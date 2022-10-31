require_relative './datamethods.rb'

include Methods

def interperate code
    vars = {
        :hugy => "the filth is real",
        :schizo => "they are in the walls",
        :mayomonkey => "scum"
    }
    code.each do |line|
        case line.chr
            when ':' # print
                #puts vars
                puts(Methods.hugyprint(vars, line))
            when '$' # new var
                k, v = Methods.newvariable(line)
                vars[k] = v
            when '&' # loop
                chars = line.split('')
                iterations = String.new
                i = 1
                until chars[i] == '.'
                    iterations << chars[i]
                    i+=1
                end
                if iterations == String.new
                    return 0, line
                end
            when '*'
                k,v = Methods.maths(line)
                vars[k] = v
            else 
                puts('unrecognised input')
        end
    end
    return 1
end
