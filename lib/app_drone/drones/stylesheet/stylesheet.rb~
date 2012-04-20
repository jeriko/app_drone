# Incomplete
module AppDrone
class Stylesheet < Drone
  desc "Generates application.css.sass with manifest options and imports"
  # TODO are manifests necessary? Favor @import

  attr_accessor :requires, :imports
  def add_require(r); self.requires << r end
  def add_import(i); self.imports << i end

  def setup
    self.requires = []
    self.imports = []
  end

  def align
    bundle.add 'therubyracer'
    bundle.add 'compass-rails'
    self.add_import 'compass'
  end

  def execute
    do! :application_sass
    # TODO currently using .scss and not .sass, switch to the cleaner syntax
    # TODO render css utils (or make this a separate integration)
  end

end
end
