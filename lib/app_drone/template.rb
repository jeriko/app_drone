class AppDrone::Template
  def initialize; @drones = {}; @directives = [] end

  def add(klass,*params)
    @drones[klass] = klass.new(self, params.first) # no idea why `.first` is required..
  end

  def drone_objects; @drones.values end
  def drone_classes; @drones.keys end
  def hook?(klass); @drones[klass].nil? end
  def hook(klass)
    raise "No such drones: #{klass}" unless i_klass = @drones[klass]
    return i_klass
  end
  
  def do!(d); @directives << d end
  
  def render!
    return unless @directives.empty?
    drone_objects.map(&:align)
    drone_objects.map(&:execute)
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
