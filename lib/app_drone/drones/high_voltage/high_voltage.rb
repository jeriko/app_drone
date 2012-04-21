module AppDrone
class HighVoltage < Drone
  desc "DANGER! Super-simple static webpages"
  category :pages
  depends_on :bundle

  def align
    bundle.add 'high_voltage'
  end

  def execute
    do! :create_pages_directory
  end
end
end
