require "rails_helper"

RSpec.describe User, type: :model do
  describe "#admin?", control_id: "ac-6.5", statement_id: "ac-6.5_smt", rule_ids: "system-roles-needed" do
    context "default" do
      it { expect(subject).not_to be_admin }
    end

    context "admin" do
      subject { described_class.new admin: true }

      it { expect(subject).to be_admin }
    end
  end

  it "should have a minimum password length", control_id: "ia-2", statement_id: "ia-2_smt" do
    subject.password = "12345"
    expect(subject).not_to be_valid
    expect(subject.errors[:password]).to eq ["is too short (minimum is 6 characters)"]
  end
end
