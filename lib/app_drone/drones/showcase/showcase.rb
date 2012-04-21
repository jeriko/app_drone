module AppDrone
class Showcase < Drone
  desc "Creates a page to demonstrate the drones' hard work"
  depends_on :high_voltage, :slim_view

  attr_accessor :showcases

  def setup
    self.showcases = []
  end

  def me!(klass)
    showcases << klass.class.to_s.gsub('AppDrone::','').underscore
  end

  def execute
    do! :showcase_page
  end

  def showcase_for(drone_name)
    showcase_path = File.join File.dirname(__FILE__), '..', drone_name, 'showcase.html.slim'
    snippet = ERB.new File.read(showcase_path)
    return snippet.result(binding)
  end
end

end
