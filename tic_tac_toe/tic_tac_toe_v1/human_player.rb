class HumanPlayer

    def initialize(mark)
        @mark = mark
    end

    def mark
        @mark
    end

    def get_position
        puts "Enter a position in the format \"X Y\""
        input = gets.chomp
        return [input[0].to_i,input[2].to_i]
    end

end