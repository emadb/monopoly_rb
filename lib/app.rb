require './lib/player'
require './lib/dice'
require './lib/go_space'
require './lib/spaces'
require './lib/game'


horse = Player.new('horse')
car = Player.new('car')
space_list = [GoSpace.new]
39.times do
  space_list << NormalSpace.new
end
spaces = Spaces.new(space_list)
dice = Dice.new(Die.new(6),Die.new(6))

game = Game.new(dice, spaces, horse, car)

10.times do |i|
  puts "turn: #{i}"
  game.play_turn
  puts "horse: #{horse.position}"
  puts "car: #{car.position}"
end

