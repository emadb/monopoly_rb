class Player
  def initialize(name, starting_position: 0)
    @position = starting_position
    @balance = 0
  end

  def advance(dice)
    @position = (@position + dice) % 40
  end

  def position
    @position
  end

  def balance
    @balance
  end

  def add_money (value)
    @balance += value
  end
end