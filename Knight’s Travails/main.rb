class Board
  def initialize_board
    $array = Array.new(8, ". ").map{|row| Array.new(8, ".")}
    row_label = ["1", "2", "3", "4", "5", "6", "7", "8"]
    column_label = ["1", "2", "3", "4", "5", "6", "7", "8"]
    
    print "\t"
    print row_label.join("\t")
    puts
    $array.each_with_index do |row, i|
      print column_label[i]
      print "\t"
      print row.join("\t")
      puts
    end
  end
end

class Knight
  def possible_move(cell, moves) 
    row = cell[0]
    col = cell[1]

    if row >= 1 && row <= 8 && col >= 1 && col <= 8
      moves << cell 
    end
  end

  def moves(cell)
    row = cell[0]
    col = cell[1]
    possible_moves = []
    possible_move([row + 1, col - 2], possible_moves)
    possible_move([row + 1, col + 2], possible_moves)
    possible_move([row - 1, col - 2], possible_moves)
    possible_move([row - 1, col + 2], possible_moves)
    possible_move([row + 2, col + 1], possible_moves)
    possible_move([row + 2, col - 1], possible_moves)
    possible_move([row - 2, col - 1], possible_moves)
    possible_move([row - 2, col + 1], possible_moves)
    return possible_moves
  end
end

class Game 
  def initialize
    welcome
    $knight = Knight.new
  end

  def welcome 
    puts "Welcome to the Knight's Travails"
    sleep 1
    puts "The board is a grid of 8x8 squares"
    sleep 1
    puts "Choose starting and end position and we will show you the path"
    sleep 1
    puts "The coordenates have two values, row and column"
    sleep 1
    puts "Rows and columns numbers are between 1 and 8"
    sleep 1
    puts "Let's begin!"
    sleep 1
  end

  def start    
    $newBoard = Board.new 
    $newBoard.initialize_board
    print "Please, insert initial row position number: "
    $rowInit = gets.chomp
    if valid?($rowInit)
      puts 'Thank you!'
    else
      until valid?($rowInit)
        print "Please, insert initial row position number: "
        $rowInit = gets.chomp
      end
      puts 'Thank you!'
    end
    print "Please, insert initial column number: "
    $colInit = gets.chomp
    if valid?($colInit)
      puts 'Thank you!'
    else
      until valid?($colInit)
        print "Please, insert initial column number: "
        $colInit = gets.chomp
      end
      puts 'Thank you!'
    end
    print "Please, insert row destination number: "
    $rowEnd = gets.chomp
    if valid?($rowEnd)
      puts 'Thank you!'
    else
      until valid?($rowEnd)
        print "Please, insert row destination number: "
        $rowEnd = gets.chomp
      end
      puts 'Thank you!'
    end
    print "Please, insert column destination number: "
    $colEnd = gets.chomp
    if valid?($colEnd)
      puts 'Thank you!'
    else
      until valid?($colEnd)
        print "Please, insert column destination number: "
        $colEnd = gets.chomp
      end
      puts 'Thank you!'
    end
    knight_moves($rowInit, $colInit, $rowEnd, $colEnd)
    print "Do you want to play again? (y/n)"
    $answer = gets.chomp.downcase
    restart($answer)
  end

  def valid?(number)
    number.to_i >= 1 && number.to_i <= 8 ? true : false
  end

  def restart(answer) 
    answer == 'y' ? start : "Thanks for playing, see you soon!"
  end

  def knight_moves(rowInit, colInit, rowEnd, colEnd)
    start = [rowInit.to_i, colInit.to_i]
    finish = [rowEnd.to_i, colEnd.to_i]
    path = []
    path << finish
    until path.first == start
      previous = previous_move(start, path.first)
      path.unshift(previous)
    end
    print_path(path)
  end

  def previous_move(start, finish)
    queue = []  
    queue << start
    until queue.empty?
      cell = queue.shift 
      possible_moves = $knight.moves(cell)
     
      possible_moves.each do |move|
        queue << move

        return cell if move == finish
      end
    end
  end

  def print_path(moves)
    puts "\nYou made it in #{moves.length - 1} moves!. Here's your path:"

    moves.each { |cell| p cell }
  end

end

newGame = Game.new 
newGame.start

