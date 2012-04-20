# Incomplete
module AppDrone
class SimpleForm < Drone
  desc "Installs SimpleForm (with custom Bootstrap integration)"
  def align
    bundle.add 'simple_form'
    bundle.add 'country_select'
  end

  def execute
    # TODO bootstrap cross-integration
    do! :install
  end
end
end
