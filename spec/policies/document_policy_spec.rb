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
    it "Users cannot create a new document", control_id: "ac-3", statement_id: "ac-3_smt", assessment_plan_uuid: "4635e122-87fc-4533-b3bb-14674f2562b8" do
      expect(subject).not_to permit(user, record)
    end

    context "admin" do
      let(:user) { User.new admin: true }

      it "Admins can create a new document", control_id: "ac-3", statement_id: "ac-3_smt", assessment_plan_uuid: "4635e122-87fc-4533-b3bb-14674f2562b8" do
        expect(subject).to permit(user, record)
      end
    end
  end

  permissions :update? do
    it "Users cannot update documents", control_id: "ac-3", statement_id: "ac-3_smt", assessment_plan_uuid: "4635e122-87fc-4533-b3bb-14674f2562b8" do
      expect(subject).not_to permit(user, record)
    end

    context "admin" do
      let(:user) { User.new admin: true }

      it "Admins can update documents", control_id: "ac-3", statement_id: "ac-3_smt", assessment_plan_uuid: "4635e122-87fc-4533-b3bb-14674f2562b8" do
        expect(subject).to permit(user, record)
      end
    end
  end

  permissions :destroy? do
    it "Users cannot destroy documents", control_id: "ac-3", statement_id: "ac-3_smt", assessment_plan_uuid: "4635e122-87fc-4533-b3bb-14674f2562b8" do
      expect(subject).not_to permit(user, record)
    end

    context "admin" do
      let(:user) { User.new admin: true }

      it "Admins can destroy documents", control_id: "ac-3", statement_id: "ac-3_smt", assessment_plan_uuid: "4635e122-87fc-4533-b3bb-14674f2562b8" do
        expect(subject).to permit(user, record)
      end
    end
  end
end
