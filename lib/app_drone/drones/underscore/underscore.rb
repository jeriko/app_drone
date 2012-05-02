module AppDrone
class Underscore < Drone
  desc "Adds the underscore.js utility belt to your app"
  category :ui

  depends_on :bundle

  def align
    bundle.add 'underscore-rails'
    javascript.pipeline 'underscore'
    flair!
  end

  def execute
  end

end
end
