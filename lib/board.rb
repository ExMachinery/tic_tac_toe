require_relative 'game'

class Board
  attr_accessor :player1, :player2, :gamehash
  def initialize(p1nick, p2nick)
    self.player1 = p1nick
    self.player2 = p2nick
    self.gamehash = {
      a: ['_', '_', '_'],
      b: ['_', '_', '_'],
      c: ['_', '_', '_']
    }
    # @board = []
    @gameid = 0
  end

  def render_board(hash)
    hash.each do |k, v|
      row = ""
      v.each do |position|
        row += " #{position} |"
      end
      puts "#{row}"
    end
  end

  def winning_condition
    #Here i need a logic to check for winning condition
  end

  def engine(t, symb)
    i = 0
    proxy_hash = Hash.new { |h,k| h[k] = []}
    self.gamehash.each do |k, v|
      v.each_with_index do |position, index|
        i += 1
        if i == t
          proxy_hash[k] << symb
        else
          proxy_hash[k] << position
        end
      end
    end
    self.gamehash = proxy_hash
    render_board(self.gamehash)
    # Check .winning_condition if false, go next turn. If true 
    # Надо метод расчета отделить, чтобы вызывать его каждый раз, когда надо изменить борд
    # Каждую t надо сохранять в array, чтобы передавать его Game. Сверяясь с ней, он будет понимать, свободны ли эти ячейки. 
    # Метод Engine может возвращать результат и Game буддет понимать, что надо продолжать играть. Тогда избавимся от уродливого
    # @gameid и get_turn отсюда.
  end

  def start(id)
    @gameid = id
    puts "Now playing: #{self.player1} vs. #{self.player2}"
    render_board(self.gamehash)
    @gameid.get_turn
  end
end

