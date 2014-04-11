class Game
  def initialize(*players)
    if players.length < 2 || players.length > 8
      raise
    end
    @players = players.shuffle
  end

  def players
    @players 
  end
end