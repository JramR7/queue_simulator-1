class CashRegisterSystem
    
    def initialize(cash_register_quantity)
        @cash_register_quantity = cash_register_quantity
        
        self.create_cash_register_system();
    end

    def get_empty_cash_register
        @cash_register_system.each_with_index do |cash_register, index_cash_register|
            if cash_register.empty?
                return index_cash_register
            else 
                return nil
            end
        end
    end
    #me parece innecesaria esta funcion, con la de arriba es suficiente
    def check_cash_register_empty(index_cash_register)
        if @cash_register_system[index_cash_register].empty?
            return true
        else
            return false
        end
    end

    def create_cash_register_system
        @cash_register_system = Array.new(@cash_register_quantity) {Array.new(0)}
    end

    def add_client_to_register(cash_register_index, client)
        @cash_register_system[cash_register_index].push(client)
    end

    def remove_client_from_register(cash_register_index)
        @cash_register_system[cash_register_index].pop()
    end

    def get_cash_register_quantity
        return @cash_register_quantity
    end

    def get_spent_time_client(cash_register_index)
        return @cash_register_system[cash_register_index][0].get_spent_time()
    end

    def print_
        print(@cash_register_system)
    end
end
