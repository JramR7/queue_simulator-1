class RegisterSystem
    
    def initialize(registers_quantity)
        @registers_quantity = registers_quantity
        
        if @registers_quantity > 0
            self.create_register_system()
        else
            puts "Error: You cannot create a register system with 0 registers"
        end
    end

    def create_register_system
        @register_system = Array.new(@registers_quantity) {Array.new(0)}
    end

    def assign_client_to_register(register_index, client)
        @register_system[register_index].push(client)
    end

    def remove_client_from_register(register_index)
        @register_system[register_index].pop()
    end

    def get_empty_register(register_index)
        register = @register_system[register_index]
        
        if register.empty?
            return register_index
        else
            return nil
        end
    end

    def get_registers_quantity
        return @registers_quantity
    end

    def get_client_register_time(register_index)
        client =  @register_system[register_index][0]
        return client.time_in_register
    end

    def get_register_system
        return @register_system
    end

end
