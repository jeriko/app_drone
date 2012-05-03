module AppDrone
class WillPaginate < Drone
  desc "Simple pagination library, with automatic Bootstrap integration"
  category :controller

  depends_on :bundle
  pairs_with :bootstrap

  def align
    bundle.add 'will_paginate'
    bundle.add 'bootstrap-will_paginate' if pair?(:bootstrap)
  end

end
end
