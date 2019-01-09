module InputValidator

    def input_integer_validation(higher_equal_value, input)
        if input.is_integer? && input.to_i >= higher_equal_value
            return input.to_i
        else
            print "\nDebe ingresar un número entero mayor o igual a ",
                                                higher_equal_value, "..."
            return false
        end
    end

    def option_value_validation(option1, option2, input)
        if input.is_integer? && (input.to_i == option1) || (input.to_i == option2)
            return input.to_i
        else
            puts "\nDebe ingresar un número de opción valido..."
            return false
        end
    end
end

class String

    def is_integer?
        self.to_i.to_s == self
    end

end