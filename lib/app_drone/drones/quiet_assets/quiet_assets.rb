module AppDrone
class QuietAssets < Drone
  desc "Silences console logging for assets in development"
  category :misc

  depends_on :bundle

  def align
    bundle.add 'quiet_assets', group: :development
  end

end
end
