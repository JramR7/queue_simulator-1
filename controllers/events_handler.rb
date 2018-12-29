class EventsHandler

    def leave_cash_register(cash_register_index, actual_time)

        @supermarket_system_controller.empty_cash_register(cash_register_index)

        
    end

    def enter_cash_register(cash_register_index, actual_time)

        client_assigned = @supermarket_system_controller.assign_client_to_empty_cash_register()
        
        if(client_assigned != nil){
            delta_time = @supermarket_system_controller.get_spended_time_of_client(cash_register_index)
            @event_queue.push([actual_time + delta_time, "leave_cash_register_event", cash_register_index])
            @event_queue.push([actual_time + delta_time, "enter_cash_register_event", cash_register_index])
        }
    end


    def client_creation(actual_time)
        number_of_clients = get_random_number_between(0,5)
        for i in 0..number_of_clients
            client = @client_controller.create_client()
            index_empty_cash = @supermarket_system_controller.add_client_to_emptiest_queue(client)
            if(index_empty_cash != nil)
                enter_cash_register(index_empty_cash, actual_time)
            end
        end
    end

    def get_random_number_between(low, high)
        random = Random.new
        random_letter_num = random.rand(low..high)
    end

end