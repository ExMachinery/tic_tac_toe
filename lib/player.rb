class Player
  attr_accessor :nickname
  @@player_number = 0
    
  def initialize
    @@player_number += 1
    puts "Player number #{@@player_number}, what is your name?"
    self.nickname = gets.chomp
  end

  def nickname?
    self.nickname
  end
end