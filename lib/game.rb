require_relative 'player'
require_relative 'board'

class Game
  attr_accessor :p1, :p2, :round

  def initialize
    self.p1 = Player.new
    self.p2 = Player.new
    @game_score = {}
    @winner = false
    @filled_positions = []
    @player_turn = self.p1
    self.round = Board.new("#{self.p1.nickname}", "#{self.p2.nickname}")
  end

  def current_score
    puts "#{self.p1.nickname} vs. #{self.p2.nickname}: #{@game_score[self.p1.nickname]} : #{@game_score[self.p2.nickname]}"
  end
  
  def get_turn
    puts "#{@player_turn.nickname}, make your move. Choosa a position number from 1 to 9:"
    valid = false
    turn = 0
    until valid do
      turn = gets.chomp.to_i
      if turn >= 1 and turn <= 9
        if @filled_positions.include?(turn)
          puts "This position already filled. Try another one!"
        else
          valid = true
        end
      else
        puts "Incorrect input. Choose a number form 1 to 9"
      end 
    end
    
    @filled_positions << turn
    result = self.round.engine(turn, @player_turn.symbol)
    if result == false
      if @player_turn == self.p1
        @player_turn = self.p2
      else
        @player_turn = self.p1
      end
    end
    result
  end

  def replay
    puts 'Another game? (Y/n)'
    valid = false
    until valid do
      decision = gets.chomp
      if decision == "Y"
        @winner = false
        @filled_positions = []
        s1 = self.p1.symbol
        if s1 == "X"
          self.p1.assign_symbol("O")
          self.p2.assign_symbol("X")
          @player_turn = self.p2
        elsif s1 == "O"
          self.p1.assign_symbol("X")
          self.p2.assign_symbol("O")
          @player_turn = self.p1
        end
        valid = true
        return true
      elsif decision == "n"
        puts "Have a nice day!"
        valid = true
        return false
      else 
        puts "Incorrect input! You have to choose between 'Y' or 'n'. Try again!"
      end
    end
  end

  def new_round
    self.round = Board.new("#{self.p1.nickname}", "#{self.p2.nickname}")
    puts "Now playing: #{self.p1.nickname} (#{self.p1.symbol}) vs. #{self.p2.nickname} (#{self.p2.symbol})"
    self.round.render_board
    turn_counter = 0
    while @winner == false do
      if turn_counter == 9
        puts 'DRAW!!!!'
        current_score
        break
      end
      @winner = self.get_turn
      turn_counter += 1
    end
    
    if @winner == true
      puts "#{@player_turn.nickname}, you are a winner!"
      if @player_turn == self.p1
        @game_score[self.p1.nickname] += 1
      else
        @game_score[self.p2.nickname] += 1
      end
      current_score
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