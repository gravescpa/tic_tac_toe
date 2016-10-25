require "minitest/autorun"
require_relative 'board2.rb'


class TestTicTacToeBoard < Minitest::Test

    def test_for_valid_input
        board = Board.new()
        assert_equal(false, board.valid_input?(11))
        assert_equal(true, board.valid_input?(5))
    end

    def test_for_occupied_space
        board = Board.new()
        board.gameboard = ["X","O","","","","","","",""]
        assert_equal(false, board.valid_space?(1))
        assert_equal(true, board.valid_space?(2))
    end

    def test_for_update_board_turn_2
        board = Board.new()
        board.gameboard = ["X","","","","","","","",""]
        board.update(1, "O")
        assert_equal(["X","O","","","","","","",""], board.gameboard)
    end

    def test_for_update_board_turn_1
        board = Board.new()
        board.gameboard = ["","","","","","","","",""]
        board.update(0, "X")
        assert_equal(["X","","","","","","","",""], board.gameboard)
    end

    def test_empty_board
        board = Board.new()
		assert_equal(Array.new(9, ""), board.gameboard)
	end	

    def test_integer_only
        board = Board.new()
        assert_equal(false, board.integer?("n"))
    end
end
