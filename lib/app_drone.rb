require 'pathname'
require 'erb'
require 'active_support/inflector'

# require lib files
lib_files = %w(version template drone object_extensions)
lib_files.each { |f| require "app_drone/#{f}" }

# require all drones in app_drone/drones, exclude 'zzz' folder
drone_paths = Pathname.new(File.dirname(__FILE__) + '/app_drone/drones')
drones = drone_paths.children.select(&:directory?).map { |path| path.split.last.to_s }
drones -= ['zzz']
drones.each { |d| require "app_drone/drones/#{d}/#{d}" }

module AppDrone
  # TODO Your code goes here...
end
