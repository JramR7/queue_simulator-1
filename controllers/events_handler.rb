require 'pqueue'
require_relative 'clients_controller'
require_relative 'supermarket_systems_controller'

class EventsHandler
    def initialize(simulation_end_time, delay_per_iteration)
        @random = Random.new
        @client_creation_time = 3
        @simulation_end_time = simulation_end_time
        @supermarket_system_controller = SupermarketSystemController.new(1,2)
        @client_controller = ClientsController.new()
        event_queue_initialize()
    end

    def event_queue_initialize
        @event_queue = PQueue.new([]){ |a,b| a[0] < b[0] }
        
        (0..@simulation_end_time).each do |time|
            @event_queue.push([time, "print_event"])
            
            if (time % @client_creation_time) == 0
                @event_queue.push([time, "client_creation_event"])
            end

            if time == @simulation_end_time
                @event_queue.push([time, "end_simulation_event"])
            end
        end

    end

    def run_simulation_events
        while true
            run_event(@event_queue.pop())
        end
    end

    def run_event(event)
        
        case event[1]
            when "print_event"
                @supermarket_system_controller.print_()
                puts '\n'
            when "client_creation_event"
                client_creation(event[0])
            when "leave_cash_register_event"
                leave_cash_register(event[2], event[0])
            when "enter_cash_register_event"
                enter_cash_register(event[2], event[0])
            when "end_simulation_event"
                exit(true)
        end
    end
    def leave_cash_register(cash_register_index, actual_time)
        @supermarket_system_controller.empty_cash_register(cash_register_index)
    end

    def enter_cash_register(cash_register_index, actual_time)

        client_assigned = @supermarket_system_controller.assign_client_to_empty_cash_register(cash_register_index)
        
        if(client_assigned != nil)
            delta_time = @supermarket_system_controller.get_spended_time_of_client(cash_register_index)
            @event_queue.push([actual_time + delta_time, "leave_cash_register_event", cash_register_index])
            @event_queue.push([actual_time + delta_time, "enter_cash_register_event", cash_register_index])
        end
    end


    def client_creation(actual_time)
        number_of_clients = get_random_number_between(0,5)
        for i in 0..number_of_clients
            client = @client_controller.create_client(actual_time)
            index_empty_cash = @supermarket_system_controller.add_client_to_emptiest_queue(client)
            if(index_empty_cash != nil)
                enter_cash_register(index_empty_cash, actual_time)
            end
        end
    end

    def get_random_number_between(low, high)
        random_letter_num = @random.rand(low..high)
    end

end

eh = EventsHandler.new(50,10)

eh.run_simulation_events()