module AppDrone
class Flair < Drone
  desc "Creates a page to demonstrate the drones' hard work"
  depends_on :high_voltage, :slim_view

  attr_accessor :flairs

  def setup
    self.flairs = []
  end

  def add(klass)
    flairs << klass.class.to_s.gsub('AppDrone::','').underscore
  end

  def execute
    do! :flair_page
  end

  def flair_for(drone_name)
    flair_path = File.join File.dirname(__FILE__), '..', drone_name, 'flair.html.slim'
    snippet = ERB.new File.read(flair_path)
    return snippet.result(binding)
  end
end

class Drone
  def flair!
    flair.add(self)
  end
end

end
