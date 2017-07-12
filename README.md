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
Example 1: 096040001100060004504810390007950043030080000405023018010630059059070830003590007  
Example 2: 302609005500730000000000900000940000000000109000057060008500006000000003019082040  
Example 3: 000075400000000008080190000300001060000000034000068170204000603900000020530200000  

```
sudoku = Sudoku.new(board_string)  # => create a new sudoku object
sudoku.solve!                      # => return a string of 81 numbers of a solved sudoku
```

Print the Sudoku board

```
sudoku.board
```

#### Run the test from the terminal

```
rspec rspec_test.rb
```
