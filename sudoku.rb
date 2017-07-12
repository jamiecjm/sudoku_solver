require 'byebug'
class Sudoku

  #initialize a sudoku object with a string of 81 numbers 
  def initialize(board_string)

  	# convert the strings into numbers
    @sudoku = board_string.split("").map {|c| c.to_i}

    # seperate the numbers into 9 arrays of numbers
    # each array represents a row in sudoku board
    @sudoku = @sudoku.each_slice(9).to_a
  end

end