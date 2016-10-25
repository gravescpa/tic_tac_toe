class Board
    attr_accessor :gameboard

    def initialize
        @gameboard = Array.new(9, "")
    end

    def update(position, symbol)
        @gameboard[position.to_i] = symbol
    end
    
    def valid_space?(position)
        if @gameboard[position] == "X" || @gameboard[position] == "O"
            false
        else
            true
        end
    end

    def valid_input?(position)
        if position.to_i >= 0 && position.to_i <= 8 && position =~ (/^(\d)+$/) 
            # if  
            true
                
        else
            false
        end
    end

    def full_board?
        gameboard.count("") == 0
            
        
    end




end