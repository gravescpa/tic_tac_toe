require_relative 'console_game.rb'


game = Console_game.new(Console_human.new("X"), RandomAI.new("O") || SequentialAI.new("O"))
board = Board.new()

game.who_plays


until game.game_over?
# until game.board.winner?(game.current_player.marker) || game.board.full_board?
    game.change_player
    game.draw_board
    move = game.get_move
    game.make_move(move)
    game.draw_board
end

puts game.end_message