class Board
    attr_accessor :grid

    def initialize
        @grid = Array.new(9, "")
    end

    def update(position, marker)
        @grid[position.to_i] = marker
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

    def winner?(marker)
        grid[0] == marker && grid[1] == marker && grid[2] == marker ||
        grid[3] == marker && grid[4] == marker && grid[5] == marker ||
        grid[6] == marker && grid[7] == marker && grid[8] == marker ||
        grid[0] == marker && grid[3] == marker && grid[6] == marker ||
        grid[1] == marker && grid[4] == marker && grid[7] == marker ||
        grid[2] == marker && grid[5] == marker && grid[9] == marker ||
        grid[0] == marker && grid[4] == marker && grid[8] == marker ||
        grid[2] == marker && grid[4] == marker && grid[6] == marker
        # if grid.include?
        #     winners = [[1, 2, 3]] #[4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
        #     winners.each do |element|
        #         if marker[element[0]] == "X" && marker[element[1]] == "X" && marker[element[2]] == "X"
        #             true
        #         elsif marker[element[0]] == "O" && marker[element[1]] == "O" && marker[element[2]] == "O"
        #             false
        #         end
        #     end
        # end
    end


end