require 'test/unit'
require 'app_drone'

module AppDrone

class AppDroneTest < Test::Unit::TestCase

  def setup
    @template = Template.new
  end

  # TODO template load path is broken

  def test_gems
    @template.add Gems, vendor: true
    puts Bootstrap.params
  end
end

end
