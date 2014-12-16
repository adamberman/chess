# encoding: UTF-8
require 'colorize'
require './pieces.rb'

class Board

  attr_accessor :rows

  def initialize
    @rows = Array.new(8) { Array.new(8) }
    populate_board
  end

  def self.in_bounds?(pos)
    pos.all? { |x| x.between?(0, 7) }
  end

  def populate_board
    self[[0,0]] = Rook.new([0,0], self, :b)
    self[[1,0]] = Knight.new([1,0], self, :b)
    self[[2,0]] = Bishop.new([2,0], self, :b)
    self[[3,0]] = Queen.new([3,0], self, :b)
    self[[4,0]] = King.new([4,0], self, :b)
    self[[5,0]] = Bishop.new([5,0], self, :b)
    self[[6,0]] = Knight.new([6,0], self, :b)
    self[[7,0]] = Rook.new([7,0], self, :b)

    self[[0,7]] = Rook.new([0,7], self, :w)
    self[[1,7]] = Knight.new([1,7], self, :w)
    self[[2,7]] = Bishop.new([2,7], self, :w)
    self[[3,7]] = Queen.new([3,7], self, :w)
    self[[4,7]] = King.new([4,7], self, :w)
    self[[5,7]] = Bishop.new([5,7], self, :w)
    self[[6,7]] = Knight.new([6,7], self, :w)
    self[[7,7]] = Rook.new([7,7], self, :w)

    (0..7).each do |i|
      self[[i, 1]] = Pawn.new([i,1], self, :b)
      self[[i, 6]] = Pawn.new([i,6], self, :w)
    end

  end

  def [](pos)
    x, y = pos
    @rows[y][x]
  end

  def []=(pos, piece)
    x, y = pos
    @rows[y][x] = piece
  end

  def display
    rows.size.times do |row|
      rows.size.times do |col|
        print "#{self.rows[row][col].inspect}" unless self.rows[row][col] == nil
      end
      puts ""
    end
  end

  def in_check?(color)
  end

  def move(start_pos, end_pos)
    piece = self[start_pos]
    if !piece.moves.include?(end_pos)
      puts "You can't move there!!"
    elsif self[start_pos].nil?
      puts "You didn't select a piece!"
    else
      self[end_pos].nil?
      self[end_pos] = self[start_pos]
      self[start_pos] = ""
    end
  end
end

board = Board.new
board.move([1, 7], [0,5])
board.display