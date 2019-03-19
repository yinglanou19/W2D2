require "colorize"
require_relative "cursor.rb"
require_relative "board.rb"

class Display
    attr_reader :cursor 

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render
    @board.board.each do |rows|
      rows.each do |ele|
        print ele.to_s
      end
    end
  end

  def test_board
    self.render
    @cursor.get_input
  end
end
