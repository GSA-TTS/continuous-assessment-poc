require "rails_helper"

RSpec.describe Document, type: :model do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :url }
    it { should allow_value("https://raw.githubusercontent.com/GSA-TTS/docker-trestle/main/templates/component-definitions/cloud_gov/component-definition.json").for :url }
    it { should_not allow_value("javascript:alert('oops')").for :url }
  end
end
