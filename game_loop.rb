require_relative 'console_game.rb'

game = Console_game.new(Consolehuman.new("X"), Consolehuman.new("O"))


game.draw_board

move = game.get_move

game.make_move(move)

game.draw_board