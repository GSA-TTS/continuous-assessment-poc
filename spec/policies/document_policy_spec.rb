require "rails_helper"

RSpec.describe DocumentPolicy, type: :policy do
  let(:user) { User.new }
  let(:record) { Document.new }

  subject { described_class }

  permissions ".scope" do
    subject { described_class::Scope.new(user, Document) }

    it { expect(subject.resolve).to eq Document.all }
  end

  permissions :show? do
    it { expect(subject).to permit(user, record) }
  end

  context "privileged actions", control_id: "ac-3", statement_id: "ac-3_smt" do
    permissions :create?, :update?, :destroy? do
      it "users are not authorized" do
        expect(subject).not_to permit(user, record)
      end

      context "admins" do
        let(:user) { User.new admin: true }

        it "are authorized" do |example|
          expect(subject).to permit(user, record)
        end
      end
    end
  end
end
