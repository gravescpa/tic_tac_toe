class Negamax
    attr_accessor :board, :players

    def initialize(board, players)
        @board = board
        @players = players
    end

    def get_move(board)
        depth = 1
        player_marker = players.current_player
        negamax(board, player_marker, depth)
        return @best_move
    end
        

    private

    def negamax(board, marker, depth)
        marker == "O" ? opponent = "X" : opponent = "O"

        if board.winner?(marker) || board.full_board?
        # if board.winner?(marker) || board.full_board?()
            return game_result(marker, opponent, depth)
        else
            max = -1.0/0
            available_moves.each do |space|
                board[space] = marker
                score = -negamax(board, opponent, depth + 1)
                board[space] = "#{space + 1}"

                if score > max
                    max = score
                    if depth == 1
                        @best_move = space
                    end
                end
            end
            return max
        end
    end

    

    def available_moves()
        board.board_positions.each_index.select { |s| board.board_positions[s] != "X" && board.board_positions[s] != "O"}
    end

    def game_result(marker, opponent, depth)
        if board.winner?(marker)
            return 100 - depth
        elsif board.winner?(opponent)
            return -(100 - depth)
        else
            return 0
        end
    end
end