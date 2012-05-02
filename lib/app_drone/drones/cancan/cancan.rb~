module AppDrone
class Cancan < Drone
  desc "Role-based authorization"
  category :auth

  depends_on :bundle

  param :generate_abilities, :boolen, info: 'build the Ability.rb file'

  def align
    bundle.add 'cancan'
  end

  def execute
    do! :ability if param(:generate_abilities)
  end

end
end
