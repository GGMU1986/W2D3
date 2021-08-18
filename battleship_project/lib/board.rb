class Board
    attr_reader :size

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

  def attack
    
  end
 
end
