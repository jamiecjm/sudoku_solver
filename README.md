# Sudoku Solver
A fully-functioning Sudoku solver that can be run from the command line.

## Context
From Wikipedia's definition, Sudoku is a logic-based, combinatorial number-placement puzzle. The objective is to fill a 9x9 grid with digits so that each column, each row, and each of the nine 3x3 sub-grids that compose that grid (also called "boxes") contains all of the digits from 1 to 9.

In a sudoku game, some of the squares will already have numbers. Usually there will be enough initial numbers to guarantee a unique solution.

## Usage
#### Run the sudoku solver from the terminal

```
ruby game.rb
```

#### Using the Sudoku model directly

board_string is a valid set of 81 numbers of sudoku

```
sudoku = Sudoku.new(board_string) # => create a new sudoku object
sudoku.solve! # => return a set of 81 numbers of a solved sudoku
```

Print the Sudoku board

```
sudoku.board
```

#### Run the test from the terminal

```
rspec rspec_test.rb
```
