class Player
  attr_accessor :nickname, :symbol
  @@player_number = 0
    
  def initialize
    @@player_number += 1
    puts "Player number #{@@player_number}, what is your name?"
    self.nickname = gets.chomp
  end

  def assign_symbol(symb)
    self.symbol = symb
  end
end