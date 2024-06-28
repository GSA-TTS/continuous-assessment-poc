class PagesController < ApplicationController
  def home
    skip_authorization # skip the authorization check because we're using policy_scope here.
    @documents = policy_scope(Document)
  end
end
