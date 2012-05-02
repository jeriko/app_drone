module AppDrone
class EasyRolez < Drone
  desc "Add roles to your User models"
  category :auth
 
  depends_on :bundle

  def align
    bundle.add 'easy_roles'
  end

end
end
