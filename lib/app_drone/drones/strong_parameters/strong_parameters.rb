module AppDrone
class StrongParameters < Drone
  desc "Better parameter / mass-assignment protection"
  category :controller

  depends_on :bundle

  def align
    bundle.add 'strong_parameters'
  end

end
end
