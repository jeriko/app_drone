require 'pathname'
require 'erb'

# require lib files
lib_files = %w(version template drone object_extensions)
lib_files.each { |f| require "app_drone/#{f}" }

# require all drones in app_drone/drones
drone_paths = Pathname.new('lib/app_drone/drones')
drones = drone_paths.children.select(&:directory?).map { |path| path.split.last }
drones.each { |d| require "app_drone/drones/#{d}/#{d}" }

module AppDrone
  # TODO Your code goes here...
end
