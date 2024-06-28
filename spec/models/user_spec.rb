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

  it "should have a minimum password length", control_id: "ia-2", statement_id: "ia-2_smt", assessment_plan_uuid: "acb25d5d-8e18-4400-9fbf-433b21442de4" do
    subject.password = "12345"
    expect(subject).not_to be_valid
    expect(subject.errors[:password]).to eq ["is too short (minimum is 6 characters)"]
  end
end
