class GithubService
  attr_accessor :access_token

  def initialize(access_hash={})
    @access_token = access_hash.fetch(:access_token, access_hash["access_token"])
  end


  def authenticate!(client_id, client_secret, code)
    resp = Faraday.post("https://github.com/login/oauth/access_token") do |req|
      req.body = { 'client_id': ENV["GITHUB_CLIENT"], 'client_secret': ENV["GITHUB_SECRET"], 'code': params[:code] }
      req.headers['Accept'] = 'application/json'
    end

    body = JSON.parse(response.body)
    session[:token] = body["access_token"]
    redirect_to root_path
  end

end
