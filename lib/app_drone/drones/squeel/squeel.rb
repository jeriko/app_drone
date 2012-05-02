module AppDrone
class Squeel < Drone
  desc "Better ActiveRecord queries and relations"
  category :model

  param :generate_initializer, :boolean, info: 'customize Squeel functionality'

  depends_on :bundle

  def align
    bundle.add 'squeel'
  end

  def execute
    do! :initializer if param(:generate_initializer)
  end

end
end
