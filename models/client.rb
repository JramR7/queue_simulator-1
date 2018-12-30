class Client

    def initialize(name, time_of_arrival, time_in_cash_register)
        @name = name;
        @time_of_arrival = time_of_arrival;
        @time_in_cash_register = time_in_cash_register;
    end

    def get_spended_time
        return @time_in_cash_register
    end
end

