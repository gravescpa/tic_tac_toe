class Board
    attr_accessor :grid

    def initialize
        @grid = Array.new(9, "")
    end

    def update(position, symbol)
        @grid[position.to_i] = symbol
    end
    
    def valid_space?(position)
        if @grid[position] == "X" || @grid[position] == "O"
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
        grid.count("") == 0        
    end

    def winner?(symbol)
        grid[0] == symbol && grid[1] == symbol && grid[2] == symbol ||
        grid[3] == symbol && grid[4] == symbol && grid[5] == symbol ||
        grid[6] == symbol && grid[7] == symbol && grid[8] == symbol ||
        grid[0] == symbol && grid[3] == symbol && grid[6] == symbol ||
        grid[1] == symbol && grid[4] == symbol && grid[7] == symbol ||
        grid[2] == symbol && grid[5] == symbol && grid[9] == symbol ||
        grid[0] == symbol && grid[4] == symbol && grid[8] == symbol ||
        grid[2] == symbol && grid[4] == symbol && grid[6] == symbol
        # if grid.include?
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