require 'spec_helper'
require './lib/player'

describe Player do
  it "is on beginning location, rolls 7, ends up on location 7" do
    player = Player.new('horse')
    player.advance(7)
    player.position.should eq(7)
  end

  it "is on location numbered 39, rolls 6, ends up on location 5" do
    player = Player.new('horse', 39)
    player.advance(6)
    player.position.should eq(5)
  end
end