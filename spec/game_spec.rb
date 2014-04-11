require 'spec_helper'
require './lib/game'

describe Game do
  it "creates a game with two players named Horse and Car." do
    horse = Player.new('horse')
    car = Player.new('car')
    game = Game.new(nil, nil, horse, car)  
  end

  it "creates a game with less than 2 players fails" do
    horse = Player.new('horse')
    expect { Game.new(nil, nil, horse) }.to raise_error
  end

  it "creates a game with more than 8 players fails" do
    p = Player.new('test')
    expect { Game.new(nil, nil, p,p,p,p,p,p,p,p,p) }.to raise_error
  end

  it "creates a game with 2 players. Within 100 run both orders should occur" do
    horse = Player.new('horse')
    car = Player.new('car')
    car_horse = false
    horse_car = false
    100.times do 
      game = Game.new(nil, nil, horse, car)
      car_horse |= game.players == [car, horse]
      horse_car |= game.players == [horse, car]
    end
    expect(car_horse).to be_true
    expect(horse_car).to be_true
  end

  it "creates a game and play a turn. Players should move" do
    dice = double('dice')
    dice.stub(:rolls => 7)
    horse = Player.new('horse')
    car = Player.new('car')
    game = Game.new(dice, nil, horse, car)
    game.play_turn
    expect(horse.position).not_to eq(0)
    expect(car.position).not_to eq(0)
  end

  it "creates a game and play a complete game. Players should move 20 times" do
    dice = double('dice')
    dice.stub(:rolls => 1)
    horse = Player.new('horse')
    car = Player.new('car')
    game = Game.new(dice, nil, horse, car)
    game.play_game(20)
    expect(horse.position).to eq(20)
    expect(car.position).to eq(20)
  end

  it "During a turn a Player lands on Go and their balance increases by $200." do
    dice = double('dice')
    dice.stub(:rolls => 3)
    horse = Player.new('horse')
    car = Player.new('car')
    boxes = ['foo', 'bar', 'go']
    game = Game.new(dice, boxes, horse, car)
    game.play_turn
    expect(car.balance).to eq(200)

  end

end