module AppDrone
class Dragonfly < Drone
  desc "Rack framework for on-the-fly image handling"
  category :uploads

  depends_on :bundle

  def align
    bundle.add 'rack-cache', require: 'rack/cache'
    bundle.add 'dragonfly'
  end

  def execute
    do! :initializer
  end

end
end
