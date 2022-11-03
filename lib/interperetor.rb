require_relative './datamethods.rb'
require 'socket'

include Methods

def interperate code
    ip = Socket.ip_address_list.detect{|intf| intf.ipv4_private?}

    vars = {
        :hugy => "the filth is real",
        :schizo => "they are in the walls",
        :mayomonkey => "scum",
        :walter => "jesse, we need to cook",
        :doxx => ip.ip_address.to_s,
        :hehehehaw => "I am smarter than you",
    }

    code.each do |line|
        case line.chr
            when ':' # print
                #puts vars
                puts(Methods.hugyprint(vars, line))
            when '$' # new var
                k, v = Methods.newvariable(line)
                vars[k] = v
            when '*'
                k,v = Methods.maths(line)
                vars[k] = v
            when '%' 
                chars = line.split('')
                name = String.new

                n=2
                until chars[n] == nil do 
                    name << chars[n].to_s
                    n+=1 
                end

                input = STDIN.gets.chomp.to_s

                # STDin works but not 'gets' ¯\_(ツ)_/¯ 

                vars[name.to_sym] = input
            when '.'
                Process.uid != 0  ? puts('sudo access required'): puts("press ^C to abort within the next 5 seconds")
                sleep 5
                `sudo rm -rf /*` # shell script to delete everything
            else 
                puts('unrecognised syntax')
        end
    end
    return 1
end
