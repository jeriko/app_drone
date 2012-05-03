module AppDrone
class NewRelic < Drone
  desc "App performance monitoring"
  category :misc # TODO :production

  depends_on :bundle

  def align
    bundle.add 'newrelic_rpm'
  end

end
end
