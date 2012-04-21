# Complete!
module AppDrone
class Chosen < Drone
  desc 'Installs the Chosen plugin from HarvestHQ'

  def align
    bundle.add 'chosen-rails'
    stylesheet.pipeline 'chosen'
    javascript.pipeline 'chosen-jquery'
    javascript.on_ready "$('.chzn-select').chosen();"
  end
end
end
