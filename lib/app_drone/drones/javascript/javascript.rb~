# Incomplete
module AppDrone
class Javascript < Drone
  desc "Generates application.js.coffee with manifest options and jQuery load hooks"
  attr_accessor :requires, :onreadies

  def setup
    self.requires = []
    self.onreadies = []
    self.add_require 'jquery'
    self.add_require 'jquery_ujs'
    self.add_require 'jquery-ui' # TODO if ui, otherwise vendor
  end

  def add_require(r); self.requires << r end
  def add_onready(r); self.onreadies << r end

  def execute
    do! :application_coffee
  end

end
end
