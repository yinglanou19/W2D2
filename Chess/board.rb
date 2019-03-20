require_relative "piece.rb"
require "byebug"

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8) }
    @board.each do |row|
      (0...board.length).each do |j|
        row[j] = NullPiece.instance
      end
    end
    #White Pieces 
    @board[0][0] = Rook.new("white", self, [0, 0])
    @board[0][7]=Rook.new("white", self, [0, 7])
    @board[0][1]=Knight.new("white", self, [0, 1])
    @board[0][6]=Knight.new("white", self, [0, 6])
    @board[0][2]=Bishop.new("white", self, [0, 2])
    @board[0][5]=Bishop.new("white", self, [0, 5])
    @board[0][3]=Queen.new("white", self, [0,3])
    @board[0][4]=King.new("white", self, [0,4]) 
    @board[1][0]=Pawn.new("white", self, [1, 0]) 
    @board[1][1]=Pawn.new("white", self, [1, 1]) 
    @board[1][2]=Pawn.new("white", self, [1, 2]) 
    @board[1][3]=Pawn.new("white", self, [1, 3]) 
    @board[1][4]=Pawn.new("white", self, [1, 4]) 
    @board[1][5]=Pawn.new("white", self, [1, 5]) 
    @board[1][6]=Pawn.new("white", self, [1, 6]) 
    @board[1][7]=Pawn.new("white", self, [1, 7]) 

    #Black Pieces 
    @board[7][0]=Rook.new("black", self, [7, 0])
    @board[7][7]=Rook.new("black", self, [7, 7])
    @board[7][1]=Knight.new("black", self, [7, 1])
    @board[7][6]=Knight.new("black", self, [7, 6])
    @board[7][2]=Bishop.new("black", self, [7, 2])
    @board[7][5]=Bishop.new("black", self, [7, 5])
    @board[7][3]=Queen.new("black", self, [7,3])
    @board[7][4]=King.new("black", self, [7,4]) 
    @board[6][0]=Pawn.new("black", self, [6, 0]) 
    @board[6][1]=Pawn.new("black", self, [6, 1]) 
    @board[6][2]=Pawn.new("black", self, [6, 2]) 
    @board[6][3]=Pawn.new("black", self, [6, 3]) 
    @board[6][4]=Pawn.new("black", self, [6, 4]) 
    @board[6][5]=Pawn.new("black", self, [6, 5]) 
    @board[6][6]=Pawn.new("black", self, [6, 6]) 
    @board[6][7]=Pawn.new("black", self, [6, 7]) 
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
    raise StandardError if self[start_pos] == nil
    # raise StandardError if !valid_move?(end_pos)
  end

  def valid_pos?(pos) #[x,y]
    x = pos[0]
    y = pos[1]
    return false if x < 0 || x > 7 || y < 0 || y > 7
    return true
  end
end
