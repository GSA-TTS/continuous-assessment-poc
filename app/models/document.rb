require "net/http"

class Document < ApplicationRecord
  validates_presence_of :title, :url

  validate :url_is_https

  def contents
    @contents ||= Net::HTTP.get(URI.parse(url)).force_encoding("utf-8")
  end

  private

  def url_is_https
    parsed = URI(url)
    errors.add(:url, "must begin with https") unless parsed.scheme == "https"
  rescue ArgumentError, URI::InvalidURIError
    errors.add(:url, "must begin with https")
  end
end
