module AppDrone
class Flair < Drone
  desc "Creates a page to demonstrate the drones' hard work"
  depends_on :high_voltage, :slim_view

  attr_accessor :flairs

  def setup
    self.flairs = []
  end

  def add(klass)
    flairs << klass.class.to_s.gsub('AppDrone::','').underscore.to_sym
  end

  def execute
    do! :flair_page
  end

  def flair_for(drone_name)
    drone = send(drone_name)
    return drone.render('flair.html.slim')
  end
end

class Drone
  def flair!
    flair.add(self) if pair?(:flair)
  end
end

end
