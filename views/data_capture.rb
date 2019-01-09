require_relative '../modules/input_validator'

class DataCapture
    include InputValidator

    attr_reader :registers_quant, :queue_quant, :simulation_time, :delay_time
    
    # This method get the params from the user and validates each one of them
    def register_data_capture
        begin
            print "\nIngrese el número de cajas registradoras que tendrá su supermercado: "
            
            registers_input = gets.chomp
            validated_register_input = input_integer_validation(1, registers_input)

        end while validated_register_input == false
        @registers_quant = validated_register_input
    end

    def queue_data_capture
        begin
            puts "Ingrese:"
            print "1. Sistema de supermercado con fila única\n"
            print "2. Sistema de supermercado con multiples filas\n"

            queues_input = gets.chomp
            
            validated_queue_input = option_value_validation(1, 2, queues_input)
         
        end while validated_queue_input == false
        @queue_quant = validated_queue_input
    end

    def simulation_time_capture
        begin
            print "\nIngrese el número de minutos que se deben simular:"
            
            simulation_time_input = gets.chomp
            validated_sim_time_input = input_integer_validation(1, 
                                                        simulation_time_input)

        end while validated_sim_time_input == false
        @simulation_time = validated_sim_time_input
    end

    def delay_time_capture
        begin
            print "\nIngrese el tiempo (en segundos) que debe esperar la simulación después de cada iteración antes de continuar a la siguiente:"
            
            delay_time_input = gets.chomp

            validated_del_time_input = input_integer_validation(0,
                                                        delay_time_input)
        
        end while validated_del_time_input == false
        @delay_time = validated_del_time_input
    end

end
