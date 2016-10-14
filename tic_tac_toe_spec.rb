gem 'minitest', '~> 5.4'
gem 'minitest-reporters'
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
#require_relative 'tic_tac_toe'

class Game < Minitest::Test
  def test_print_board
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    expected = "#{@board[0]} | #{@board[1]} | #{@board[2]} \n===+===+===\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n===+===+===\n #{@board[6]} | #{@board[7]} | #{@board[8]} \n" +
      "Enter [0-8]:"
    assert_equal expected, ::Game.new.start_game
  end
#
#   def test_until_game_over_or_tied
#     expected = until game_is_over(@board) || tie(@board)
#       get_human_spot
#       puts "#{@board[0]} | #{@board[1]} | #{@board[2]} \n===+===+===\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n===+===+===\n #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
#     end
#     assert_equal expected, ::Game.new.start_game
#   end
#
#   def test_if_game_not_over_not_tied
#     expected = if !game_is_over(@board) && !tie(@board)
#       eval_board
#     end
#     assert_equal expected, ::Game.new.start_game
#   end
#
#   def test_game_over
#     expected = "Game over"
#     assert_equal expected, ::Game.new.start_game
#   end
#
#   def
# end

# describe Game do
#   before do
#     @game = Game.new
#   end
#
#   describe "when user starts game" do
#     it "prints the board" do
#       @game.start_game.must_equal "#{@board[0]} | #{@board[1]} | #{@board[2]} \n===+===+===\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n===+===+===\n #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
#     end
#   end
#
# end
