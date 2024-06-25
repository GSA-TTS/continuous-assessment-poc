class Document < ApplicationRecord
  validates_presence_of :title, :url
end
