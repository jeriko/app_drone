require 'test/unit'
require 'app_drone'

module AppDrone

# Yes, I know this isn't real testing, but I can't get the CLI to work
# (due to the requires), so this is my only way of testing the damn
# thing semi-manually

# I'd love some advice on proper testing methods for this sort of thing.
# Comparing generator code to preset expectations seems awfully brittle?

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
    template.add :flair
    template.add :simple_form
    template.add :bootstrap, font_awesome: true, responsive: true
    template.add :chosen
    template.add :ember, app_skeleton: true
    template.add :cleanup
    template.render_to_file
  end

  def test_drone_class_to_symbol
    drone_class = AppDrone::Bundle
    assert_equal drone_class.to_sym, :bundle
  end

  def test_symbol_to_drone_class
    drone_symbol = :bundle
    assert_equal drone_symbol.to_app_drone_class, AppDrone::Bundle
  end

end

end
