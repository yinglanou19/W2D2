require_relative "piece.rb"
require "byebug"

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8) }
    @board.each do |row|
      (0...board.length).each do |j|
        row[j] = NullPiece.new
      end
    end
    @board[0][0] = TestPiece.new
    # @board[7][0] = "rook"
    # @board[0][7] = "rook"
    # @board[7][7] = "rook"
    # @board[1][0] = "knight"
    # @board[6][0] = "knight"
    # @board[1][7] = "knight"
    # @board[6][7] = "knight"
    # @board[5][0] = "bishop"
    # @board[2][0] = "bishop"
    # @board[5][7] = "bishop"
    # @board[2][7] = "bishop"
    # @board[3][0] = "queen"
    # @board[3][7] = "queen"
    # @board[4][7] = "king"
    # @board[4][0] = "king"
    # @board[1][0] = "pawn"
    # @board[1][1] = "pawn"
    # @board[1][2] = "pawn"
    # @board[1][3] = "pawn"
    # @board[1][4] = "pawn"
    # @board[1][5] = "pawn"
    # @board[1][6] = "pawn"
    # @board[1][7] = "pawn"
    # @board[6][0] = "pawn"
    # @board[6][1] = "pawn"
    # @board[6][2] = "pawn"
    # @board[6][3] = "pawn"
    # @board[6][4] = "pawn"
    # @board[6][5] = "pawn"
    # @board[6][6] = "pawn"
    # @board[6][7] = "pawn"
  end

  def []=(position_array, value)
    x, y = position_array
    @board[x][y] = value
  end

  def [](position_array)
    x, y = position_array
    return @board[x][y]
  end

  def move_piece(start_pos, end_pos)
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    # x, y = start_pos
    # m, n = end_pos
    # board[x][y], board[m][n] = board[m][n], board[x][y]
    raise StandardError if board[start_pos] == nil
    # raise StandardError if !valid_move?(end_pos)
  end

  def valid_pos?(pos) #[x,y]
    x = pos[0]
    y = pos[1]
    return false if x < 0 || x > 7 || y < 0 || y > 7
    return true
  end
end
