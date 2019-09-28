class GithubService
  attr_accessor :access_token

  def initialize(access_hash=nil)
    @access_token = access_hash
  end

end
