class Player
  def initialize(starting_position)
    @position = starting_position
  end

  def advance(dice)
    @position = (@position + dice) % 40
  end

  def position
    @position
  end
end