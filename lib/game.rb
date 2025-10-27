class Game
  def initialize
    @p1_name = Player.new
    @p2_name = Player.new
    @game_hash = {
      a: [0, 0, 0],
      b: [0, 0, 0],
      c: [0, 0, 0]
    }
    @game_score = {}
    # some intialization here
  end




end