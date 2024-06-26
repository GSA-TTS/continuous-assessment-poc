require "rails_helper"

RSpec.describe "pages/home.html.erb", type: :view do
  before do
    assign(:documents, Document.all)
    enable_pundit(view)
  end

  it "displays the gov banner" do
    render template: "pages/home", layout: "layouts/application"
    expect(rendered).to match "An official website of the United States government"
  end
end
