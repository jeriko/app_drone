module AppDrone
class FactoryGirl < Drone
  desc "Test fixtures"
  category :test

  depends_on :bundle

  def align
    bundle.add 'factory_girl_rails', group: %w(development test)
  end

end
end
