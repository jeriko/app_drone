module AppDrone
class RankedModel < Drone
  desc "Rank and sort your objects"
  category :model

  depends_on :bundle

  def align
    bundle.add 'ranked-model'
  end

end
end
