require "rails_helper"

RSpec.describe "Users", type: :request do
  describe "GET /show" do
    let!(:user) { create(:user) }

    context "without logged user" do
      it "returns http success" do
        get(user_path(user.id))
        expect(response).to have_http_status(:found)
      end
    end

    context "with logged user" do
      before { sign_in(user) }

      it "returns http success" do
        get(user_path(user.id))
        expect(response).to have_http_status(:success)
      end
    end
  end
end
