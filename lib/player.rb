class Player
  def initialize(name, starting_position = 0)
    @position = starting_position
  end

  def advance(dice)
    @position = (@position + dice) % 40
  end

  def position
    @position
  end
end