class Game
  def initialize
    @board = ("0".."8").to_a
    @computer = nil
    @human = nil
  end

  def play_game
    game_setup
    loop_through_game
    play_again
  end

  def game_board
    " #{@board[0]} | #{@board[1]} | #{@board[2]} \n===+===+===\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n===+===+===\n #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
  end

  def game_setup
    select_game_piece
    select_play_first
    puts game_board
    puts "Enter [0-8]:"
  end

  def loop_through_game
    until game_is_over(@board) || tie(@board)
      get_human_spot
      if !game_is_over(@board) && !tie(@board)
        get_computer_spot
      else
        game_tied
      end
      puts game_board
    end
    puts "Game over!"
  end

  def game_tied
    if tie(@board)
      puts "It's a tie!"
    end
  end

  def select_game_piece
    puts "Select to be X or O"
    game_piece = nil
    until game_piece
      game_piece = gets.chomp.capitalize
      if game_piece == "X"
        @human = "X"
        @computer = "O"
        puts "You're X and the computer is O"
      elsif game_piece == "O"
        @human = "O"
        @computer = "X"
        puts "You're O and the computer is X"
      else
        puts "Wrong input, please try again"
        select_game_piece
      end
    end
  end

  def select_play_first
    puts "Select to go first(1) or second(2)"
    play_first = nil
    until play_first
      play_first = gets.chomp.to_i
      if play_first == 1
        puts "You're first"
      elsif play_first == 2
        puts "Computer has gone first, now its your turn"
        get_computer_spot
      else
        puts "Wrong input, please try again"
        select_play_first
      end
    end
  end

  def get_human_spot
    spot = nil
    until spot
      spot = gets.chomp.to_i
      get_player_spot(spot, @human)
    end
    puts "You moved to space #{spot}"
  end

  def get_computer_spot
    spot = nil
    until spot
      if @board[4] == "4"
        spot = 4
        @board[spot] = @computer
      else
        spot = get_best_move(@board, @computer)
        get_player_spot(spot, @computer)
      end
    end
    puts "The computer moved to space #{spot}"
  end

  def get_player_spot(spot, player)
    if @board[spot] != "X" && @board[spot] != "O"
      @board[spot] = player
    else
      spot = nil
    end
  end

  def get_best_move(board, next_player, depth = 0, best_score = {})
    available_spaces = []
    best_move = nil
    board.each do |space|
    if space != "X" && space != "O"
      available_spaces << space
    end
  end
  available_spaces.each do |as|
    board[as.to_i] = @computer
    if game_is_over(board)
      set_best_move(as, board, best_move)
    else
      board[as.to_i] = @human
      if game_is_over(board)
        set_best_move(as, board, best_move)
      else
        board[as.to_i] = as
      end
    end
  end
  if best_move
    return best_move
  else
    n = rand(0..available_spaces.count)
    return available_spaces[n].to_i
  end
end

  def set_best_move(as, board, best_move)
    best_move = as.to_i
    board[as.to_i] = as
    return best_move
  end

  def game_is_over(board)
    [board[0], board[1], board[2]].uniq.length == 1 ||
    [board[3], board[4], board[5]].uniq.length == 1 ||
    [board[6], board[7], board[8]].uniq.length == 1 ||
    [board[0], board[3], board[6]].uniq.length == 1 ||
    [board[1], board[4], board[7]].uniq.length == 1 ||
    [board[2], board[5], board[8]].uniq.length == 1 ||
    [board[0], board[4], board[8]].uniq.length == 1 ||
    [board[2], board[4], board[6]].uniq.length == 1
  end

  def tie(board)
    board.all? { |s| s == "X" || s == "O" }
  end

  def play_again
    puts "Would you like to play again [Y/N]"
    answer = nil
    until answer
      answer = gets.chomp.capitalize
      if answer == "Y"
        game = Game.new
        return game.play_game
      else answer == "N"
        puts "Thanks for playing!"
      end
    end
  end

end

game = Game.new
game.play_game
