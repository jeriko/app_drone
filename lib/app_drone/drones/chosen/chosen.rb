module AppDrone
class Chosen < Drone
  desc 'Installs the Chosen plugin by HarvestHQ'
  depends_on :bundle, :stylesheet, :javascript
  pairs_with :flair

  def align
    bundle.add 'chosen-rails'
    stylesheet.pipeline 'chosen'
    javascript.pipeline 'chosen-jquery'
    javascript.on_ready "$('.chzn-select').chosen();"
    flair!
  end
end
end
