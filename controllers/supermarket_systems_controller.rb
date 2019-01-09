require_relative '../models/register_system'
require_relative '../models/client'
require_relative '../models/queue_system'
require_relative '../models/supermarket_system'

class SupermarketSystemController

    def initialize(queue_quantity, registers_quantity)
        create_supermarket_system(queue_quantity, registers_quantity)
    end

    def assign_client_to_emptiest_queue(client)
        queue_index = @supermarket_system.assign_client_to_emptiest_queue(client)
        return queue_index
    end

    def get_empty_register(register_index)
        queue_quantity = @supermarket_system.get_queue_quantity()
        registers_quantity = @supermarket_system.get_registers_quantity()

        # used for the single queue system
        if queue_quantity != registers_quantity
            (0..registers_quantity-1).each do |i|
                empty_register = @supermarket_system.get_empty_register(i)

                if empty_register != nil
                    return empty_register
                elsif (empty_register == nil) and (i == registers_quantity-1)
                    return nil
                end
            end 
        # used for the multiple queue system
        else
            @supermarket_system.get_empty_register(register_index)    
        end
    end

    def empty_register(register_index)
        @supermarket_system.empty_register(register_index)
    end

    def assign_client_to_empty_register(empty_register_index)
        queue_quantity = @supermarket_system.get_queue_quantity()
        registers_quantity = @supermarket_system.get_registers_quantity()

        if queue_quantity != registers_quantity
            assign_client_to_empty_register_single_system(empty_register_index)
        else
            assign_client_to_empty_register_multiple_system(empty_register_index)
        end
    end

    def assign_client_to_empty_register_multiple_system(empty_register_index)
        client_to_assign = @supermarket_system.remove_first_client_from_queue(
                                                            empty_register_index)
        
        if(client_to_assign == nil)
            return nil
        else
            @supermarket_system.assign_client_to_empty_register(
                                        empty_register_index ,client_to_assign)
            
            return client_to_assign
        end
    end

    def assign_client_to_empty_register_single_system(empty_register_index)
        client_to_assign = @supermarket_system.remove_first_client_from_queue(0)
    
        if(client_to_assign == nil)
            return nil
        else 
            @supermarket_system.assign_client_to_empty_register(
                                        empty_register_index,client_to_assign)

            return client_to_assign
        end
    end

    def get_client_register_time(register_index)
        @supermarket_system.get_client_register_time(register_index)
    end

    def get_supermarket_system
        @supermarket_system.get_supermarket_system()
    end

    private

    def create_supermarket_system(queue_quantity, cash_register_quantity)
        queue_system = QueueSystem.new(queue_quantity);
        cash_register_system = RegisterSystem.new(cash_register_quantity)

        @supermarket_system = SupermarketSystem.new(cash_register_system, queue_system)
    end

end
