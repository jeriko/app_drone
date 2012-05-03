module AppDrone
class Responderz < Drone
  desc "DRY up your controllers"
  category :controller

  depends_on :bundle
  
  def align
    bundle.add 'responders'
  end

  def execute
    do! :install
  end

end
end
