require "rails_helper"

RSpec.describe User, type: :model do
  describe "#admin?" do
    context "default" do
      it { expect(subject).not_to be_admin }
    end

    context "admin" do
      subject { described_class.new admin: true }

      it { expect(subject).to be_admin }
    end
  end
end
