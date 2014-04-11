class Game
  def initialize(dice, boxes, *players)
    @dice = dice
    @boxes = boxes
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
      boxes = @dice.rolls
      p.advance(boxes)
    end
  end

  def play_game(turns)
    turns.times do
      play_turn
    end
  end
end