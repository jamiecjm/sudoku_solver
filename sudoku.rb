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

  # Display the sudoku board in a 9x9 grid with nine 3x3 sub-grids
  # End result should be:
  	# 0 1 2 | 3 4 5 | 6 7 8  
	# 0 1 2 | 3 4 5 | 6 7 8 		
	# 0 1 2 | 3 4 5 | 6 7 8 
	# ---------------------		
	# 0 1 2 | 3 4 5 | 6 7 8 		
	# 0 1 2 | 3 4 5 | 6 7 8 	
	# 0 1 2 | 3 4 5 | 6 7 8 	
	# ---------------------
	# 0 1 2 | 3 4 5 | 6 7 8 		
	# 0 1 2 | 3 4 5 | 6 7 8 	
	# 0 1 2 | 3 4 5 | 6 7 8
  def board

  	# counter for the row and cell numbers
    cell_counter = 0
    row_counter = 0


    puts "----------------------"
    @sudoku.each do |row|

      # row_counter indicates the row number/array index of current loop 
      row_counter += 1  
      row.each do |cell|

      	# cell_counter indicates the cell number/index in current array
        cell_counter += 1

        # display underscore to indicate an unsolved grid
        cell = "_" if cell == 0

        # print the number if the number not 0
        print "#{cell} "

        # print '|' for every 3 numbers to display to 3x3 sub grid
        print "|" if cell_counter%3 == 0

        # start a new row for every 9 numbers
        puts "" if cell_counter%9 == 0
      end

      # display dotted lines for every 3 rows 
      puts "----------------------" if row_counter%3 == 0
    end 
  end

end