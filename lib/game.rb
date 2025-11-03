require_relative 'player'
require_relative 'board'

class Game
  attr_accessor :p1, :p2, :round

  def initialize
    self.p1 = Player.new
    self.p2 = Player.new
    @game_score = {}
    @winner = false
  end

  def current_score
    puts "#{self.p1.nickname} vs. #{self.p2.nickname}: #{@game_score[self.p1.nickname]} : #{@game_score[self.p2.nickname]}"
  end
  
  def get_turn
    puts "#{self.round.whos_turn?.nickname}, make your move. Choose a position number from 1 to 9:"
    valid = false
    turn = 0
    until valid do
      turn = gets.chomp.to_i
      if turn >= 1 and turn <= 9
        valid = self.round.validate_turn(turn)
          if valid == false
            puts "Position is filled. Try another one!"
          end
      else
        puts "Incorrect input! Choose a position number from 1 to 9:"
      end
    end
    turn
  end

  def replay
    puts 'Another game? (Y/n)'
    valid = false
    until valid do
      decision = gets.chomp
      if decision == "Y"
        @winner = false
        s1 = self.p1.symbol
        if s1 == "X"
          self.p1.assign_symbol("O")
          self.p2.assign_symbol("X")
        else
          self.p1.assign_symbol("X")
          self.p2.assign_symbol("O")
        end
        return true
      elsif decision == "n"
        puts "Have a nice day!"
        return false
      else 
        puts "Incorrect input! You have to choose between 'Y' or 'n'. Try again!"
      end
    end
  end

  def new_round
    if self.p1.symbol == "X"
      self.round = Board.new(self.p1, self.p2)
    else
      self.round = Board.new(self.p2, self.p1)
    end

    puts "Now playing: #{self.round.player1.nickname} (#{self.round.player1.symbol}) vs. #{self.round.player2.nickname} (#{self.round.player2.symbol})"
    self.round.render_board
    while @winner == false do
      turn = get_turn
      @winner = self.round.engine(turn)
    end
    
    if @winner == true
      puts "#{self.round.whos_win?.nickname}, you are a winner!"
      if self.round.whos_win? == self.p1
        @game_score[self.p1.nickname] += 1
      else
        @game_score[self.p2.nickname] += 1
      end
      current_score
    end

    if @winner == nil
      puts "DRAW!!!"
    end
  end
  
  def new_game
    self.p1.assign_symbol("X")
    self.p2.assign_symbol("O")
    @game_score[self.p1.nickname] = 0
    @game_score[self.p2.nickname] = 0
    one_more = true
    while one_more == true do
      new_round
      one_more = replay
    end
  end
end
