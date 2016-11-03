require "minitest/autorun"
require_relative 'unbeatable_ai.rb'


class TestUnbeatableAI < Minitest::Test

    def test_create_player
        player = UnbeatableAI.new("X")
        assert_equal("X", player.marker)
    end

    def test_for_valid_space?
        player = UnbeatableAI.new("X")
        assert_equal(true, player.valid_space?(player.marker, ""))
    end

    def test_for_potential_win_position_0
        player = UnbeatableAI.new("O")
        assert_equal(0, player.get_move(["", "X", "X", "", "", "", "", "", ""]))
    end

     def test_for_potential_win_position_6
        player = UnbeatableAI.new("O")
        assert_equal(6, player.get_move(["X", "X", "O", "", "O", "", "", "", "X"]))
    end

    def test_for_potential_win_position_3
        player = UnbeatableAI.new("O")
        assert_equal(3, player.get_move(["X", "", "", "", "O", "O", "", "", "X"]))
    end

    # def test_valid_move
    #     player = UnbeatableAI.new("X")
    #     move = player.get_move(Array.new(9, ""))
    #     assert_equal(true, [0, 1, 2, 3, 4, 5, 6, 7, 8].include?(move))
    # end

    # def test_go_for_win_0
    #     player = UnbeatableAI.new("X")
    #     move = 0
    #     assert_equal(0, player.get_move(["","X","X","","","","","",""]))
    # end

    # def test_go_for_win_4
    #     player = UnbeatableAI.new("X")
    #     move = 4
    #     assert_equal(4, player.get_move(["","","","X","","X","","",""]))
    # end

end