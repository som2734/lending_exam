require 'rails_helper'

RSpec.describe HistoriesController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #lend" do
    it "returns http success" do
      get :lend
      expect(response).to have_http_status(:success)
    end
  end

end
