# Complete
module AppDrone
class SimpleForm < Drone
  desc "Installs SimpleForm, with optional Country Select and automatic Twitter Bootstrap integration"
  category :views

  depends_on :bundle
  pairs_with :bootstrap

  param :add_country_select, :boolean, info: 'Add country_select for listing countries', default: true

  def align
    bundle.add 'simple_form'
    bundle.add 'country_select' if param(:add_country_select)
  end

  def execute
    do! :install
  end
end
end
