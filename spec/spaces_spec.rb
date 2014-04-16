require 'spec_helper'
require_relative '../lib/spaces'

describe Spaces do
  before :each do
    @space = double('go_space')
    @space_list = [nil, @space, nil]
  end

  it "player enters a space" do
    horse = Player.new('horse', starting_position:1)
    spaces = Spaces.new(@space_list)
    @space.should_receive(:landed_by).with(horse)
    
    spaces.landed_by(horse)
  end

end

