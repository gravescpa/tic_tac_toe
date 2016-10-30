class SequentialAI
    attr_accessor :marker

    def initialize(marker)
        @marker = marker
    end

    def valid_space?(board, choice)
        board[choice] == ""
    end

    def get_move(board)
        board.index("")
        if valid_space?(board, sequential_move) == false
            get_move(board)
        else
            sequential_move
        end
    end
 
    end