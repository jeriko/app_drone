# Complete?
module AppDrone
class Rspec < Drone
  desc "Installs RSpec for testing"
  def align
    bundle.add 'rspec-rails', group: :test
  end

  def execute
    do! :install
  end
end
end
