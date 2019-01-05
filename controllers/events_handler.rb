require 'pqueue'
require_relative 'clients_controller'
require_relative 'supermarket_systems_controller'
require_relative '../modules/random_generator'

class EventsHandler
    include RandomGenerator

    def initialize(simulation_end_time, delay_per_iteration)
        @client_creation_time = 3
        @simulation_end_time = simulation_end_time
        
        @supermarket_controller = SupermarketSystemController.new(2, 2)
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

    def start_simulation
        while true
            actual_event = @event_queue.pop()
            run_event(actual_event)
        end
    end

    def run_event(event)    
        case event[1]

            when "print_event"
                @supermarket_controller.print_()
                puts '\n'

            when "client_creation_event"
                client_creation(event[0])

            when "leave_register_event"
                leave_register(event[2], event[0])

            when "enter_register_event"
                enter_register(event[2], event[0])

            when "end_simulation_event"
                exit(true)
        end
    end

    def leave_register(register_index, actual_time)
        @supermarket_controller.empty_register(register_index)
    end

    def enter_register(register_index, actual_time)

        client_assigned = @supermarket_controller.assign_client_to_empty_register(
                                                                    register_index)
        if(client_assigned != nil)
            register_time = @supermarket_controller.get_client_register_time(
                                                                register_index)

            @event_queue.push([actual_time + register_time, "leave_register_event",
                                                                 register_index])
            @event_queue.push([actual_time + register_time, "enter_register_event",
                                                                 register_index])
        end
    end

    def client_creation(actual_time)
        number_of_clients = random_number(0, 5)
       
        (0..number_of_clients-1).each do |i|
            client = @client_controller.create_client(actual_time)
            
            client_queue = @supermarket_controller.assign_client_to_emptiest_queue(
                                                                            client)                                                                                                                                                    
            empty_register = @supermarket_controller.get_empty_register(
                                                            client_queue)  
            if(empty_register != nil)
                enter_register(empty_register, actual_time)
            end
        end
    end

end

eh = EventsHandler.new(5,10)

eh.start_simulation()