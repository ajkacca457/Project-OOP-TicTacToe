# this is a class for setting basic game logic
class Game
  WINNING_COMBO = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [6, 4, 2],
    [0, 4, 8]
  ].freeze

  def won?(board)
    WINNING_COMBO.find do |item|
      board[item[0]] == board[item[1]] &&
        board[item[1]] == board[item[2]] &&
        board[item[0]] != ' '
    end
  end

  def draw?(turn_count)
    turn_count >= 9
  end

  def over?(board, turn_count)
    won?(board) || draw?(turn_count)
  end
end
