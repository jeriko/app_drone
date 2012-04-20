# Incomplete
module AppDrone
class Bootstrap < Drone
  desc "Installs Twitter Bootstrap stylesheets and javascripts"
  param :vendor, :boolean, info: 'download a local copy into the repo'
  param :responsive, :boolean, info: 'include responsive grid'

  depends_on :bundle, :stylesheet, :javascript

  def align
    bundle.add 'compass_twitter_bootstrap', group: :assets

    if params[:vendor]
      # TODO different require paths for stylesheet
    else
      stylesheet.add_import 'compass_twitter_bootstrap'
      stylesheet.add_import 'compass_twitter_bootstrap_responsive' if params[:responsive]
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
