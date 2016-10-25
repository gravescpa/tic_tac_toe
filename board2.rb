class Board
    attr_accessor :gameboard

    def initialize
        @gameboard = Array.new(9, "")
    end

    def update(position, symbol)
        @gameboard[position] = symbol
    end
    
    def valid_space?(position)
        if @gameboard[position] == "X" || @gameboard[position] == "O"
            false
        else
            true
        end
    end

    def valid_input?(position)
        if position >= 0 && position <= 8
            true
        else
            false
        end
    end

    def integer?(position)
        if position =~ /^-?[0-9]/
            true
        else
            false
        end
    end
end