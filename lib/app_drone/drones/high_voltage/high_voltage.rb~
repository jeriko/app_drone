module AppDrone
class HighVoltage < Drone
  desc "DANGER! Super-simple static webpages"
  category :base
  depends_on :bundle

  def align
    bundle.add 'high_voltage'
  end

  def execute
    do! :create_pages_directory
  end
end
end
