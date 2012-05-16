module AppDrone
class HamlView < Drone
  desc "An alternative to SlimView. Do not install both."

  category :view
  depends_on :bundle

  def align
    bundle.add 'haml-rails'
  end

  def execute
    do! :application_haml
  end
end
end
