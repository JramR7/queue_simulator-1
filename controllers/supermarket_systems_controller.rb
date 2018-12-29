require_relative '../models/cash_register_system'
require_relative '../models/client'
require_relative '../models/queue_system'
require_relative '../models/supermarket_system'

class SupermarketSystemController

    def initialize(queue_quantity, cash_register_quantity)
        create_supermarket_system(queue_quantity, cash_register_quantity)
    end

    def add_client_to_emptiest_queue(client)
        index_queue = @supermarket_system.add_client_to_emptiest_queue(client)

        if(@supermarket_system.get_queue_quantity() != @supermarket_system.get_cash_register_quantity())
            return get_empty_cash_register()
        elsif
            if(check_cash_register_empty(index_queue))
                return index_queue
            end
            return nil
        end
    end

    def get_empty_cash_register()
        empty_cash_register = @supermarket_system.get_empty_cash_register()

        return empty_cash_register
    end
    
    def check_cash_register_empty(index_cash_register)
        return @supermarket_system.check_cash_register_empty(index_cash_register)
    end

    def empty_cash_register(cash_register_index){
        @supermarket_system.empty_cash_register(cash_register_index)
    }


    def assign_client_to_empty_cash_register(empty_cash_register){
        if(@supermarket_system.get_queue_quantity() != @supermarket_system.get_cash_register_quantity())
            assign_client_to_empty_cash_register_single_system(empty_cash_register)
        elsif
            assign_client_to_empty_cash_register_multiple_system(empty_cash_register)
        end
    }

    def assign_client_to_empty_cash_register_multiple_system(empty_cash_register)
        client_to_assign = @supermarket_system.remove_first_client_from_queue(empty_cash_register)
        if(client_to_assign == nil){
            return nil
        }

        @supermarket_system.assign_client_to_empty_cash_register(empty_cash_register,client_to_assign)

        return client_to_assign
    end

    def assign_client_to_empty_cash_register_single_system(empty_cash_register)
        client_to_assign = @supermarket_system.remove_first_client_from_queue(0)
        if(client_to_assign == nil){
            return nil
        }

        @supermarket_system.assign_client_to_empty_cash_register(empty_cash_register,client_to_assign)

        return client_to_assign
    end

    def print_
        @supermarket_system.print_()
    end

    private

    def create_supermarket_system(queue_quantity, cash_register_quantity, system_type)
        queue_system = QueueSystem.new(queue_quantity);
        cash_register_system = CashRegisterSystem.new(cash_register_quantity)

        @supermarket_system = SupermarketSystem.new(cash_register_system, queue_system)
    end

end

