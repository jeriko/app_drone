require 'test/unit'
require 'app_drone'

module AppDrone

class AppDroneTest < Test::Unit::TestCase

  def setup
    @template = Template.new
  end

  def test_gems
    @template.add Bundle
    @template.add Stylesheet
    @template.add Javascript
    @template.add Bootstrap, vendor: true
    @template.render_to_screen
  end
end

end
