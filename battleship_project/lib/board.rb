require "byebug"

class Board

    def initialize(n)
        @n = n
        @grid = Array.new(n) {Array.new(n,:N)}
        @size = n * n
    end

    def size
        @size
    end

    def [](arr)
        @grid[arr[0]][arr[1]]
    end

    def []=(pos,val)
        @grid[pos[0]][pos[1]] = val
    end

    def num_ships
        count = 0
        @grid.each do |x|
           x.each do |y|
                if y == :S
                    count += 1
                end
            end
        end
        count
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts "you sunk my battleship!"
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        while self.num_ships < (@size*0.25) do
            loc = [rand(0...@n),rand(0...@n)]
            self[loc] = :S
        end
    end

    def hidden_ships_grid
        arr = []
        @grid.each do |row|
            new_row = []
            row.each do |ele|
                if ele == :S
                    new_row << :N
                else
                    new_row << ele
                end
            end
            arr << new_row
        end
        arr
    end

    def self.print_grid(grid)
        grid.each do |row|
            i = 0
            while i < row.length
                print row[i]
                if row[i+1] != nil
                    print " "
                end
                i += 1
            end
            puts
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
  
end
