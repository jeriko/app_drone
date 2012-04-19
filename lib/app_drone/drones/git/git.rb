module AppDrone
class Git < Drone
  def execute
    do! :install
  end
end
end
