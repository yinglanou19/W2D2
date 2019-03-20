require "Singleton"
require_relative "board.rb"

class Piece
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end
end

class NullPiece < Piece
  include Singleton

  def initialize
  end

  def to_s
    "   "
  end
end

module Slideable
  def moves
    possible_moves = []
    self.move_dirs.each do |diff|
      add = true
      x = diff[0]
      y = diff[1]
      #on the board
      if (@pos[0] + diff[0]).between?(0, 7) && (@pos[1] + diff[1]).between?(0, 7)
        # going up
        if x == 0 && y > 0
          (1..y).each do |temp_y_value|
            if @board[[@pos[0], (@pos[1] + temp_y_value)]] != NullPiece.instance
              add = false
            end
          end
        # going down
        elsif x == 0 && y < 0
          (1..-y).each do |temp_y_value|
            if @board[[@pos[0], (@pos[1] - temp_y_value)]] != NullPiece.instance
              add = false
            end
          end
        # going right
        elsif y == 0 && x > 0
          (1..x).each do |temp_x_value|
            if @board[[(@pos[0] + temp_x_value), @pos[1]]] != NullPiece.instance
              add = false
            end
          end
        # going left
        elsif y == 0 && x < 0
          (1..-x).each do |temp_x_value|
            if @board[[(@pos[0] - temp_x_value), @pos[1]]] != NullPiece.instance
              add = false
            end
          end
        # diagonal upright
        elsif x > 0 && y > 0
          (1..x).each do |temp_xy_value|
            if @board[[@pos[0] + temp_xy_value, @pos[1] + temp_xy_value]] != NullPiece.instance
              add = false
            end
          end
        # diagonal downleft
        elsif x < 0 && y < 0
          (1..-x).each do |temp_xy_value|
            if @board[[@pos[0] - temp_xy_value, @pos[1] - temp_xy_value]] != NullPiece.instance
              add = false
            end
          end
        # diagonal upleft
        elsif x < 0 && y > 0
          (1..y).each do |temp_xy_value|
            if @board[[@pos[0] - temp_xy_value, @pos[1] + temp_xy_value]] != NullPiece.instance
              add = false
            end
          end
        # diagonal downright
        elsif x > 0 && y < 0
          (1..x).each do |temp_xy_value|
            if @board[[@pos[0] + temp_xy_value, @pos[1] - temp_xy_value]] != NullPiece.instance
              add = false
            end
          end
        end
        possible_moves << [@pos[0] + x, @pos[1] + y] if add
      end
      
    end
    possible_moves
  end

  private

  def mov_dirs
  end

  def grow_unblocked_moves_in_dir(dx, dy)
  end
end

module Stepable
  def moves
    possible_moves = []
    self.move_diffs.each do |diff|
      x = @pos[0] + diff[0]
      y = @pos[1] + diff[1]
      if x.between?(0, 7) && y.between?(0, 7)
        possible_moves << [x, y]
      end
    end
    possible_moves
  end

  private

  def move_diffs
    arr = self.move_diffs
  end
end

class Bishop < Piece
  include Slideable

  def to_s
    if @color == "white"
      " ♗ "
    else
      " ♝ "
    end
  end

  def symbol
  end

  def move_dirs
    bishop_slides = []
    (1..7).each do |i|
      bishop_slides << [i, i]
      bishop_slides << [-i, i]
      bishop_slides << [i, -i]
      bishop_slides << [-i, -i]
    end
    bishop_slides
  end
end

class Rook < Piece
  include Slideable

  def to_s
    if @color == "white"
      " ♖ "
    else
      " ♜ "
    end
  end

  def symbol
  end

  def move_dirs
    rook_slides = []
    (1..7).each do |i|
      rook_slides << [i, 0]
      rook_slides << [0, i]
      rook_slides << [-i, 0]
      rook_slides << [0, -i]
    end
    rook_slides
  end
end

class Queen < Piece
  include Slideable

  def to_s
    if @color == "white"
      " ♕ "
    else
      " ♛ "
    end
  end

  def symbol
  end

  def move_dirs
    queen_slides = []
    (-7..-1).each do |i|
      queen_slides << [i, i]
      queen_slides << [-i, i]
      queen_slides << [i, 0]
      queen_slides << [0, i]
    end
    (1..7).each do |i|
      queen_slides << [i, i]
      queen_slides << [-i, i]
      queen_slides << [i, 0]
      queen_slides << [0, i]
    end

    queen_slides
  end
end

class Knight < Piece
  include Stepable

  def to_s
    if @color == "white"
      " ♘ "
    else
      " ♞ "
    end
  end

  def symbol
  end

  def move_diffs
    knight_moves = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
  end
end

class King < Piece
  include Stepable
  include Slideable

  def to_s
    if @color == "white"
      " ♔ "
    else
      " ♚ "
    end
  end

  def symbol
  end

  def move_diffs
    king_steps = [[0, 1], [1, 0], [0, -1], [-1, 0]]
  end

  def move_dirs
    king_slides = [[1, 1], [-1, -1], [-1, 1], [1, -1]]
  end
end

class Pawn < Piece
  def to_s
    if @color == "white"
      " ♙ "
    else
      " ♟ "
    end
  end

  def symbol
  end

  def move_dirs
  end

  def at_start_row?
  end

  def forward_dir
  end

  def forward_steps
  end

  def side_attacks
  end
end
