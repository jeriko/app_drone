module AppDrone
class Cleanup < Drone
  def execute
    do! :cleanup
  end
end
end
