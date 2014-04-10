class Game
  def initialize(*players)
    if players.length < 2 || players.length > 8
      raise
    end
  end
end