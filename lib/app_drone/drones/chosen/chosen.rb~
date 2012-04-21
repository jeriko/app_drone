module AppDrone
class Chosen < Drone
  desc 'Installs the Chosen plugin by HarvestHQ'
  depends_on :bundle, :stylesheet, :javascript

  def align
    bundle.add 'chosen-rails'
    stylesheet.pipeline 'chosen'
    javascript.pipeline 'chosen-jquery'
    javascript.on_ready "$('.chzn-select').chosen();"
    showcase.me! self
  end
end
end
