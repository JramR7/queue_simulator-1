module InputValidator

    def input_integer_validation(input)
        if input.is_integer? && input.to_i > 0
            return input.to_i
        else
            puts "\nDebe ingresar un número entero mayor a 0..."
            return false
        end
    end
end

class String
    def is_integer?
        self.to_i.to_s == self
    end
end