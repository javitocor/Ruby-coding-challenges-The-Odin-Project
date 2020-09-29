  def initialize_board
    $array = Array.new(8, ". ").map{|row| Array.new(8, ".")}
    row_label = ["a", "b", "c", "d", "e", "f", "g", "h"]
    column_label = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    populate_array()
    print "\t"
    print row_label.join("\t")
    puts
    $array.each_with_index do |row, i|
      print column_label[i+1]
      print "\t"
      print row.join("\t")
      puts
    end
  end

 def populate_array
  $array[1].map! {|x| x = "\u265F"}
  $array[6].map! {|x| x="\u265F"}
  $array[0][0] = "\u2656"
  $array[0][7] = "\u2656"
  $array[7][7] = "\u2656"
  $array[7][0] = "\u2656"
  $array[0][1] = "\u2658"
  $array[0][6] = "\u2658"
  $array[7][6] = "\u2658"
  $array[7][1] = "\u2658"
  $array[0][2] = "\u2657"
  $array[0][5] = "\u2657"
  $array[7][5] = "\u2657"
  $array[7][2] = "\u2657"
  $array[0][3] = "\u2655"
  $array[7][3] = "\u2655"
  $array[0][4] = "\u2654"
  $array[7][4] = "\u2654"
 end
   
  
initialize_board()
black = "\u25A1 "
white = "\u25A0 "
