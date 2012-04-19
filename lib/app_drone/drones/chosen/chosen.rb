module AppDrone
class Chosen < Drone
  def align
    (self >> Gems).add 'chosen-rails'
    (self >> Stylesheets).add_require 'chosen'
    (self >> Javascripts).add_require 'chosen-jquery'
    (self >> Javascripts).add_onready "$('.chzn-select').chosen();"
  end
end
end
