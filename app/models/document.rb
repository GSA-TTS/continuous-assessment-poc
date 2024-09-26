require "net/http"

class Document < ApplicationRecord
  validates_presence_of :title, :url

  validate :url_is_https

  def contents
    @contents ||= Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |request|
      request.get(uri.path).body
    end
  end

  private

  def uri
    @uri ||= URI(url)
  end

  def url_is_https
    parsed = URI(url)
    errors.add(:url, "must begin with https") unless parsed.scheme == "https"
  rescue ArgumentError, URI::InvalidURIError
    errors.add(:url, "must begin with https")
  end
end
