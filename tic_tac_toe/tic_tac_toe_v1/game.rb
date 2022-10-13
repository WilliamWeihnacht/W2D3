require_relative "board.rb"
require_relative "human_player.rb"
require "byebug"

class Game

    def initialize(p1_mark,p2_mark)
        @p1 = HumanPlayer.new(p1_mark)
        @p2 = HumanPlayer.new(p2_mark)
        @cur = @p1
    end

    def switch_turn
        if @cur == @p1
            @cur = @p2
        else
            @cur = @p1
        end
    end

    def play
        b = Board.new
        while b.empty_positions? do
            b.print_grid
            pos = @cur.get_position
            b.place_mark(pos,@cur.mark)
            if b.win?(@cur.mark)
                puts "#{@cur.mark} won, congrats!"
                return
            else
                switch_turn
            end
        end
    end

end

g = Game.new(:X,:O)
g.play