load 'sudoku.rb'

# function that displays the puzzle nicely
# assumes the puzzle is formatted as a list
# for each line of the puzzle, which is
# represented as a string
def puzzle_print(puzz)
	puzz.each_with_index {|r, i|
		if i % 3 == 0 then puts "|" + "-" * 29 + "|" end
		r = r.scan /[0-9.]/
		r.each_with_index {|c, j|
			c = if c == "." then " " else c end
			if j % 3 == 0 then print "| #{c} " else print " #{c} " end
		}
		print "| \n"
	}
	puts "|" + "-" * 29 + "|"
end

# load the unsolved puzzle
unsolved = ARGF.readlines

# solve the puzzle
solved_t =  Sudoku.solve(Sudoku::Puzzle.new(unsolved))

solved = []
0.upto(8) {|i|
	row = []
	0.upto(8) {|j|
		row << solved_t[i,j]
	}
	solved << row.join('')
}


puts "Unsolved puzzle:"
puzzle_print(unsolved)

puts "\nSolved puzzle:"
puzzle_print(solved)
