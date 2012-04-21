require 'test/unit'
require 'app_drone'

module AppDrone

class AppDroneTest < Test::Unit::TestCase

  def setup
  end

  def test_basic_behavior
    template = Template.new
    template.add :bundle
    template.add :javascript
    template.add :stylesheet
    template.add :slim_view
    template.add :high_voltage
    template.add :showcase
    template.add :chosen
    template.add :cleanup
    template.render_to_file
  end

  def test_gems
    #template = Template.new
    #template.add :bundle
    #puts AppDrone::Bootstrap.params
    #@template.add Stylesheet
    #@template.add Javascript
    #@template.render_to_screen
  end
end

end
