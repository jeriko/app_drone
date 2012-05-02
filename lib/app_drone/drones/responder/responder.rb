module AppDrone
class Responder < Drone
  desc "DRY up your controllers"
  category :requests

  depends_on :bundle
  
  def align
    bundle.add 'responders'
  end

  def execute
    do! :install
  end

end
end
