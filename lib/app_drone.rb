require 'pathname'
require 'erb'
require 'active_support/inflector'

# require lib files
lib_files = %w(version dependency_chain template drone object_extensions)
lib_files.each { |f| require "app_drone/#{f}" }

module AppDrone
  def self.require_drones_at_path(drone_paths)
    drone_paths = Pathname.new(drone_paths)
    drones = drone_paths.children.select(&:directory?).map { |path| path.split.last.to_s }
    drones -= ['zzz']
    drones.each { |d| require  "#{drone_paths.to_path}/#{d}/#{d}" }
  end
end

AppDrone.require_drones_at_path "#{File.dirname(__FILE__)}/app_drone/drones"