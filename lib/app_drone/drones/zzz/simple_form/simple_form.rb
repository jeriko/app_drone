# Incomplete
module AppDrone
class SimpleForm < Drone
  desc "Installs SimpleForm (with custom Bootstrap integration)"
  param :country_select, :boolean, info: 'Add country_select for listing countries'

  def align
    bundle.add 'simple_form'
    bundle.add 'country_select' if params[:country_select]
  end

  def execute
    # TODO bootstrap cross-integration
    do! :install
  end
end
end
