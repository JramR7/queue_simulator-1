class Client

    attr_reader :name, :time_of_arrival, :time_in_register, :time_in_queue

    def initialize(name, time_of_arrival, time_in_register)
        @name = name;
        @time_of_arrival = time_of_arrival;
        @time_in_register = time_in_register;
        @time_in_queue = 0
    end
    
    def update_time_queue
        @time_in_queue += 1
    end

end

