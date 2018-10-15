# GitHubAPI::Contributors.new(url).call

module GitHubAPI
  API_BASE_URL = 'https://api.github.com/repos/'
  URL_REGEX = /\A(?<scheme>https?:\/\/)(?<host>github.com\/)(?<owner>(?:(?!\/)[\S])+)(\/)(?<repo>(?:(?!\/)[\S])+)(\/?)\z/i

  class Contributions
    include ActiveModel::Model

    attr_accessor :owner, :repo, :url, :top_contributors

    validates :url, presence: true, format: { with: URL_REGEX }

    def initialize(url)
      @url = url
      @top_contributors = []
    end

    def call
      self.top_contributors = contributors.try(:last, 3).reverse if valid?
      self
    end

    private

    def contributors
      request_data.map { |c| Contributor.new(c) }
    end

    def request_data
      response = RestClient.get contributors_url, { content_type: :json, accept: :json }
      JSON.parse(response.body)
    rescue => e
      errors.add(:base, e.message)
      []
    end

    def contributors_url
      API_BASE_URL + "#{owner}/#{repo}/stats/contributors"
    end

    def owner
      self.owner = url_match_data[:owner]
    end

    def repo
      self.repo = url_match_data[:repo]
    end

    def url_match_data
      URL_REGEX.match(url)
    end
  end
end
