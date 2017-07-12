require_relative 'sudoku'

# board_string = "096040001100060004504810390007950043030080000405023018010630059059070830003590007"
# board_string = "000000000000000000000000000000000000000000000000000000000000000000000000000000000"
# board_string = "990999999999990009999999999999000999999000999999999990000999999999999999999999990"
system "clear" or system 'cls'
puts "Welcome to sudoku solver!"
while true
	puts "Enter a valid set of 81 numbers to start solving or type quit to exit:"
	board_string = gets.chomp
	puts ""
	case 
	when board_string.downcase == "quit"
		break
	when board_string.length == 81
		game = Sudoku.new(board_string)
		puts "Your sudoku board:"
		game.board
		puts "Select your choice (enter the number):"
		puts "1: Solve it!"
		puts "2: Try another board"
		puts "3: Quit"
		choice = gets.chomp
		puts ""
		case choice
			when "1"
				game.solve!
				puts "Game solved!"
				game.board
				puts ""
			when "3"
				break
		end
	else
		puts "Numbers are not valid for a sudoku board!"
	end
end
