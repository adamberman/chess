require './pieces/piece.rb'

class Pawn < Piece

  attr_accessor :first_move

  def initialize(pos, board, color)
    @first_move = true
    super
  end

  def move_bounds
    [[0, 1], [1, 1], [-1, 1]]
  end

  def moves
    positions = []
    pos_dup = pos.dup
    direction = color == :w ? -1 : 1
    x = pos_dup[0]
    y = pos_dup[1] + direction

    if Board.in_bounds?([x, y]) && board[[x, y]].nil?
      positions << [x, y]
    end

    unless board[[x - 1, y]].nil? || board[[x - 1, y]].color == color
      positions << [x-1, y]
    end

    unless board[[x + 1, y]].nil? || board[[x + 1, y]].color == color
      positions << [x + 1, y]
    end

    positions << [x, y + direction] if first_move

    first_move = false

    positions
  end

  def inspect
    color == :w ? "♙ " : "♟ "
  end

end