module AppDrone
class Html5PlaceholderShim < Drone
  desc "HTML5 placeholder support for older browsers"
  category :shim

  depends_on :javascript, :git

  def align
    javascript.pipeline 'jquery.html5-placeholder-shim'
    git.fetch github: 'jcampbell1/jquery-html5-placeholder-shim'
  end

  def execute
    do! :copy_to_assets
  end

end
end
