module AppDrone
class Gon < Drone
  desc "Data porting from controller to client-side"
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
