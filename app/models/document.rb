class Document < ApplicationRecord
  validates_presence_of :title, :url

  validate :url_is_https

  private

  def url_is_https
    parsed = URI(url)
    errors.add(:url, "must begin with https") unless parsed.scheme == "https"
  rescue ArgumentError
    errors.add(:url, "must begin with https")
  end
end
