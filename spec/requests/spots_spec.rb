require "rails_helper"

RSpec.describe "/spots", type: :request do
  let(:valid_attributes) {
    {
      name:        FFaker::Lorem.name,
      description: FFaker::Lorem.paragraph(5),
      longitude:   FFaker::Geolocation.lng,
      latitude:    FFaker::Geolocation.lat,
      wave_size:   FFaker::Number.rand(15),
      difficulty:  %i[beginner intermediate pro].sample,
      best_season: %i[spring summer autumn winter].sample
    }
  }

  let!(:spot) { create(:spot, valid_attributes) }

  describe "GET /index" do
    before { get(spots_url) }

    it { expect(response).to be_successful }
  end

  describe "GET /show" do
    before { get(spot_url(spot)) }

    it { expect(response).to be_successful }
  end

  describe "GET /new" do
    before { get(new_spot_url) }

    it { expect(response).to be_successful }
  end

  describe "GET /edit" do
    before { get(edit_spot_url(spot)) }

    it { expect(response).to be_successful }
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Spot" do
        expect {
          post(spots_url, params: { spot: valid_attributes })
        }.to change(Spot, :count).by(1)
      end
    end

    context "with error" do
      before { allow_any_instance_of(Spot).to receive(:save).and_return(false) }

      it "does not creates a new Spot" do
        post(spots_url, params: { spot: valid_attributes })

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        {
          name:        FFaker::Lorem.name,
          longitude:   FFaker::Geolocation.lng,
          latitude:    FFaker::Geolocation.lat,
          wave_size:   FFaker::Number.rand(15),
          difficulty:  %i[beginner intermediate pro].sample,
          best_season: %i[spring summer autumn winter].sample
        }
      end

      it "updates the requested spot" do
        patch(spot_url(spot), params: { spot: new_attributes })
        spot.reload

        expect(spot["name"]).to eql(new_attributes[:name])
        expect(response).to redirect_to(spot_url(spot))
      end

      context "with error" do
        before { allow_any_instance_of(Spot).to receive(:update).and_return(false) }

        it "does not updates a Spot" do
          patch(spot_url(spot), params: { spot: new_attributes })

          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested spot" do
      expect {
        delete(spot_url(spot))
      }.to change(Spot, :count).by(-1)

      expect(response).to redirect_to(spots_url)
      expect(flash[:notice]).to eql(I18n.t("spot.destroy.success"))
    end

    context "with error when destroy" do
      before { allow_any_instance_of(Spot).to receive(:destroy).and_raise(ActiveRecord::InvalidForeignKey) }

      it "does not destroy a Spot" do
        delete(spot_url(spot))

        expect(response).to redirect_to(spots_url)
        expect(flash[:error]).to eql(I18n.t("spot.destroy.failure"))
      end
    end
  end
end
