
board_fields = {1 => " ", 2 => " ", 3 => " ", 4 => " ", 5 => " ", 6 => " ",
                7 => " ", 8 => " ", 9 => " "}
empty_fields = [1, 2, 3, 4, 5, 6, 7, 8, 9]
@game = true

def draw_board(bf)
  system "clear"
  puts "Board Numbers:"
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

def fill_field(bf, ef)
  bf.each do |key, value|
    if value != " "
      ef.delete(key)
    end
  end
end

def all_fields_filled?(ef)
  if ef == []
    puts "It's a tie!"
    @game = false
  end
end

def winner?(bf)
  winning_routes = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8],
                   [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  winning_routes.each do |elem|
    if bf[elem[0]] == "X" && bf[elem[1]] == "X" && bf[elem[2]] == "X"
      puts "Congratulations! You win!"
      @game = false
      exit #else there could be two winners
    elsif bf[elem[0]] == "O" && bf[elem[1]] == "O" && bf[elem[2]] == "O"
      puts "Sorry! You lost!"
      @game = false
    end
  end
end

#game starts
draw_board(board_fields)

while @game
  #player turn
  puts "Choose an empty field (1-9):"
  chosen_field = gets.chomp.to_i

  until empty_fields.include? chosen_field
    puts "Wrong field number. Please choose again."
    puts ""
    chosen_field = gets.chomp.to_i
  end

  board_fields[chosen_field] = "X"
  fill_field(board_fields, empty_fields)
  draw_board(board_fields)
  winner?(board_fields)
  all_fields_filled?(empty_fields)

  #computer turn
  comp_chosen_field = empty_fields.sample #this picks a random element
  board_fields[comp_chosen_field] = "O"
  fill_field(board_fields, empty_fields)
  draw_board(board_fields)
  winner?(board_fields)
  all_fields_filled?(empty_fields)
end