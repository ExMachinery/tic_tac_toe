require_relative 'player'
require_relative 'board'

class Game
  attr_accessor :p1, :p2, :round

  def initialize
    self.p1 = Player.new
    self.p2 = Player.new
    @game_score = {}
    @p1_move = true
    @winner = false
    self.round = Board.new("#{self.p1.nickname?}", "#{self.p2.nickname?}")
  end
  
  def get_turn
    symbol = "X"
    if @p1_move == true
      puts "#{self.p1.nickname?}, your turn!"
      @p1_move = false
    else
      puts "#{self.p2.nickname?}, your turn!"
      symbol = "O"
      @p1_move = true
    end
    turn = gets.chomp
    result = self.round.engine(turn.to_i, symbol)
    result
  end
  
  def new_game
    puts "Now playing: #{self.p1.nickname?} vs. #{self.p2.nickname?}"
    self.round.render_board
    while @winner == false do
      @winner = self.get_turn
    end
  end

end