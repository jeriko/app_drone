module AppDrone
class Chronic < Drone
  desc "Natural language date parsing"
  category :misc

  depends_on :bundle

  def align
    bundle.add 'chronic'
  end

end
end
