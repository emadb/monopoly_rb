class Game
  def initialize(dice, spaces, *players)
    @dice = dice
    @spaces = spaces
    if players.length < 2 || players.length > 8
      raise
    end
    @players = players.shuffle
  end

  def players
    @players
  end

  def play_turn
    @players.each do |p|
      p.advance(@dice.roll)
      @spaces.landed_by p
    end
  end

  def play_game(turns)
    turns.times do
      play_turn
    end
  end
end
