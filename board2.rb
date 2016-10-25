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
        gameboard[0] == symbol && gameboard[1] == symbol && gameboard[2] == symbol
        # if gameboard.include?
        #     winners = [[1, 2, 3]] #[4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
        #     winners.each do |element|
        #         if bf[element[0]] == "X" && bf[element[1]] == "X" && bf[element[2]] == "X"
        #             true
        #         elsif bf[element[0]] == "O" && bf[element[1]] == "O" && bf[element[2]] == "O"
        #             false
        #         end
        #     end
        # end
    end


end