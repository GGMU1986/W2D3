class Board
    def initialize
        @grid = Array.new(3) { Array.new(3, "_") }
    end

    def valid?(position)
        row = position[0]
        col = position[1]
        return true if (0..2).include?(row) && (0..2).include?(col)
        raise "That position is out of bounds! Try again!"
    end

    # def [](pos)
    #     row = pos[0]
    #     col = pos[1]
    #     @grid[row][col]
    # end

    # def []=(pos, val)
    #     row = pos[0]
    #     col = pos[1]
    #     @grid[row][col] = val
    #  end

    def empty?(position)
        self[position] == "_"
    end

    def place_mark(position, mark)
        if valid?(position) && empty?(position)
            self[position] = mark
        else
            raise "that position is already occupied, please choose a vacant space!"
        end
    end

    def print
        @grid.each do |row|
            puts row.join(" | ")
        end
    end

    def win_row?(mark)
        @grid.any? { |row| row.uniq == [mark] }
    end

    def win_col?(mark)
        @grid.transpose.any? { |col| col.uniq == [mark] }
    end
end
