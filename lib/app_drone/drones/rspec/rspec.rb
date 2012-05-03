module AppDrone
class Rspec < Drone
  desc "Behaviour Driven Development"
  category :test

  depends_on :bundle

  def align
    bundle.add 'rspec-rails', group: %w(development test)
  end

  def execute
    do! :install
  end

end
end
