require_relative 'game'
require_relative 'player'

class Board
  attr_accessor :player1, :player2, :gamehash
  def initialize(p1, p2)
    self.player1 = p1
    self.player2 = p2
    self.gamehash = {
      a: ['_', '_', '_'],
      b: ['_', '_', '_'],
      c: ['_', '_', '_']
    }
    @filled = []
    @current_turn = 1
    @winner = nil
  end

  def whos_turn?
    if @current_turn.odd?
      self.player1
    else
      self.player2
    end
  end

  def whos_win?
    @winner
  end

  def render_board
    self.gamehash.each do |k, v|
      row = ""
      v.each do |position|
        row += " #{position} |"
      end
      puts "#{row}"
    end
  end

  def row_check(hash)
    winner = false
    hash.each do |k,v|
      if v.include?("X") or v.include?("O")
        v.each_cons(3) do |s1, s2, s3|
          if s1 == s2 and s2 == s3
            winner = true
            break
          end
        end
      end
    end
    winner
  end

  def winning_condition(hash)
    winner = row_check(hash)
    if winner == false
      vertical = Hash.new { |h,k| h[k] = [] }
      diagonal = Hash.new { |h,k| h[k] = [] }
      row = 0
      hash.each do |k, v|
        row += 1
        v.each_cons(3) do |symb1, symb2, symb3|
          vertical[:a] << symb1
          vertical[:b] << symb2
          vertical[:c] << symb3
          case row
          when 1
            diagonal[:a] << symb1
            diagonal[:b] << symb3
          when 2
            diagonal[:a] << symb2
            diagonal[:b] << symb2
          when 3
            diagonal[:a] << symb3
            diagonal[:b] << symb1
          end
        end
      end
      winner = row_check(vertical)
      if winner == false
        winner = row_check(diagonal)
      end
    end
    if winner == false && @current_turn == 10
      winner = nil
    end
  winner
  end

  def validate_turn(turn)
    unless @filled.include?(turn)
      true
    end
  end

  def engine(t)
    i = 0
    proxy_hash = Hash.new { |h,k| h[k] = []}
    self.gamehash.each do |k, v|
      v.each_with_index do |position, index|
        i += 1
        if i == t
          proxy_hash[k] << whos_turn?.symbol
        else
          proxy_hash[k] << position
        end
      end
    end
    self.gamehash = proxy_hash
    render_board
    result = winning_condition(self.gamehash)
    if result == true
      @winner = whos_turn?
    end
    @current_turn += 1
    @filled << t
    result
  end
end