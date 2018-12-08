require 'rails_helper'

RSpec.describe HomesController, type: :controller do
    it "GET #index" do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
end
