module RandomGenerator

    def random_number(min_num, max_num)
        random = Random.new 
        generated_num = random.rand(min_num..max_num)
        return generated_num
    end

    def random_letter
        random = Random.new 
        generated_num = random.rand(1..26)
        generated_letter = (generated_num+96).chr
        return generated_letter
    end
    
end
