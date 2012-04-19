module AppDrone
class RankedModel < Drone
  def align
    (self >> Gems).add 'ranked_model'
  end
end
end
