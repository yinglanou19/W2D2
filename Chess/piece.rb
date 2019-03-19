class Piece
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end
end

class NullPiece < Piece
  def initialize
  end

  def to_s
    "N"
  end
end

class TestPiece < Piece
  def initialize
  end

  def to_s
    "t"
  end
end
