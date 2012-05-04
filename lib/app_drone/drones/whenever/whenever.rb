module AppDrone
class Whenever < Drone
  desc "Clear syntax for writing and deploying cron jobs"
  category :misc

  depends_on :bundle

  def align
    bundle.add 'whenever', require: false
  end

  def execute
    do! :wheneverize
  end

end
end
