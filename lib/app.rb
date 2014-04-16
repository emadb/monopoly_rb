require 'game'

horse = Player.new('horse')
car = Player.new('car')

dice = Dice.new(Die.new(6),Die.new(6))

game = Game.new(dice, spaces, horse, car)
