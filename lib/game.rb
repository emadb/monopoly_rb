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
      p.advance(@dice.rolls)
      #boxes.process_player p
      if p.position == @boxes.index('go') + 1
        p.add_money(200)
      end
    end
  end

  def play_game(turns)
    turns.times do
      play_turn
    end
  end
end