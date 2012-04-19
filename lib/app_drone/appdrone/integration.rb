Param = Struct.new('Param',:name,:type,:options)

class Integration
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
    template_path = "./integrations/#{self.class.underscore}/#{partial}.erb"
    snippet = ERB.new File.read(template_path)
    output = snippet.result(binding)
    output = "# --- \n# #{self.class.to_s}\n# ---\n" + output if true
    return output
  end

  def do!(partial)
    @template.do! render(partial)
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
  end

end
