require "byebug"

class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  def self.valid_pegs?(arr)
    arr.all? { |ele| POSSIBLE_PEGS.keys.include?(ele.upcase) }  
  end

  def self.random(length)
    arr = []
    length.times { arr << POSSIBLE_PEGS.keys.sample }
    Code.new(arr)  
  end

  def self.from_string(pegs)
    Code.new(pegs.split(""))
  end

  def initialize(arr)
    if Code.valid_pegs?(arr)
      @pegs = arr.map(&:upcase)
    else
      raise "pegs are invalid"
    end
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    (0...guess.length).count {|i| @pegs[i] == guess[i] }
  end
  
  def num_near_matches(guess)
    arr_1 = []
    arr_2 = []

    i = 0

    guess.length.times do 
      if guess[i] != @pegs[i]
        arr_1 << guess[i]
        arr_2 << @pegs[i]
      end
      i += 1
    end
    arr_1.uniq.count { |ele| arr_2.include?(ele) }
  end

  def ==(guess)
    self.pegs == guess.pegs
  end
end


# 

# 
# guess_2 = ["R", "R", "B", "B"]
# new_pegs = ["R", "G", "B"]
#