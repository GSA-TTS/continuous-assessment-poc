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

  permissions :create? do
    it { expect(subject).not_to permit(user, record) }

    context "admin" do
      let(:user) { User.new admin: true }
      it { expect(subject).to permit(user, record) }
    end
  end

  permissions :update? do
    it { expect(subject).not_to permit(user, record) }

    context "admin" do
      let(:user) { User.new admin: true }
      it { expect(subject).to permit(user, record) }
    end
  end

  permissions :destroy? do
    it { expect(subject).not_to permit(user, record) }

    context "admin" do
      let(:user) { User.new admin: true }
      it { expect(subject).to permit(user, record) }
    end
  end
end
