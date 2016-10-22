# This displays a very simple graphic tic tac toe board
class Tic_tac_toe
    attr_reader :grid, :player1, :player2

# This section defines attributes
    def initialize
        @grid = Game_board.new
        @player1 = Player.new
        @player2 = Player.new
        @active_turn = 1
    end
##################################################
# This section provides the basic game instruction

    def game_instruction
        print "\n"
        puts "Do you want to play Tic-Tac-Toe?"
        print "\n" * 2
        puts " 1 | 2 | 3    The positions to play on the tic-tac-toe board are"
        puts "---|---|---   represented by number 1-9 as shown."
        puts " 4 | 5 | 6    To place an 'X' or 'O' in a certain position,"
        puts "---|---|---   simply enter the number of that position."
        puts " 7 | 8 | 9 "
        print "\n"
    end
##################################################
# This function starts the game play

    def play_game
        game_instruction
        players
        start_game
        # Game_board.new
        # print_board
        player_move
    end
###################################################
# This section defines the players and their markers

    def players
        print "\n"
        puts "Player 1, you will be X"
        @player1.marker = "X"
        @player2.marker = "O"
        # puts "Player 1, would you like to be X or O? "
        # @player1 = gets.chomp
    
        #     if @player1 == "X"
        #         @player2 = "O"
        #     else
        #         @player2 = "X"
        #     end

        # puts "Great! Player 1 is #{@player1} and Player 2 is #{@player2}"
        print "\n"
    end
###################################################
    # def print_board
    #     (0..2).each do |row|
    #         print "       "
    #         (0..2).each do |col|
    #             print @board[row][col]
    #             print " | " unless col == 2
    #         end
    #         print "\n"
    #         print "       ---------\n" unless row == 2
    #     end
    #     print "\n"
    # end
######################################################
# This section defines turns and player moves

    def player_move
        print "\n"
        move = nil
        until (0..8).include?(move)
            print "Player #{@player1.marker}, which space do you choose. Remember to select 1-9?"
                move = gets.chomp.to_i - 1
                # row = move / 3
                # col = move % 3
                # return row,col
        end
        # print_board
    end

    def turns(player)
        input = player_move
        if @grid.update_board(input, player.marker)
            @active_turn += 1
        end
        @grid.print_board

    end

    def take_turns
        @active_turn.odd? ? turns(@player1) : turns(@player2)
    end

    def start_game
        @grid.print_board
        take_turns until game_over
    end

    def game_over
        @active_turn > 9
    end
####################################################

class Game_board
    attr_reader :board, :empty

    def initialize
        @board = Array.new(9, @empty)
        @empty = "-"
    end

    def print_board
        print "\n"
        @board.each_slice(3) {|row| puts row.join(' | ')}
        print "\n"
    end

    def update_board(space, marker)
        if @board[space] == @empty
            @board[space] = marker
            return true
        else
            return false
        end
    end
end










end
Player = Struct.new(:marker)
Tic_tac_toe.new.play_game
# Game_board.new
