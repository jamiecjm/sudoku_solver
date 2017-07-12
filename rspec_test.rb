require 'rspec'
require_relative 'sudoku'
describe "Sudoku" do
  let(:board_string) { "800000500004000000005800906003070200540000000700054000000200001300000000008900000" }
  let(:new_sudoku_object) { Sudoku.new(board_string) }
  let(:solution) { "816429537934567128275813946693178254541692783782354619457236891329781465168945372" }

  describe "initializing a new Sudoku object" do
    it "should only take in a string argument" do
      expect(new_sudoku_object).to be_a(Sudoku)
    end
  end

  describe "#solve!" do
    it "should be able to solve any string" do
      expect(new_sudoku_object.solve!).to eq(solution)
    end
  end

end
