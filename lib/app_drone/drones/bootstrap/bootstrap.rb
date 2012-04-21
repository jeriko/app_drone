# Incomplete
module AppDrone
class Bootstrap < Drone
  desc "Installs Twitter Bootstrap stylesheets and javascripts"

  param :vendor, :boolean, info: 'download a local copy into the repo'
  param :responsive, :boolean, info: 'include responsive grid'

  depends_on :bundle, :stylesheet, :javascript
  pairs_with :simple_form

  def align
    bundle.add 'compass_twitter_bootstrap', group: :assets

    if param(:vendor)
      # TODO different require paths for stylesheet
    else
      stylesheet.import 'compass_twitter_bootstrap'
      stylesheet.import 'compass_twitter_bootstrap_responsive' if param(:responsive)
      # TODO js imports - based on options
    end
  end

  def execute
    if param(:vendor)
      # TODO pull files in via github
    end
  end

end
end
