module AppDrone
class Sorcery < Drone
  desc "No-frills user authentication"
  category :auth

  depends_on :bundle

  param :configure, :boolean, info: 'generate core migration and User model'

  def align
    bundle.add 'sorcery'
  end

  def execute
    do! :configure if param(:configure)
  end
end
end
