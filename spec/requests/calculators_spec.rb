require 'rails_helper'

RSpec.describe "Calculators", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/calculators/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /calculate" do
    it "returns http success" do
      get "/calculators/calculate"
      expect(response).to have_http_status(:success)
    end
  end

end
