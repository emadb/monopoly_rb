class Spaces
  def initialize (space_list)
    @space_list = space_list
  end
  def landed_by (player)
    @space_list[player.position].landed_by player
  end
end
