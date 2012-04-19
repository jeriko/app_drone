module AppDrone
class FactoryGirl < Integration
  def align
    (self >> Gems).add 'factory_girl_rails', group: :test
  end

  def execute
    #TODO insert hook into rspec
  end
end
end
