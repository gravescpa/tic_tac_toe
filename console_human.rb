class Consolehuman
    attr_accessor :marker

    def initialize(marker)
        @marker = "X"
    end

    def get_move(board)
        puts "Make a move (1-9):"
        move = gets.chomp.to_i
            if board[move] == ""
                move
            else
                puts "Wrong move buster!"
                puts "Try again asswipe"
                get_move(board)
            end
        
        
 
    end



end