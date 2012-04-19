class Stylesheets < Integration
  attr_accessor :requires, :imports

  def setup
    self.requires = []
    self.imports = []
    (self >> Gems).add 'compass-rails'
    self.add_import 'compass'
  end

  def add_require(r); self.requires << r end
  def add_import(i); self.imports << i end

  def align
    (self >> Gems).add 'therubyracer'
  end

  def execute
    do! :application_sass
    # TODO currently using .scss and not .sass, switch to the cleaner syntax
    # TODO render css utils (or make this a separate integration)
  end

end
