# frozen_string_literal: true

<<<<<<< HEAD
# this is a class for containing all the helper methods
=======
# this is a class that contains all the helpers methods
>>>>>>> 983b4d6f54f1ef842f5b229894f889aef5963744
class Helpers
  def valid_move?(board, index)
    index.between?(0, 8) && !position_taken?(board, index)
  end

  def position_taken?(board, index)
    if (board[index] == ' ') || (board[index] == '') || board[index].nil?
      false
    else
      true
    end
  end

  def input_to_index(input)
    input.to_i - 1
  end
end
