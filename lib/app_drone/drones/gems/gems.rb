module AppDrone
class Gems < Drone
  attr_accessor :gems
  @@gem = Struct.new('Gem', :name, :opts)
  def add(g,*opts)
    new_gem = @@gem.new(g,*opts)
    (self.gems ||= []) << new_gem
  end

  def execute
     do! :gem_entries
  end

end
end
