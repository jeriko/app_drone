module AppDrone
  class Stateflow < Drone
    desc "State machine for complex business decisions (or easy ones)"
    category :model

    depends_on :bundle

    def align
      bundle.add 'stateflow'
    end

  end
end
