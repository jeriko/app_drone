module AppDrone
class SlimView < Drone
  desc "Sets up application.html.slim with shiny goodness"
  # TODO integration with rack useragent for browser-detection

  depends_on :bundle

  def align
    bundle.add 'slim-rails'
  end

  def execute
    do! :application_slim
  end
end
end
