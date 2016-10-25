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

    def winner?(symbol)
        gameboard[0] == symbol && gameboard[1] == symbol && gameboard[2] == symbol ||
        gameboard[3] == symbol && gameboard[4] == symbol && gameboard[5] == symbol ||
        gameboard[6] == symbol && gameboard[7] == symbol && gameboard[8] == symbol ||
        gameboard[0] == symbol && gameboard[3] == symbol && gameboard[6] == symbol ||
        gameboard[1] == symbol && gameboard[4] == symbol && gameboard[7] == symbol ||
        gameboard[2] == symbol && gameboard[5] == symbol && gameboard[9] == symbol ||
        gameboard[0] == symbol && gameboard[4] == symbol && gameboard[8] == symbol ||
        gameboard[2] == symbol && gameboard[4] == symbol && gameboard[6] == symbol
        # if gameboard.include?
        #     winners = [[1, 2, 3]] #[4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
        #     winners.each do |element|
        #         if symbol[element[0]] == "X" && symbol[element[1]] == "X" && symbol[element[2]] == "X"
        #             true
        #         elsif symbol[element[0]] == "O" && symbol[element[1]] == "O" && symbol[element[2]] == "O"
        #             false
        #         end
        #     end
        # end
    end


end