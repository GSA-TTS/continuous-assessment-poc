require "rails_helper"

RSpec.describe Document, type: :model do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :url }
  end
end
