require_relative 'controllers/events_controller'
require_relative 'controllers/supermarket_systems_controller'
require_relative 'views/data_capture'

class SupermarketSimulation

    def initialize
        data_capture = DataCapture.new()
        queue_model = data_capture.queue_data_capture()
        registers_quant = data_capture.register_data_capture()
        simulation_time = data_capture.simulation_time_capture()
        delay_time = data_capture.delay_time_capture()

        # queue system type
        if queue_model == 1
            queue_quant = 1
        elsif queue_model == 2
            queue_quant = registers_quant
        end        
        
        #puts queue_model, registers_quant, simulation_time, delay_time, queue_quant
        supermarket_controller = SupermarketSystemController.new(queue_quant,
                                                                registers_quant)
        @events_controller = EventsController.new(simulation_time, delay_time,
                                                        supermarket_controller)
    end

    def start_simulation
        @events_controller.run_simulation()
    end
    
end


supermarket_simulator = SupermarketSimulation.new()
supermarket_simulator.start_simulation()
