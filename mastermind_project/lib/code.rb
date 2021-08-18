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
    count = 0

    (0...guess.length).each do |i|
      if guess[i] != @pegs[i] && @pegs.include?(guess[i])
        count += 1 
      end
    end
    
    count 
  end

  def ==(guess)
    self.pegs == guess.pegs
  end
end

  # @pegs = ["R", "G", "R", "B"]
  # guess_1 = ["R", "G", "B", "B"] - 0
  # guess_2 = ["R", "R", "B", "B"] - 1
  # guess_3 = ["G", "R", "R", "R"] - 2
  
  # p num_near_matches(guess)
  #new_pegs = ["R", "G", "B"]