module AppDrone
class HasScope < Drone
  desc "Filter controller actions with scopes"
  category :controller

  depends_on :bundle

  def align
    bundle.add 'has_scope'
  end

end
end
