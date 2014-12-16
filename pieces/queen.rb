require './pieces/sliding_pieces.rb'

class Queen < SlidingPiece
  def move_bounds
    [
        [1, 0], [1, 1],
        [0, 1], [-1, 0],
        [-1, 1], [0, -1],
        [-1, -1], [1, -1]
    ]
  end

  def inspect
    color == :w ? "♕ " : "♛ "
  end
end

