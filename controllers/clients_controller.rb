class ClientsController

    def initialize()
        @random = Random.new 
    end

    def create_client(time_of_arrival)
        random_letter_num = @random.rand(1..26)
        time_in_cash_register = @random.rand(4..45)
        @time_in_cash_register = time_in_cash_register
        @name_letter = (random_letter_num+96).chr

        client = Client.new(@name_letter, time_of_arrival, @time_in_cash_register)
        
        return client
    end
end