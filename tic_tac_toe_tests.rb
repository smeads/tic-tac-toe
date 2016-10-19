gem 'minitest', '~> 5.4'
gem 'minitest-reporters'
require 'minitest/spec'
require 'minitest/autorun'
require_relative 'tic_tac_toe'
require 'minitest/reporters'
Minitest::Reporters.use!


class TestGame < Minitest::Test


  # def test_get_human_spot
  #   expected = ["O", "1", "2", "3", "4", "5", "6", "7", "8"]
  #   assert_equal expected, ::Game.new.get_human_spot
  # end

  def test_game_tied
    assert_equal nil, ::Game.new.game_tied
  end

  def test_game_board
    expected = " 0 | 1 | 2 \n===+===+===\n 3 | 4 | 5 \n===+===+===\n 6 | 7 | 8 \n"
    assert_equal expected, ::Game.new.game_board
  end

  def test_get_player_spot
    assert_equal "0", ::Game.new.get_player_spot(2, "0")
  end

  def test_get_best_move
    assert_equal 0, ::Game.new.get_best_move(["0", "X", "O", "X", "O", "X", "O", "X", "O"], nil, nil, nil)
  end

  def test_set_best_move
    assert_equal 0, ::Game.new.set_best_move(nil, ("0".."8").to_a, "0")
  end

  def test_game_is_over
    assert_equal true, ::Game.new.game_is_over(["0", "1", "2"])
  end

  def test_game_is_not_over
    assert_equal false, ::Game.new.game_is_over(["0", "X", "2", "3", "4", "5", "6", "7", "8"])
  end

  def test_not_a_tie
    assert_equal false, ::Game.new.tie(["O", "X", "O", "X", "0", "X", "X", "O", "X"])
  end

  def test_a_tie
    assert_equal true, ::Game.new.tie(["O", "X", "O", "X", "O", "X", "X", "O", "X"])
  end

end
