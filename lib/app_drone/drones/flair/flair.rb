module AppDrone
class Flair < Drone
  desc "Creates a page to demonstrate the drones' hard work"
  depends_on :high_voltage, :slim_view
  category :base

  attr_accessor :flairs

  def setup
    self.flairs = []
  end

  def add(klass)
    flairs << klass.class.to_sym
  end

  def execute
    do! :flair_page
  end

  def flair_for(drone_name)
    drone = send(drone_name)
    return drone.render 'flair.html.slim', skip_stamp: true
  end
end


# extend drones so they can call `flair!` rather than the verbose method
# this pattern is useful for drones that take a single boolean parameter
# e.g. 
#   flair: do / don't flair, as opposed to
#   bootstrap: vendor, responsive, font_awesome...
class Drone
  def flair!
    flair.add(self) if pair?(:flair)
  end
end

end
