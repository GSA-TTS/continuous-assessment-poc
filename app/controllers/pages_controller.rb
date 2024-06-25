class PagesController < ApplicationController
  def home
    @documents = Document.all
  end
end
