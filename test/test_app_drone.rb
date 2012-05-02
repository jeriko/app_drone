require 'test/unit'
require 'app_drone'

module AppDrone

# I know this isn't full testing, but I can't get the CLI to work
# (due to the requires), so this is my only way of testing the damn
# thing semi-manually

# I'd love some advice on proper testing methods for this sort of thing.
# Comparing generator code to preset expectations seems awfully brittle?

class AppDroneTest < Test::Unit::TestCase

  def setup
  end

  def test_dependants
    d = AppDrone::Bundle.dependants
    puts AppDrone::Drone.drones
  end

  def test_basic_behavior
    template = Template.new
    add_defaults_to_template(template)

    template.add :nested_form

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

  def test_dependency_chain_satisfaction
    # single dependency
    assert_equal DependencyChain.satisfied?([AppDrone::Stylesheet]), false
    assert_equal DependencyChain.satisfied?([AppDrone::Stylesheet,AppDrone::Bundle]), true

    # complex dependency
    chain = [AppDrone::Bootstrap, AppDrone::Javascript, AppDrone::Stylesheet, AppDrone::Flair]
    assert_equal DependencyChain.satisfied?(chain), false

    chain << AppDrone::Bundle
    assert_equal DependencyChain.satisfied?(chain), false

    chain << AppDrone::SlimView
    assert_equal DependencyChain.satisfied?(chain), false

    chain << AppDrone::HighVoltage
    assert_equal DependencyChain.satisfied?(chain), true
  end

  def test_dependency_chain_sorting
    chain = [AppDrone::Bootstrap, AppDrone::Flair, AppDrone::SlimView, AppDrone::Javascript, AppDrone::Stylesheet, AppDrone::Bundle, AppDrone::HighVoltage]
    sorted_chain = [AppDrone::Bundle, AppDrone::SlimView, AppDrone::Javascript, AppDrone::Stylesheet, AppDrone::Bootstrap, AppDrone::HighVoltage, AppDrone::Flair]
    assert_equal DependencyChain.sort(chain), sorted_chain
  end

 private
  def add_defaults_to_template(template)
    defaults = [:bundle, :javascript, :stylesheet, :slim_view, :high_voltage, :flair, :cleanup]
    defaults.each { |drone| template.add(drone) }
  end

end

end
