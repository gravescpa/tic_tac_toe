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

#This function draws the sample board with numbers and the game board ready for play
def draw_board(bf)
    puts "Sample board with numbers:"
    puts ""
    puts " 1 | 2 | 3 "
    puts "---+---+---"
    puts " 4 | 5 | 6 "
    puts "---+---+---"
    puts " 7 | 8 | 9 "
    puts ""
    puts "Game Board:"
    puts ""
    puts " #{bf[1]} | #{bf[2]} | #{bf[3]} "
    puts "---+---+---"
    puts " #{bf[4]} | #{bf[5]} | #{bf[6]} "
    puts "---+---+---"
    puts " #{bf[7]} | #{bf[8]} | #{bf[9]} "
    puts ""
end

#This function clears out the empty fields as they are chosen.
def fill_fields(bf, ef)
    bf.each do |key, value|
        if value != " "
            ef.delete(key)
        end
    end
end

#This starts the game by displaying the sample board and the actual game board
game_instruction
players
draw_board(board_fields)

# This function allows the players to take turns
while @game

    #player1 turn
    puts "Player 1, choose an empty field (1-9):"

    chosen_field1 = gets.chomp.to_i

    board_fields[chosen_field1] = "X"
    fill_fields(board_fields, empty_fields)
    draw_board(board_fields)
    winner?(board_fields)
    all_fields_filled?(empty_fields)

    #player2 turn
    puts "Player 2, choose an empty field (1-9):"

    chosen_field2 = gets.chomp.to_i

    board_fields[chosen_field2] = "O"
    fill_fields(board_fields, empty_fields)
    draw_board(board_fields)
    winner?(board_fields)
    all_fields_filled?(empty_fields)
end

