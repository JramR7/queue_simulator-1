require_relative '../modules/random_generator'
require_relative '../models/client'

class ClientsController
    include RandomGenerator

    def create_client(time_of_arrival)
        
        @time_in_cash_register = random_number(4, 25)
        @name_letter = random_letter()
        
        # a client can have any letter except the 'c'
        while @name_letter == 'c'
            @name_letter = random_letter()
        end

        client = Client.new(@name_letter, time_of_arrival, @time_in_cash_register)
        
        return client
    end
    
end
