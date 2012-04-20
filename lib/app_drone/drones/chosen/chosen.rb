# Complete!
module AppDrone
class Chosen < Drone
  desc 'Installs the Chosen plugin from HarvestHQ'

  def align
    bundle.add 'chosen-rails'
    stylesheet.add_require 'chosen'
    javascript.add_require 'chosen-jquery'
    javascript.add_onready "$('.chzn-select').chosen();"
  end
end
end
