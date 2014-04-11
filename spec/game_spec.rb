require 'spec_helper'
require './lib/game'

describe Game do
  it "creates a game with two players named Horse and Car." do
    horse = Player.new('horse')
    car = Player.new('car')
    game = Game.new(horse, car)  
  end

  it "creates a game with less than 2 players fails" do
    horse = Player.new('horse')
    expect { Game.new(horse) }.to raise_error
  end

  it "creates a game with more than 8 players fails" do
    p = Player.new('test')
    expect { Game.new(p,p,p,p,p,p,p,p,p) }.to raise_error
  end

  it "creates a game with 2 players. Within 100 run both orders should occur" do
    horse = Player.new('horse')
    car = Player.new('car')
    car_horse = false
    horse_car = false
    100.times do 
      game = Game.new(horse, car)
        car_horse |= game.players == [car, horse]
        horse_car |= game.players == [horse, car]
    end
    expect(car_horse).to be_true
    expect(horse_car).to be_true
  end

end