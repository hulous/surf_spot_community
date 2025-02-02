require "rails_helper"
require "byebug"

RSpec.describe UsersController, type: :controller do
  describe "#show" do
    let(:user) { create(:user, :admin) }

    subject(:show) { described_class.new.show }

    context "show user" do
      before { allow_any_instance_of(described_class).to receive(:show_user_parameters).and_return(user.id) }

      it { expect(show).to eq(user) }
    end
  end
end
