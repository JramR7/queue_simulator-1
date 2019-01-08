require_relative '../modules/input_validator'

class DataCapture
    include InputValidator

    attr_reader :registers_quant, :queue_quant, :simulation_time, :delay_time

    #Este método interactúa por consola con el usuario, actualizando el valor de los atributos con los datos ingresados por el usuario
    def data_capture
        begin
            print "\nIngrese el número de cajas registradoras que tendrá su supermercado: "
            
            registers_input = gets.chomp
            validated_input = input_integer_validation(registers_input)

         end while validated_input == false
        
        begin
            puts "\nIngrese el número de colas que tendrá su supermercado:"
            
            queues_input = gets.chomp
            validated_input = input_integer_validation(queues_input)
         
        end while validated_input == false

        begin
            puts "\nIngrese el número de minutos que se deben simular."
            
            simulation_time_input = gets.chomp
            validated_input = input_integer_validation(simulation_time_input)

        end while validated_input == false

        begin
            puts "\nIngrese el tiempo (en segundos) que debe esperar la simulación después de cada iteración antes de continuar a la siguiente."
            
            delay_time_input = gets.chomp
            validated_input = input_integer_validation(delay_time_input)
        
        end while validated_input == false
    end
end
