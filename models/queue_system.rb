class QueueSystem
    
    def initialize(queue_quantity)
        @queue_quantity = queue_quantity

        if @queue_quantity > 0
            self.create_queue_system()
        else
            puts "Error: You cannot create a queue system with 0 queues"
        end
    end

    def create_queue_system
        @queue_system = Array.new(@queue_quantity) {Array.new()}
    end

    def get_queue_quantity
        return @queue_quantity
    end

    def get_emptiest_queue
        emptiest_queue_index = 0;
        minimum_length = @queue_system[0].length
        
        @queue_system.each_with_index do |queue, i|
            if minimum_length > queue.length
                emptiest_queue_index = i
                minimum_length = queue.length
            end
        end

        return emptiest_queue_index
    end

    def assign_client_to_queue(queue_index, client)
        @queue_system[queue_index].push(client)
    end

    def remove_client_from_queue(queue_index)
        actual_queue = @queue_system[queue_index]

        if actual_queue.empty?
            return nil
        else
            return actual_queue.shift()    
        end
    end

    def get_queue_system
        return @queue_system
    end
    
end