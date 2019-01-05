class Client

    def initialize(name, time_of_arrival, time_in_register)
        @name = name;
        @time_of_arrival = time_of_arrival;
        @time_in_register = time_in_register;
    end

    def get_register_time
        return @time_in_register
    end
end

