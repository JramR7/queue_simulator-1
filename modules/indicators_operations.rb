module IndicatorsOperations

    def calculate_mean(indicator_array)
        array_length = indicator_array.length
        array_sum = indicator_array.inject(0, :+)

        array_mean = array_sum.to_f / array_length.to_f
    end        

end    