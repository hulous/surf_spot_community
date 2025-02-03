require "rails_helper"

RSpec.describe Spot, type: :model do
  context "when checking db struct" do
    it { is_expected.to have_db_column(:id) }
    it { is_expected.to have_db_column(:name) }
    it { is_expected.to have_db_column(:description) }
    it { is_expected.to have_db_column(:longitude) }
    it { is_expected.to have_db_column(:latitude) }
    it { is_expected.to have_db_column(:wave_size) }
    it { is_expected.to have_db_column(:difficulty) }
    it { is_expected.to have_db_column(:best_season) }
    it { is_expected.to have_db_column(:created_at) }
    it { is_expected.to have_db_column(:updated_at) }

    # # === Database (Indexes) ===
    # it { is_expected.to have_db_index(["user_id"]) }

    # # === Relationship ===
    # it { is_expected.to belong_to(:user) }
  end

  context "when a factory exist" do
    it { expect(FactoryBot.create(:spot)).to be_valid }
  end
end
