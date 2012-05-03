module AppDrone
class Timecop < Drone
  desc "Time-travelling, Ruby style"
  category :misc

  depends_on :bundle

  def align
    bundle.add 'timecop'
  end

end
end
