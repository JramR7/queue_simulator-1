class CashRegisterSystem
    
    def initialize(cash_register_quantity)
        @cash_register_quantity = cash_register_quantity
        
        self.create_cash_register_system();
    end

    def get_empty_cash_register
        index_cash_register = 0
        @cash_register_system.each do |cash_register|
            if(cash_register.empty?)
                return index_cash_register
            end
            index_cash_register += 1
        end
        return nil
    end

    def check_cash_register_empty(index_cash_register)
        if(@cash_register_system[index_cash_register].empty?)
            return true
        end
        return false
    end

    def create_cash_register_system
        @cash_register_system = Array.new(@cash_register_quantity) {Array.new(0)}
    end

    def add_client_to_cash_register(cash_register_index, client)
        @cash_register_system[cash_register_index].push(client)
    end

    def remove_client_of_register(cash_register_index)
        @cash_register_system[cash_register_index].pop()
    end

    def get_cash_register_quantity
        return @cash_register_quantity
    end

    def get_spended_time_of_client(cash_register_index)
        return @cash_register_system[cash_register_index][0].get_spended_time()
    end

    def print_
        print(@cash_register_system)
    end
end
