module AppDrone
class NiftyGeneratorz < Drone
  desc "A collection of useful Rails generator scripts"
  category :misc

  depends_on :bundle
  
  param :nifty_config, :boolean, info: 'generate a config YAML file and loader'

  def align
    bundle.add 'nifty-generators', group: :development
  end

  def execute
    do! :nifty_config if param(:nifty_config)
  end

end
end
