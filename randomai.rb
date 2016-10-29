class RandomAI
    attr_accessor :marker

    def initialize(marker)
        @marker = marker
    end

    def get_move(board)
        puts "Computer makes random move"
        move = move.sample
        # move = gets.chomp.to_i
        move = move - 1
        move
        
        
 
    end