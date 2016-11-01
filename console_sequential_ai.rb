class SequentialAI
    attr_reader :marker

    def initialize(marker)
        @marker = marker
    end

    def valid_space?(board, choice)
       board[choice] != "X" || board[choice] != "O"
    end

    def get_move(board)
        board.index("")
    end
 
    end