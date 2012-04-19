module AppDrone
class Rspec < Drone
  def align
    (self >> Gems).add 'rspec-rails', group: :test
  end

  def execute
    do! :install
  end
end
end
