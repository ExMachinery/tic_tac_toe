require_relative 'player'
require_relative 'board'

class Game
  attr_accessor :p1, :p2, :round

  def initialize
    self.p1 = Player.new
    self.p2 = Player.new
    @game_score = {}
    @p1cross = true
    self.round = Board.new("#{self.p1.nickname?}", "#{self.p2.nickname?}")
  end
  
  def get_turn
    symbol = "X"
    if @p1cross == true
      puts "#{self.p1.nickname?}, your turn"
    else
      puts "#{self.p2.nickname?}, your turn"
      symbol = "O"
    end
    turn = gets.chomp
    self.round.engine(turn.to_i, symbol)
  end
  
  def new_game
    round.start(self)
  end

end