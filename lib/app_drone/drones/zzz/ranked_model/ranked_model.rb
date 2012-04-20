# Incomplete
module AppDrone
class RankedModel < Drone
  desc "Installs RankedModel"
  def align
    bundle.add 'ranked_model'
  end
end
end
