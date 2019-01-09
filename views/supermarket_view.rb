require_relative '../modules/queue_operations'

class SupermarketView
    include QueueOperations

    #Recibe como parámetro una matriz (que debe tener el formato que se muestra en el ejemplo al final de este documento) y la muestra por consola
    def initialize(supermarket_system_array, actual_time)
        @queue_system_array = supermarket_system_array[0]
        @register_system_array = supermarket_system_array[1]
        @actual_time = actual_time
    end

    def print_queues
        max_queue_length = max_queue_length(@queue_system_array)

        (0..max_queue_length).each do |client_position|
            @queue_system_array.each do |queue|               
                client = queue[client_position]

                if client != nil
                    print " |", queue[client_position].get_name(), "| "
                end    
            end
            print "\n"
        end
    end

    def print_registers
        register_quantity = @register_system_array.length

        (0..register_quantity-1).each do |i|
            print " |C| "
        end
        print "\n"
        
        @register_system_array.each do |register|
            if register.any? == true
                print "  ", register[0].get_name(), "  "
            end
        end
        print "\n"
    end       

    def print_actual_system
        print "Simulation time (minutes): ", @actual_time, "\n"
        
        print_registers()
        print "\n"

        print_queues()
        print "\n"
    end
end
