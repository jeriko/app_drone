module AppDrone
class EmberJs < Drone
  desc 'Installs ember.js for Rails'
  depends_on :bundle, :javascript

  param :app_skeleton, :boolean, info: 'build an Ember app skeleton'

  def align
    bundle.add 'ember-rails'
    javascript.pipeline_require 'ember'
  end

  def execute
    do! :install
  end

end
end
