module AppDrone
class HAML < Drone
  desc "Sets up application.html.haml"

  category :base
  depends_on :bundle

  def align
    bundle.add "haml"
    bundle.add "haml-rails"
  end

  def execute
    do! :application_haml
  end
end
end