module AppDrone
class Cleanup < Drone
  desc "Removes some default Rails files that aren't very useful"
  def execute
    do! :cleanup
  end
end
end
