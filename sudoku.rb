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

    # board method display the sudoku board in a 9x9 grid with nine 3x3 sub-grids
    # Sample board (number on each grids represents the column index):
  	# 0 1 2 | 3 4 5 | 6 7 8  - 0 (array/row index)
	# 0 1 2 | 3 4 5 | 6 7 8  - 1		
	# 0 1 2 | 3 4 5 | 6 7 8  - 2
	# ---------------------	 
	# 0 1 2 | 3 4 5 | 6 7 8  - 3		
	# 0 1 2 | 3 4 5 | 6 7 8  - 4	
	# 0 1 2 | 3 4 5 | 6 7 8  - 5	
	# ---------------------  
	# 0 1 2 | 3 4 5 | 6 7 8  - 6		
	# 0 1 2 | 3 4 5 | 6 7 8  - 7	
	# 0 1 2 | 3 4 5 | 6 7 8  - 8
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

  	# solve! will solve grids that don't require guessing
    def solve!
    	# keep looping if previous board doesn't match current board (new grids are being solved)
	  	while true do
		  	@sudoku.each_with_index do |row, rowindex|
		  		row.each_with_index do |cell, cellindex|
		  			# duplicate sudoku board to solve grids and compare with previous board
		  			@sudokudup = @sudoku.dup
		  			# get the array of numbers from current column 
		  			col = @sudoku.transpose[cellindex]
		  			# find unsolved grids
		  			next if cell != 0
		  			# form an array of possible solutions, starting with all numbers from 1 to 9
		  			solutions=(1..9).to_a
		  			# loop through numbers from 1 to 9, delete the number from solutions if it appears in current row/column
		  			1.upto(9) {|x| solutions.delete(x) if row.include?(x)}
		  			1.upto(9) {|x| solutions.delete(x) if col.include?(x)}

		  			# get the numbers from current box(3x3 grid)
		  			# example (number in each grids represent column index):
		  			# | 0 1 2 | - 0 (row/array index)
		  			# | 0 1 2 | - 1
		  			# | 0 1 2 | - 2
		  			# ---------
		  			# box_x returns the array/row index of the top left number of current box (refer to sample board)
		  			box_x = (rowindex./3)*3
		  			box = []
		  			# loop through the 3 rows in the box
		  			3.times do
		  				# box_y returns the column index of the top left number of current box (refer to sample board)
		  				box_y=(cellindex./3)*3
		  				# loop through the 3 columns for each rows
		  				3.times do
		  					# insert current number into the 'box' array
		  					box << @sudoku[box_x][box_y]
		  					# get the next column index from the current row
		  					box_y += 1
		  				end
		  				# get the next row/array index
		  				box_x += 1
		  			end
		  			# delete number from solutions if it appears in current box
		  			1.upto(9) {|x| solutions.delete(x) if box.include?(x)}
		  			# if solutions contain only 1 number, the current grid will be replaced with the number
		  			@sudoku[rowindex][cellindex] = solutions[0] if solutions.length == 1
		  		end
		  	end
		  	if @sudoku == @sudokudup
		  		guess
		  		break
		  	end
		end
    end

    # utlize recursion to solve sudoku
    def guess
    	# loop 1
	    while true do
		    @sudoku.each_with_index do |row, rowindex|
		        row.each_with_index do |cell, cellindex|
		        	# *******************************************************
		        	# this part same as solve! method
		            col = @sudoku.transpose[cellindex]
		            # return to previous loop (loop 2) if sudoku board is completely solved
		            return if !@sudoku.flatten.include?(0)
		            next if cell != 0
		            solutions=(1..9).to_a
		            1.upto(9) {|x| solutions.delete(x) if row.include?(x)}
		            1.upto(9) {|x| solutions.delete(x) if col.include?(x)}
		            box_x=(rowindex./3)*3
		            box=[]
		            3.times do
		            	box_y=(cellindex./3)*3
		            	3.times do
		              		box << @sudoku[box_x][box_y]
		              		box_y += 1
		            	end
		            box_x += 1
		        	end
		       		1.upto(9) {|x| solutions.delete(x) if box.include?(x)}
		       		# *******************************************************
		       		# return to previous loop/previous unsolved grid(loop 2) if no solutions found for current grid
		        	return if solutions == []
		        	solutions_index = 0
		        	# loop through each number in solutions array (loop 2)
		        	while true do
		        		# replace current grid with a number with in solutions
			            @sudoku[rowindex][cellindex] = solutions[solutions_index]
			            # call itself
			            guess
			            # code start from this line if no solution found from previous recursion (from return if solutions == [])
			            # break the loop if sudoku board is completely solved
			            break if !@sudoku.flatten.include?(0) 
			            # change index to the next number in solutions
			            solutions_index += 1
			          	if rowindex == 0 && cellindex ==0 && solutions_index == solutions.length
				        	@sudoku[rowindex][cellindex] = 0
				        	# stop recursion and goes to next loop(loop 1) if no solutions found at all
				        	break
			          	elsif solutions_index == solutions.length
			            	@sudoku[rowindex][cellindex] = 0
			            	# return to previous loop/previous unsolved grid(loop 2) if no solutions found for current grid
			            	return
			          	end
		        	end
	        	end
	    	end
    	end
    end

end