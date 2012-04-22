module AppDrone
class DependencyChain
  # re-orders a list of drones so that every drone appears
  # after all of its dependencies

  class << self
    def satisfied?(drones)
      satisfaction_requirements(drones).empty?
    end

    def satisfaction_requirements(drones)
      all_dependencies = drones.map(&:dependencies).flatten.uniq
      return all_dependencies - drones
    end


    def sort(drones)
      raise ArgumentError unless drones.is_a?(Array)

      raise "Unsatisfied dependencies: #{satisfaction_requirements(drones)}" unless satisfied?(drones)

      misplaced_drone = drones.reverse.find do |drone|
        # working from the bottom of the list upwards,
        # try to find a drone who is below one of their dependencies
        dependency_indices(drones,drone).any? { |dependency_index| drones.index(drone) < dependency_index }
      end

      if misplaced_drone
        # move it to where it belongs
        drones_sans_misplaced = drones - [misplaced_drone]
        drone_new_index = last_dependency_index(drones_sans_misplaced,misplaced_drone) + 1
        shuffled_drones = drones_sans_misplaced.insert(drone_new_index,misplaced_drone)

        # resolve recursively
        return sort(shuffled_drones)
      else
        return drones
      end
    end

   private
    def dependency_indices(drones,drone)
      drone.dependencies.map { |d| drones.index(d) }
    end

    def last_dependency_index(drones,drone)
      dependency_indices(drones,drone).sort.last
    end
  end


end
end
