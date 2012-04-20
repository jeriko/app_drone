# Incomplete
module AppDrone
class SlimView < Drone
  desc "Sets up application.html.slim with shiny goodness"
  # TODO accepts :options # header etc.

  def align
    bundle.add 'slim-rails'
  end

  def execute
    do! :application_slim
  end
end
end
