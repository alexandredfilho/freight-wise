require 'rails_helper'

RSpec.describe "FreightCharges", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/freight_charges/index"
      expect(response).to have_http_status(:success)
    end
  end

end
