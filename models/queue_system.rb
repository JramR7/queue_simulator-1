class QueueSystem
    
    def initialize(queue_quantity)
        @queue_quantity = queue_quantity

        if(@queue_quantity > 0)
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
        index_of_emptiest_queue = 0;
        minimum_length = @queue_system[0].length
        
        @queue_system.each_with_index do |queue, i|
            if(minimum_length > queue.length)
                index_of_emptiest_queue = i
                minimum_length = queue.length
            end
        end

        return index_of_emptiest_queue
    end

    def add_client_to_queue(index_of_queue, user)
        @queue_system[index_of_queue].push(user)
    end

    def remove_client_of_queue(index_of_queue)
        if(@queue_system[index_of_queue].empty?){
            return nil
        }
        @queue_system[index_of_queue].shift()
    end

    def print_()
        print(@queue_system)
    end
end