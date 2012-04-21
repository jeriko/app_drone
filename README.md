# AppDrone

**Avoid the mundane.**

## Overview

AppDrone aims to take the bore out of setting up a Rails app just the way you like it. It's a code library that builds generator code that builds your Rails app code - R A I L S C E P T I O N!

*If you're super lazy, a shiny UI for choosing and configuring drones is coming soon! Right now, it's CLI only :P*


## Installation

Add this line to your application's `Gemfile`:

    gem 'app_drone'

And then execute:

    $ bundle

Or install it yourself:

    $ gem install app_drone


## Usage

### Create a new template
    
    require 'app_drone'
    t = AppDrone::Template.new

### Add drones

    t.add AppDrone::Bundle
    t.add AppDrone::StyleSheet

Parameters can be used to modify drone behavior:

    t.add AppDrone::Bootstrap, vendor: true
    
To list parameters for a specific drone:

    AppDrone::Bootstrap.params
    # => #<struct Struct::Param name=:vendor, type=:boolean, options={:info=>"download a local copy into the repo"}>
    # => #<struct Struct::Param name=:responsive, type=:boolean, options={:info=>"include responsive grid"}>

For readability, you can use the symbol shorthand instead of full class name:

    t.add :factory_girl  # adds AppDrone::FactoryGirl


### Render template

Once you've loaded and configured your drones, the template can be rendered to screen or file:

    t.render_to_file
    # => out.rb

Dependencies are automatically checked, and a template will not render unless the drone requirements are all satisfied.

    AppDrone::Bootstrap.dependencies
    # => [AppDrone::Bundle, AppDrone::Stylesheet, AppDrone::Javascript]

*Note that most drones depend on `Bundle`, `Stylesheet` and `Javascript`.*


### Active drones

To list all available drones:

    Drone.drones
    # => [:stylesheet, :javascript, :slim_view, :cleanup, :bundle]

*Note: these are the underscored versions, not the class names.*


## Underneath the hood

Drones are simple classes that implement `align` and `execute` methods. When a template is rendered, `align` is called on each included drone in turn (to set up inter-dependencies), and then `execute` outputs drone code for the generator file.

Each drone lives in it's own folder in `lib/app_drone/drones`, and can include `.erb` templates that are rendered into the main generator template by calling `do! :template_name`. Usually, this would happen in the `execute` function.

Optionally, a `setup` method can be defined to set up variables etc. when a drone instance is created.


### Describing a drone

You can use `desc` in the class declaration to explain what the drone does (mostly for shiny UI purposes)

    class AppDrone::MyDrone < AppDrone::Drone
      desc 'Kills all humans.'
    end


### Drone dependencies

    class AppDrone::MyDrone < AppDrone::Drone
      depends_on DeathRay, YourMom
    end

    AppDrone::MyDrone.dependencies
    # => [AppDrone::DeathRay, AppDrone::YourMom]


### Drone pairings

Pairing is weaker than a dependency. A template will not render without its dependencies, but pairs are optional inclusions to add extra params and behavior in the presence of another drone.

    class AppDrone::BarbraStreisand < AppDrone::Drone
      depends_on :bobby_davis_jr
      pairs_with :celine_dion

      param :wear_human_suit_over_mechaskin, :boolean, info: 'Wear the human disguise'
      param_with :celine_dion, :celine_in_rehab, :boolean, info: 'Is she currently in rehab?'

      def align
        bobby_davis_jr.say 'Hi'
        bobby_davis_jr.introduce 'This is Celine Dion' if pair?(:celine_dion)
        self.get_changed if param(:wear_human_suit_over_mechaskin)
      end

      def execute
        do! :duet_with_bobby
        if pair?(:celine_dion)
          do! :coke_with_celine unless param(:celine_in_rehab)
        end
      end
      
    end

### Drone behavior parameters

    class AppDrone::MyDrone < AppDrone::Drone
      param :lazer_color, :string, rainbow: ['all','teh','colors!']
    end
    
    AppDrone::MyDrone.params
    # => [#<struct Struct::Param name=:lazer_color, type=:string, options=[{:rainbow=>["all","teh","colors!"]}]>]
    
    t = AppDrone::Template.new
    t.add :my_drone, lazer_color: 'teh'


A drone may also declare a parameter that is only to be used in presence of a dependency.

You can also use `param_with` to specify a parameter that is expected in presence of a pair:

    class AppDrone::EddieIzzard
      desc 'Professional transvestite'

      pairs_with :heels
      param_with :heels, :wearing_heels, :boolean, default: true

      def align
        # defaults to true in the presence of :heels dependency
        if pair?(:heels) && param(:wearing_heels)
          puts "I am a professional transvestite, so I can run about in heels and not fall over."
          puts "Cause if a woman falls over wearing heels, that’s embarrassing."
          puts "But if a bloke falls over wearing heels, you have to kill yourself."
          puts "It’s the end of your life. 
        end
      end

    end


### Drone communication

Drones can talk to eachother via a proxy on the template they are included in, using the class name as a reference:

    class AppDrone::MyDrone < AppDrone::Drone
      def align
        (self >> Bundle).add 'my_gem'
        (self >> Stylesheet).add_import 'shiny_sheet'
      end
    end

*Note that the class instance of the parent template is messaged, not the static class.*

For convenience, `method_missing` is used to allow you to use the underscore'd name of a class to talk to it's template instance directly:

    class AppDrone::MyDrone < AppDrone::Drone
      def align
        bundle.add 'my_gem'
        stylesheet.add_import 'shiny_sheet'
      end
    end

**Take a look at existing drones for more info!**


### An important reminder

AppDrone is not for everyone. It's highly opinionated about how a Rails app should be laid out, but is the fruit of tons of research into best practices and maintainability. AppDrone leans especially heavily on Sass, Compass, Coffeescript and Slim. Buyer beware.



## Drones

### Active drones (put 'em to work!)

- Bundle
- Stylesheet (Sass & Compass)
- Javascript (Coffescript & jQuery)
- SlimView
- HighVoltage
- Chosen, by harvestHQ
- Bootstrap, by Twitter
- SimpleForm (with optional Country Select and automatic Twitter Bootstrap integration)
- Flair (drones use this to demonstrate their working functionality)
- Cleanup


### Frozen drones (currently in development)

- RankedModel
- Git
- RSpec
- FactoryGirl
- Guard

### Future drones (TODO - I'll get there some day!)

- Stylesheet utils
- SlimViews: Add browser-specific classes to <html> via useragent + helpers..
- UserAgent blocking script
- Responders
- HasScope
- Pagination
- jQuery shims
- jQuery UI (vendor + theme etc.)
- pie.htc for IE
- HTML5 shim for IE
- Airbrake + API Key
- CarrierWave (and optional cloud resizing thingy)
- rails-best-practices (and the other output gem for debugging)
- NewRelic
- EngineYard for deployment

- Backbone integration + Skim
- Ember.js integration
- Pivotal tracker


## Contributing

I'd love it if you could get involved! Feel free to suggest improvements, drones you'd like developed, or help me get test coverage up to scratch :)

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

=======
