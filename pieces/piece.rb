
class Piece

  attr_reader :color
  attr_accessor :board, :pos

  def initialize(pos, board, color)
    @pos, @board, @color = pos, board, color
  end

  def moves
  end

  def move_into_check?(pos)
  end

  def valid_moves
  end

  def inspect
  end
end