gem 'minitest', '~> 5.4'
gem 'minitest-reporters'
require 'minitest/autorun'
require_relative 'tic_tac_toe'
require 'minitest/reporters'
Minitest::Reporters.use!

class TestGame < Minitest::Test

  # def test_get_human_spot
  #   expected = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
  #   assert_equal expected, ::Game.new.get_human_spot
  # end

  def test_not_tie
    assert_equal false, ::Game.new.tie(["O", "X", "O", "X", "0", "X", "X", "O", "X"])
  end

  def test_tie
    assert_equal true, ::Game.new.tie(["O", "X", "O", "X", "O", "X", "X", "O", "X"])
  end

  def test_game_is_over
    assert_equal true, ::Game.new.game_is_over(["0", "0", "0"])
  end

  def test_game_is_not_over
    assert_equal false, ::Game.new.game_is_over(["0", "1", "2", "3", "4", "5", "6", "7", "8"])
  end

end
