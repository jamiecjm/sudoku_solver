require 'rspec'
require_relative 'sudoku'
describe "Sudoku" do
  let(:board_string) { "800000500004000000005800906003070200540000000700054000000200001300000000008900000" }
  let(:new_sudoku_object) { Sudoku.new(board_string) }
  let(:solution) { "839716524674592138215843976963178245541329867782654319497235681356481792128967453" }

  describe "initializing a new Sudoku object" do
    it "should only take in a string argument" do
      expect(new_sudoku_object).to be_a(Sudoku)
    end
  end

end
