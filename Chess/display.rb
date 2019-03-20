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
    # @board.board.each do |rows|
    #   rows.each do |ele|
    #     print ele.to_s
    #   end
    # end
    (0..7).each do |i|
      (0..7).each do |j|
        if @cursor.cursor_pos == [i, j]
          print @board[[i, j]].to_s.colorize(:color => :light_blue, :background => :red)
        else
          if (i.even? && j.even?) || (i.odd? && j.odd?)
            print @board[[i, j]].to_s.colorize(:color => :black, :background => :grey)
          else
            print @board[[i, j]].to_s.colorize(:color => :black, :background => :white)
          end
        end
      end

      puts ""
    end
  end

  def test_board
    while self.render
      @cursor.get_input
      system("clear")
    end
  end
end
