class Player
  attr_accessor :nickname
    @@player_counter = 0
    
  def initialize
    @@player_counter += 1
    puts 'What is your name?'
    self.nickname = gets.chomp
    @player_number = @@player_counter
  end

  def my_nickname
    puts "Your nickname is: #{nickname}"
  end

  def player_num
    puts "You are player number: #{@player_number}"
  end
 
end