# Incomplete
module AppDrone
class Bootstrap < Drone
  desc "Installs Twitter Bootstrap stylesheets and javascripts"
  category :ui

  param :vendor, :boolean, info: 'place a local copy of the files into the repo for customization'
  param :responsive, :boolean, info: 'include responsive grid'
  param :font_awesome, :boolean, info: 'use font-awesome for icons'

  # TODO js import options

  depends_on :bundle, :stylesheet, :javascript

  def align
    bundle.add 'compass_twitter_bootstrap', git: 'git://github.com/vwall/compass-twitter-bootstrap.git', group: :assets
    param(:vendor) ? align_vendor : align_bundle
    flair!
  end

  def execute
    param(:vendor) ? execute_vendor : execute_bundle
  end

 private
  def align_vendor
    # TODO import paths for stylesheet (different to bundle)
    # TODO js imports - based on options
  end

  def align_bundle
    stylesheet.import param(:font_awesome) ? 'compass_twitter_bootstrap_awesome' : 'compass_twitter_bootstrap'
    stylesheet.import 'compass_twitter_bootstrap_responsive' if param(:responsive)
    # TODO js imports - based on options
  end

  def execute_vendor
    # TODO pull files from git
  end

  def execute_bundle
    # TODO nothing
  end
end
end
