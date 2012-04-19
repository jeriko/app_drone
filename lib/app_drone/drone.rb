module AppDrone

Param = Struct.new('Param',:name,:type,:options)

class Drone
  # align: set up variables, pass off to other scripts
  # execute: actual install process

  # New
  def initialize(template,*params)
    @template = template
    @params = params.first # weird.. no idea why
    setup
  end

  # DSL
  def ^; @template end
  def >>(klass); @template.hook(klass); end

  # Expected implementations
  def align; end
  def execute; end

  # Optional implementations
  def setup; end

  def render(partial)
    class_name = self.class.to_s.split('::').last.underscore
    template_path = "/drones/#{class_name}/#{partial}.erb"
    full_path = File.dirname(__FILE__) + template_path
    snippet = ERB.new File.read(full_path)
    output = snippet.result(binding)
    output = "# --- \n# #{self.class.to_s}\n# ---\n" + output if true
    return output
  end

  def do!(partial)
    @template.do! render(partial), self
  end

  # DSL: Integration-specific options
  attr_accessor :params
  class << self  
    def param(name, type, *options)
      (@params ||= []) << Param.new(name, type, options)
    end
    def params
      @params
    end

    def owns_generator_method(m); @generator_method = m end
    def generator_method; @generator_method end
  end

end

end
