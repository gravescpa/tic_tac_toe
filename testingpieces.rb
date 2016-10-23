  def board
        (0..2).each do |row|
            print "       "
            (0..2).each do |col|
                print @board[row][col]
                print " | " unless col == 2
            end
            print "\n"
            print "       ---------\n" unless row == 2
        end
        print "\n"
    end
    board