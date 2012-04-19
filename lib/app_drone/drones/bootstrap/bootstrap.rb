module AppDrone
class Bootstrap < Drone
  param :vendor, :boolean, info: 'download a local copy into the repo'
  param :responsive, :boolean, info: 'include responsive grid'

  #requires Gems, Stylesheets, Javascripts

  def align

    (self >> Gems).add 'compass_twitter_bootstrap', group: :assets

    if params[:vendor]
      # TODO different require paths for stylesheet
    else
      (self >> Stylesheets).add_import 'compass_twitter_bootstrap'
      (self >> Stylesheets).add_import 'compass_twitter_bootstrap_responsive' if params[:responsive]
      # TODO js imports - based on options
    end
  end

  def execute
    if params[:vendor]
      # TODO pull files in via github
    end
  end

end
end
