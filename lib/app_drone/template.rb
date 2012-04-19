class AppDrone::Template
  def initialize; @integrations = {}; @directives = [] end

  def add(klass,*params)
    @integrations[klass] = klass.new(self, params.first) # no idea why `.first` is required..
  end

  def i_objects; @integrations.values end
  def i_classes; @integrations.keys end
  def hook?(klass); @integrations[klass].nil? end
  def hook(klass)
    raise "No such integration: #{klass}" unless i_klass = @integrations[klass]
    return i_klass
  end
  
  def do!(d); @directives << d end
  
  def render!
    return unless @directives.empty?
    i_objects.map(&:align)
    i_objects.map(&:execute)
  end

  def render_with_wrapper
    render!
    template_path = './lib/template.erb'
    snippet = ERB.new File.read(template_path)
    return snippet.result(binding)
  end

  def render_to_screen
    render!
    puts render_with_wrapper
  end

  def render_to_file
    render!
    File.open('out.rb','w+') do |f|
      f.write(render_with_wrapper)
    end
  end
  
end
