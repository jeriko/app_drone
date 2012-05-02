module AppDrone
class NestedForm < Drone
  desc "Conveniently manage multiple models in a single form"
  category :views

  depends_on :bundle

  def align
    bundle.add 'nested_form'
    javascript.pipeline 'jquery_nested_form'
  end

end
end
