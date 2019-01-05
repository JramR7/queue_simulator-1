class SupermarketSystem

    def initialize(register_system, queue_system)
        @register_system = register_system
        @queue_system = queue_system
    end

    def empty_register(register_index)
        @register_system.remove_client_from_register(register_index)
    end

    def assign_client_to_emptiest_queue(client)
        queue_index = @queue_system.get_emptiest_queue()
        @queue_system.assign_client_to_queue(queue_index, client)
        return queue_index
    end

    def remove_first_client_from_queue(queue_index)
        removed_client = @queue_system.remove_client_from_queue(queue_index)
        return removed_client
    end

    def assign_client_to_empty_register(empty_register, client_to_assign)
        @register_system.assign_client_to_register(empty_register,
                                                     client_to_assign)
    end

    def get_empty_register(register_index)
        return @register_system.get_empty_register(register_index)
    end

    def get_client_register_time(register_index)
        return @register_system.get_client_register_time(register_index)
    end

    def get_queue_quantity
        return @queue_system.get_queue_quantity()
    end

    def get_registers_quantity
        return @register_system.get_registers_quantity() 
    end

    def print_
        @register_system.print_()
        @queue_system.print_() 
    end
end


