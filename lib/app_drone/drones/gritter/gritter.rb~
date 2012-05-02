module AppDrone
class Gritter < Drone
  desc "Growl-like notifications for jQuery"
  category :ui

  depends_on :bundle, :stylesheet, :javascript
  pairs_with :flair

  def align
    bundle.add 'gritter'
    stylesheet.import 'gritter'
    javascript.pipeline 'gritter'
    flair!
  end

  def execute
    do! :install
  end

end
end
