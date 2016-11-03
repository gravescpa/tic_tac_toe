# Win: If the player has two in a row, they can place a third to get three in a row.
# Block: If the opponent has two in a row, the player must play the thrid themselves to block the opponent.
# Fork: Create an opportunity where the player has two threats to win (two non-blocked lines of 2).



class UnbeatableAI
    attr_accessor :marker

    def initialize(marker)
        @marker = marker
    end

    def valid_space?(board, choice)
        board[choice] == ""
    end

    def get_move(board)
        move = board.index("")
    end

    def potential_wins(board)
        win_positions = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

        win_combinations = [
            [board[0],board[1],board[2]],
            [board[3],board[4],board[5]],
            [board[6],board[7],board[8]],
            [board[0],board[3],board[6]],
            [board[1],board[4],board[7]],
            [board[2],board[5],board[8]],
            [board[0],board[4],board[8]],
            [board[2],board[4],board[6]],
        ]

        win_combinations.each do |winner, index|
            if winner.count(marker) == 2 && winner.count("") == 1
                winning_player = winner.index("")
                i = index
                open_spot = win_positions[i][winning_player]
            end
        end
        open_spot
    end


    # def check_for_win(board)
        
        
    # end

end



