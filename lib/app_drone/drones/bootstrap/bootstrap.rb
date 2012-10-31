# Incomplete
module AppDrone
class Bootstrap < Drone
  desc "Installs Twitter Bootstrap stylesheets and javascripts"
  category :ui

  param :responsive, :boolean, info: 'include responsive grid'
  param :font_awesome, :boolean, info: 'use font-awesome for icons'#, default: true
  param :javascript_plugins, :choose_many, info: 'pipeline javascript plugin files', default: [], choices: %w(transition modal dropdown scrollspy tab tooltip popover alert button collapse carousel typeahead affix)

  depends_on :bundle, :stylesheet, :javascript
  pairs_with :flair

  def align
    bundle.add 'bootstrap-sass', group: :assets
    bundle.add 'font-awesome-sass-rails', group: :assets if param(:font_awesome)
    stylesheet.import 'bootstrap'
    stylesheet.import 'font-awesome' if param(:font_awesome)
    param(:javascript_plugins).each { |p| javascript.pipeline "bootstrap-#{p}" }
    flair!
  end

end
end
