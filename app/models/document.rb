class Document < ApplicationRecord
  validates_presence_of :title, :url

  validate :url_is_https

  def contents
    @contents ||= begin
      request = Net::HTTP.new(
        uri.hostname, uri.port,
        proxy&.hostname, proxy&.port, proxy&.user, proxy&.password, nil, true
      )
      request.use_ssl = true
      request.get(uri.path).body
    end
  end

  def uri
    @uri ||= URI(url)
  end

  def proxy
    @proxy_uri ||= URI(ENV["https_proxy"]) if ENV["https_proxy"].present?
  end

  private

  def url_is_https
    parsed = URI(url)
    errors.add(:url, "must begin with https") unless parsed.scheme == "https"
  rescue ArgumentError, URI::InvalidURIError
    errors.add(:url, "must begin with https")
  end
end
