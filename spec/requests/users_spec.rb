require 'rails_helper'

RSpec.describe "UsersController", type: :request do
  describe "GET /users" do
    it 'returns a success response' do
      get '/users'
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /users/:id" do 
    it 'returns a success response' do
      user = FactoryBot.create(:user)
      get "/users/#{user.to_param}"
      expect(response).to have_http_status(200)
    end
  end

end
