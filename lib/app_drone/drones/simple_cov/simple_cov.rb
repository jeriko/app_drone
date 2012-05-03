module AppDrone
class SimpleCov < Drone
  desc "Code coverage for Ruby 1.9, with RSpec integration"
  category :test

  depends_on :bundle
  pairs_with :rspec
  run_after :rspec

  def align
    bundle.add 'rspec'
    bundle.add 'simplecov', require: false, group: :test
  end

  def execute
    do! :install
    do! :rspec_integration if pair?(:rspec)
  end

end
end
