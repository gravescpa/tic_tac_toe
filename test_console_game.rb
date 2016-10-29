require "minitest/autorun"
require_relative 'console_game.rb'


class TestConsoleGame < Minitest::Test

    def test_player_change_X_to_O
        game = Console_game.new("X", "O")
        game.current_player == "X"
		assert_equal("O", game.current_player)
	end	

    def test_player_change_O_to_X
        game = Console_game.new("O", "X")
        game.current_player == "O"
		assert_equal("X", game.current_player)
	end	

    def test_get_current_player_move
        game = Console_game.new("X", "O")
        board = Board.new()
        move = game.get_move
        assert_equal(true, [0, 1, 2, 3, 4, 5, 6, 7, 8].include?(move))
    end

    # def test_make_current_player_move
    #     move = 

end