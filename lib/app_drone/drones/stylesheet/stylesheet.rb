module AppDrone
class Stylesheet < Drone
  desc "Generates application.css.sass with manifest options and imports"
  category :base
  depends_on :bundle

  attr_accessor :pipeline_requires, :imports
  def pipeline(r); self.pipeline_requires << r end
  def import(i); self.imports << i end

  def setup
    self.pipeline_requires = []
    self.imports = []
  end

  def align
    bundle.add 'therubyracer'
    bundle.add 'compass-rails'
    self.import 'compass'
  end

  def execute
    do! :application_sass
  end

end
end
