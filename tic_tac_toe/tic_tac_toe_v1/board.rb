require "byebug"

class Board

    def initialize
        @grid = Array.new(3) {Array.new(3,"_")}
    end

    def valid?(pos)
        return @grid[pos[0],pos[1]] != nil
    end

    def empty?(pos)
        if @grid[pos[0]][pos[1]] == "_"
            return true
        end
        return false
    end

    def place_mark(pos,mark)
        if valid?(pos) && empty?(pos)
            @grid[pos[0]][pos[1]] = mark
        else
            raise StandardError.new
            puts "can't place a mark there"
        end
    end

    def print_grid
        @grid.each do |row|
            row.each do |ele|
                print ele
            end
            puts
        end
    end

    def win_row?(mark)
        win = false
        @grid.each do |row|
            count = 0
            row.each do |ele|
                count += 1 if ele == mark
            end
            win = true if count == 3
        end
        return win
    end

    def win_col?(mark)
        win = false
        (0...3).each do |x|
            count = 0
            (0...3).each do |y|
                count += 1 if @grid[y][x] == mark
            end
            win = true if count == 3
        end
        return win
    end
       
    def win_diagonal?(mark)
        win = false
        i = 0
        count = 0
        while i < 3
            count += 1 if @grid[i][i] == mark
            i+=1
        end
        win = true if count == 3
        win = true if @grid[0][2] == mark && @grid[1][1] == mark && @grid[2][0] == mark
        return win
    end

    def win?(mark)
        return true if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        (0...3).each do |x|
            (0...3).each do |y|
                return true if empty?([x,y])
            end
        end
        false
    end



end