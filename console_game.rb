    require_relative 'board.rb'
    require_relative 'console_human.rb'
    require_relative 'randomai.rb'

class Console_game

    attr_accessor :board, :player_1, :player_2, :current_player

    def initialize(player_1, player_2)
        @board = Board.new
        @player_1 = player_1
        @player_2 = player_2
        @current_player = player_2
    end

    def who_plays
        puts """
        Who are you playing against? (select one)

        1. Human player
        2. Random
        3. Sequential
        """
        player = gets.chomp
        if player = '1'

        elsif player = '2'
        
        elsif player = '3'

        end


    def change_player
        if current_player == player_1
           @current_player = player_2
        else
            @current_player = player_1
        end
    end

    def draw_board
        puts """
        Let's get started!
        
        Sample board with numbers:
        
         1 | 2 | 3 
        ---+---+---
         4 | 5 | 6 
        ---+---+---
         7 | 8 | 9 
        
        
        Game Board:
        
         #{board.grid[0]} | #{board.grid[1]} | #{board.grid[2]}
        ---+---+---
         #{board.grid[3]} | #{board.grid[4]} | #{board.grid[5]}
        ---+---+---
         #{board.grid[6]} | #{board.grid[7]} | #{board.grid[8]}

        #{@current_player.marker} it is your turn
        """
    end

    def get_move
        current_player.get_move(board.grid)
    end

    def make_move(move)
        board.update(move, current_player.marker)
    end

    def game_over?        
            board.winner?(current_player.marker) || board.full_board?
    end

    def end_message
        if 
            board.winner?(current_player.marker)
            puts "#{current_player.marker} is the winner!"
        else
            board.full_board?
            puts "It's a tie!"
        end
    end

end
