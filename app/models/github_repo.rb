class GithubRepo

  def initialize(arg)
    binding.pry
    @name = arg[name]
    @url = arg[html_url]
  end
end
