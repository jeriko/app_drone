require 'test/unit'
require 'app_drone'

module AppDrone

class AppDroneTest < Test::Unit::TestCase

  def setup
    @template = Template.new
  end

  def test_gems
    @template.add Gems, vendor: true
    puts Gems.params
  end
end

end
