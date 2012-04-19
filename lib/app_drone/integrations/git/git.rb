module AppDrone
class Git < Integration
  def execute
    do! :install
  end
end
end
