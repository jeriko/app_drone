module AppDrone
class Gon < Drone
  desc "Growl-like notifications for jQuery"
  category :controller

  depends_on :bundle, :javascript
  pairs_with :slim_view

  def align
    bundle.add 'gon'
  end

  def execute
  end

end
end
