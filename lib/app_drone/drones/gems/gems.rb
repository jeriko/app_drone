module AppDrone
class Gems < Drone
  owns_generator_method :gemfile

  attr_accessor :gems
  @@gem = Struct.new('Gem', :name, :opts)

  def setup
    self.gems = []
  end

  def add(g,*opts)
    self.gems << @@gem.new(g,*opts)
  end

  def execute
     do! :gem_entries
  end

end
end
