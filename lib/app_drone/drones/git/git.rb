module AppDrone
class Git < Drone
  desc "Clone external resources into your app"
  category :base

  param :commit, :boolean, info: 'Commit your repo once built'

  attr_accessor :fetches

  def tmp_path; 'git_tmp' end

  def setup
    self.fetches = []
  end

  def fetch(f); self.fetches << f end

  def execute
    do! :fetch
    do_finally! :cleanup
    do_finally! :commit if param(:commit)
  end

  def locate(p)
    File.join tmp_path, p
  end

 private
  def github_repo_url(repo)
    "git://github.com/#{repo}.git"
  end

end
end
