require "minitest/autorun"
require_relative 'board.rb'


class TestTicTacToe < Minitest::Test

	def player1_is_X
		player1 = "X"
		assert_equal("X", player1)
	end	
end
