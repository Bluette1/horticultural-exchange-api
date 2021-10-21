require 'rails_helper'
require 'devise/jwt/test_helpers'

RSpec.describe 'Mod::UsersController', type: :controller do
  describe 'success scenarios when current user is supervisor/moderator' do
    before(:each) do
      @controller = Mod::UsersController.new
      supervisor = create(:user, :supervisor, email: 'mod@example.com')
      sign_in supervisor
      user = create(:user)
      @email = user.email
      @id = user.id
      headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
      auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, supervisor)
      request.headers['Authorization'] = auth_headers
    end

    it 'GET :index' do
      get :index,
          params: { email: @email }
      assert_response :success
    end

    it 'POST :create' do
      post :create,
           params: { user: { email: 'testing@example.com', password: 'password123&' } }
      assert_response :success
    end

    it 'DESTROY :destroy' do
      delete :destroy,
             params: { id: @id }
      assert_response :success
    end
  end
  describe 'failure scenarios when current user is not supervisor/moderator' do
    before(:each) do
      @controller = Mod::UsersController.new
      curr_user = create(:user, email: 'user@example.com')
      sign_in curr_user
      user = create(:user)
      @email = user.email
      @id = user.id
      headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
      auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, curr_user)
      request.headers['Authorization'] = auth_headers
    end

    it 'GET :index' do
      get :index,
          params: { email: @email }
      assert_response :unauthorized
    end

    it 'POST :create' do
      post :create,
           params: { user: { email: 'testing@example.com', password: 'password123&' } }
      assert_response :unauthorized
    end

    it 'DESTROY :destroy' do
      delete :destroy,
             params: { id: @id }
      assert_response :unauthorized
    end
  end
end
