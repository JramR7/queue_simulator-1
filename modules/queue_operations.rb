module QueueOperations
    
    def max_queue_length(queue_system_array)
        max_queue_length = 0
        
        queue_system_array.each do |queue|
            actual_queue_length = queue.length

            if actual_queue_length > max_queue_length
                max_queue_length = actual_queue_length
            end
        end    
        
        return max_queue_length
    end
    
end    