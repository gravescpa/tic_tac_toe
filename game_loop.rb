require_relative 'console_game_function.rb'

game = Console_game.new(Consolehuman.new("X"), Consolehuman.new("O"))


game.draw_board