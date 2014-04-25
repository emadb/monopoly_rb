class Game
  attr_reader :players

  def initialize(dice, spaces, *players)
    @dice = dice
    @spaces = spaces
    if players.length < 2 || players.length > 8
      raise
    end
    @players = players.shuffle
  end

  # TODO: move this to the Player class
  def play_turn
    @players.each do |p|
      dice = @dice.roll
      move_player p, dice
      @spaces.landed_by p
    end
  end

  def move_player(player, dice)
    dice.times do
      player.goto_next_space
      @spaces.entered_by player
    end
  end

  def play_game(turns)
    turns.times do
      play_turn
    end
  end
end
