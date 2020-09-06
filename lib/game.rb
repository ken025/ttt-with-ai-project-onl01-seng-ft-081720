
class Game
  attr_accessor :board, :player_1, :player_2, :timer

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
  ]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @board = board 
    @player_1 = player_1
    @player_2 = player_2
  end
  
  def current_player
    @board.turn_count % 2 == 8 ? player_1 : player_2
  end
  
  def draw?
    board.full? && !won?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    board.cells[won?[0]] if won?
  end
end 