# AppDrone

Avoid the mundane.

AppDrone aims to take the bore out of setting up a Rails app just the way you like it. It's a code library that builds generator code that builds your Rails app code - R A I L S C E P T I O N!

If you're super lazy, a shiny UI for choosing drones and options is coming soon! Right now, it's CLI only :P


## Installation

Add this line to your application's Gemfile:

    gem 'app_drone'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install app_drone


## Usage

Build up your template with the drones you want to include, and then render the full generator script to file. When creating a new Rails app, pass in the generator file path with `rails new --builder=path/to/file`, and voila!

    t = AppDrone::Template.new
    t.add AppDrone::Bundle
    t.add AppDrone::Stylesheet
    t.add AppDrone::Javascript
    t.add AppDrone::Bootstrap, vendor: true
    t.render_to_file
    # => out.rb

Drones may have dependencies, which are defined on the class, using the `depends_on` method:
    class AppDrone::MyDrone < Drone
      depends SuperDrone, YourMom
    end

Note that most drones depend on Bundle, Stylesheet and Javascript. See a list of drone dependencies with `AppDrone::DroneClass.dependencies`, e.g.:
    AppDrone::Bootstrap.dependencies
    # => [AppDrone::Bundle, AppDrone::Stylesheet, AppDrone::Javascript]


## How does it work?

Drones are simple classes that implement `align` and `execute` methods. When a template is rendered, `align` is called on each included drone in turn (to set up inter-dependencies), and then `execute` outputs drone code for the generator file.

Each drone lives in it's own folder in `lib/app_drone/drones`, and can include `.erb` templates that are rendered into the main generator template by calling `do! :template_name`. Usually, this would happen in the `execute` function.

Optionally, a `setup` method can be defined to get new drones in order (triggered on Drone.new), e.g. initializing variables and so on.

You can also use `desc` in the class declaration to explain what the drone does (mostly for shiny UI purposes), and supply optional params with `param :param_name, :type, *opts` that the drone accepts to modify its behaviour.

Drones can talk to eachother via a proxy on the template they are included in, using the class name as a reference - note that the class instance of the parent template is actually referenced, not the static class. For example, a drone might contain the following code:
    def align
      (self >> Bundle).add 'my_gem'
      (self >> Stylesheet).add_import 'shiny_sheet'
    end

For convenience, `method_missing` is used to allow you to use the underscore'd name of a class to talk to it's template instance directly:
    def align
      bundle.add 'my_gem'
      stylesheet.add_import 'shiny_sheet'
    end

Take a look at existing drones for more info!


## An important reminder

AppDrone is not for everyone. It's highly opinionated about how a Rails app should be laid out, but is the fruit of tons of research into best practices and maintainability. AppDrone leans especially heavily on Sass, Compass, Coffeescript and Slim.


## Active Drones

(not quite working yet!)

- Bootstrap
- Bundle
- Chosen
- Cleanup
- FactoryGirl
- Git
- Guard
- Javascript
- RankedModel
- RSpec
- SimpleForm
- SlimView
- Stylesheet


## TODO Drones

(I'll get there some day!)

- SlimViews: Add browser-specific classes to <html>
- UserAgent blocking script
- Responders
- HasScope
- Pagination
- CarrierWave (and optional cloud resizing thingy)
- Airbrake + API Key
- rails-best-practices (and the other output gem for debugging)
- NewRelic
- EngineYard for deployment
- jQuery shims
- Backbone integration + Skim
- Ember.js integration
- Pivotal tracker
- pie.htc for IE
- HTML5 shim for IE


## Contributing

I'd love it if you could get involved! Feel free to suggest improvements, drones you'd like developed, or help me get test coverage up to scratch :)

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

=======
