class RandomAI
    attr_accessor :marker, :player_r, :player_2

    def initialize(marker)
        @marker = marker
        @player_r = player_2
    end

    def valid_space?(board, choice)
        board[choice] == ""
    end

    def get_move(board)
        puts "Computer makes random move"
        random_move = rand(1..9)
        if valid_space?(board, random_move) == false
            get_move(board)
        else
            random_move
        end
    end
 
    end