module AppDrone
class Carrierwave < Drone
  desc "Classy file uploads"
  category :uploads

  depends_on :bundle

  param :fog, :boolean, info: 'Install Fog for cloud storage'

  def align
    bundle.add 'carrierwave'
    bundle.add 'fog' if param(:fog)
  end

  def execute
    notify! 'Create "config/initializers/fog.rb" and load your Fog credentials into Carrierwave!' if param(:fog)
  end

end
end
