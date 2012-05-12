module AppDrone
class NestedForm < Drone
  desc "Conveniently manage multiple models in a single form"
  category :views

  depends_on :bundle, :javascript

  def align
    bundle.add 'nested_form', git: 'git://github.com/ryanb/nested_form.git'
    javascript.pipeline 'jquery_nested_form'
  end

end
end
