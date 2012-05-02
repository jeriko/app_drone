class AppBuilder < Rails::AppBuilder
  include Thor::Actions
  include Thor::Shell

  # Express app templating for Rails
  # ------------------------------------
  # USAGE:
  #   1. run: `rails new app_name --builder=path/to/builder.rb` (URI's work here too)
  #   2. ???
  #   3. PROFIT!

  def test
    return
    # TODO
    # skips test framework, but we can probably just bastardize the options in the same way as with :skip_bundle
    # either make `test` build the actual directories etc., or use a script
    # either way, this method is stupid.
  end


  def gemfile
    super
# --- 
# AppDrone::Bundle
# ---
@generator.gem 'therubyracer'
@generator.gem 'compass-rails'
@generator.gem 'slim-rails'
@generator.gem 'high_voltage'
@generator.gem 'easy_roles'
@generator.gem 'underscore-rails'

run_bundle
@generator.options = @generator.options.dup
@generator.options[:skip_bundle] = true
@generator.options.freeze

  end


  def leftovers
    # --- 
# AppDrone::Javascript
# ---
js_asset_path = File.join %w(app assets javascripts application.js)
@generator.remove_file(js_asset_path)
@coffee_asset_path = File.join %w(app assets javascripts application.js.coffee)
@generator.create_file @coffee_asset_path, <<-COFFEE
//= require jquery
//= require jquery_ujs
//= require init
//= require underscore

COFFEE

@coffee_init_path = File.join %w(app assets javascripts init.js.coffee)
@generator.create_file @coffee_init_path, <<-COFFEE
$(document).ready ->
  

COFFEE

# --- 
# AppDrone::Stylesheet
# ---
@css_asset_path = File.join %w(app assets stylesheets application.css)
@generator.remove_file(@css_asset_path)
@sass_asset_path = File.join %w(app assets stylesheets application.css.sass)

@generator.create_file @sass_asset_path, <<-SASS
/*= require_self */

@import 'compass'

SASS

# --- 
# AppDrone::SlimView
# ---
erb_index_path = File.join %w(app views layouts application.html.erb)
@generator.remove_file(erb_index_path)
slim_index_path = File.join %w(app views layouts application.html.slim)
@generator.create_file slim_index_path, <<-SLIM
doctype 5
html
  head
    title #{app_name}
    = stylesheet_link_tag    'application', media: 'all'
    = javascript_include_tag 'application'
    = csrf_meta_tags

  body class=controller_name
    = yield
SLIM

# --- 
# AppDrone::HighVoltage
# ---
FileUtils.mkpath 'app/views/pages'

# --- 
# AppDrone::Flair
# ---
@generator.create_file 'app/views/pages/flair.html.slim', <<-FLAIR
h1 Flair!


h3 Underscore

button#underscoreTrigger Count to 10
span#underscoreFeedback style="color: green"

javascript:
  $(function() {
    $('#underscoreTrigger').click(function() {
      var numbers = [1,2,3,4,5,6,7,8,9,10];
      var delay = 300;
      var last = _.last(numbers);
      var feedback = $('#underscoreFeedback');

      feedback.empty();

      _.forEach(numbers, function(i) {
        setTimeout(function() {
          feedback.append(i);
          feedback.append(i == last ? '!' : ' ');
        },delay*(i-1));
      });

      setTimeout(function() { feedback.fadeOut(); }, delay*last);

    });
  });

FLAIR

# --- 
# AppDrone::Cleanup
# ---
@generator.remove_file File.join %w(public index.html)
@generator.remove_file File.join %w(app assets images rails.png)
@generator.remove_file File.join %w(README.rdoc)

    rake 'db:migrate'
    say "She's all yours, sparky!\n\n", :green
  end

end
