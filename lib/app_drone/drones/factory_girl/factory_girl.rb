# Incomplete
module AppDrone
class FactoryGirl < Drone
  desc "Installs Factory Girl for test fixtures"
  def align
    bundle.add 'factory_girl_rails', group: :test
  end

  def execute
    #TODO insert hook into rspec
  end
end
end
