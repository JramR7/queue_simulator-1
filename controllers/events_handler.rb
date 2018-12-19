require 'pqueue'

class EventsHandler

    def initialize(simulation_end_time, delay_per_iteration)
        @random = Random.new
        @client_creation_time = 3
        @simulation_end_time = simulation_end_time
        
    end

    def event_queue_initialize
        event_queue = PQueue.new([]){ |a,b| a[0] < b[0] }
        
        (0..@simulation_end_time).each do |time|
            event_queue.push([time, "print_event"])
            
            if (time % @client_creation_time) == 0
                event_queue.push([time, "client_creation_event"])
            end

            if time == @simulation_end_time
                event_queue.push([time, "end_simulation_event"])
            end
        end

        print event_queue
    end

end
