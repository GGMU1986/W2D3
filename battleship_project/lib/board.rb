class Board
    attr_reader :size

    def self.print_grid(grid)
        grid.each do |row|
           puts row.join(" ")
        end
    end


  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  def [](pos)
    row = pos[0]
    col = pos[1]
    @grid[row][col]
  end

  def []=(pos, val)
    row = pos[0]
    col = pos[1]
    @grid[row][col] = val
  end

  def num_ships
    @grid.flatten.count { |ele| ele == :S }
  end

  def attack(pos)
    if self[pos] == :S
        self[pos] = :H
        puts "you sunk my battleship!"
        true
    else
       self[pos] = :X
       false 
    end 
  end

    def place_random_ships
        num = @size / 4
        n = Integer.sqrt(@size) 

        while num_ships < num
            pos = []
            pos << (0...n).to_a.sample
            pos << (0...n).to_a.sample
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |sub|
            sub.map do |ele|
                ele == :S ? :N : ele
            end
        end
    end
    
    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
end
