module AppDrone
class Rspec < Integration
  def align
    (self >> Gems).add 'rspec-rails', group: :test
  end

  def execute
    do! :install
  end
end
end
