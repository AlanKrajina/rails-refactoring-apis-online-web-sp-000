class GithubService
  attr_accessor :access_token

  def initialize(access_hash={})
    @access_token = access_hash.fetch(:access_token, access_hash["access_token"])
  end


  def authenticate!(client_id, client_secret, code)
    response = Faraday.post("https://github.com/login/oauth/access_token") do |req|
      req.body = { 'client_id': client_id, 'client_secret': client_secret, 'code': code }
      req.headers['Accept'] = 'application/json'
    end

    body = JSON.parse(response.body)
    @access_token = body["access_token"]
  end


  def get_username
    resp = Faraday.get("https://api.github.com/user") do |req|
      req.params['oauth_token'] = token
      req.params['v'] = '20160201'
    end
    JSON.parse(resp.body)["response"]["friends"]["items"]

  end



end
