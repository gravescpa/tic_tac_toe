# This code allows a two player tic-tac-toe game to be played from the command line

#These establish the beginning arrays/hashes and their values.  
#Empty fields will be replaced by the chosen board fields when input by players
empty_fields = [1, 2, 3, 4, 5, 6, 7, 8, 9]

board_fields = {1 => " ", 2 => " ", 3 => " ", 4 => " ", 5 => " ", 6 => " ", 7 => " ", 8 => " ", 9 => " "}

@game = true

# This function provides the basic game instruction

    def game_instruction
        puts ""
        puts "Let's play Tic-Tac-Toe!"
        print "\n" * 2
        puts " 1 | 2 | 3    The positions to play on the tic-tac-toe board are"
        puts "---|---|---   represented by number 1-9 as shown."
        puts " 4 | 5 | 6    To place an 'X' or 'O' in a certain position,"
        puts "---|---|---   simply enter the number of that position."
        puts " 7 | 8 | 9 "
        puts ""
    end

# This section defines the players and their markers

    def players
        puts "Player 1, would you like to be X or O? "
        player1 = gets.chomp
    
            if player1 == "X"
                player2 = "O"
            else
                player2 = "X"
            end

        puts "Great! Player 1 is #{player1} and Player 2 is #{player2}"
        puts ""
        puts "Let's get started!'"
    end


game_instruction
players