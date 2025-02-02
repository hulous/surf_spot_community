require "rails_helper"

RSpec.describe User, type: :model do
  context "when checking db struct" do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :role }
    it { is_expected.to have_db_column :encrypted_password }
    it { is_expected.to have_db_column :reset_password_token }
    it { is_expected.to have_db_column :reset_password_sent_at }
    it { is_expected.to have_db_column :remember_created_at }
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }

    # === Database (Indexes) ===
    it { is_expected.to have_db_index ["email"] }
    it { is_expected.to have_db_index ["reset_password_token"] }

    # === Validations (Presence) ===
    it { is_expected.to validate_presence_of :email }
  end

  context "when a factory exist" do
    it { expect(FactoryBot.create(:user, :admin)).to be_valid }
  end

  context "when it has an email" do
    context "normal case" do
      let(:user) { FactoryBot.create(:user, :admin, email: "new@example.com") }
      it { expect(user.email).to eq("new@example.com") }
    end

    context "downcase" do
      let(:user) { FactoryBot.create(:user, :admin, email: "NEW@EXAMPLE.COM") }
      it { expect(user.email).to eq("new@example.com") }
    end

    context "without extra spaces" do
      let(:user) { FactoryBot.create(:user, :admin, email: " new@example.com ") }
      it { expect(user.email).to eq("new@example.com") }
    end
  end
end
