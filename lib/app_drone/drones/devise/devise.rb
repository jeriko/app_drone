module AppDrone
class Devise < Drone
  desc "Flexible authentication solution for Rails with Warden"
  category :auth
 
  depends_on :bundle

  def align
    bundle.add 'devise'
  end

  def execute
    do! :install
  end

end
end
