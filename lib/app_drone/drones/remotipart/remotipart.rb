module AppDrone
class Remotipart < Drone
  desc "AJAX file uploads with jQuery"
  category :uploads

  depends_on :bundle, :javascript

  def align
    bundle.add 'remotipart'
    javascript.pipeline 'jquery.remotipart'
  end

end
end
